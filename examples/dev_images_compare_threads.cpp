
#include <iostream>
#include <fstream>
#include <string>
#include <sstream> 

#include <dirent.h>
#include <errno.h>
#include <stdio.h>
#include <string.h> 
#include <algorithm>
#include <vector>
#include <thread>
#include "pHash.cpp"

using namespace std;

#define TRUE 1
#define FALSE 0




// data structure for a hash and id
struct ph_imagepoint {
    ulong64 hash;
    std::string id;
};

// aux function to create imagepoint data struct
struct ph_imagepoint *ph_malloc_imagepoint() {
    return (struct ph_imagepoint *)malloc(sizeof(struct ph_imagepoint));
}

/*
// auxiliary function for sorting list of hashes
bool cmp_lt_imp(struct ph_imagepoint dpa, struct ph_imagepoint dpb) {
    int result = strcmp(dpa.id, dpb.id);
    if (result < 0) return TRUE;
    return FALSE;
} */


vector<string> read_dir(string dir_name){
    //opens and reads directory, 
    //if a new directory is found then the function is called again recursively
    //returns a vector containing the list of paths to each image found

    vector<string> paths;
    vector<string> res;
    struct dirent *dir_entry;
    string path;
    
    DIR *dir = opendir(dir_name.c_str());
    if (!dir) {
        printf("unable to open directory: %s\n", dir_name.c_str());
        return paths;
    }

    //parse directory elements
    while ((dir_entry = readdir(dir)) != 0){
        path = "";
        path += dir_name;

        // check if elem is not special file
        if (strcmp(dir_entry->d_name, ".") && strcmp(dir_entry->d_name, "..")){
            //check if directory
            if (dir_entry->d_type == DT_DIR){
                path += dir_entry->d_name;
                path += '/';
                
                res = read_dir(path);
                //TODO: append results to our paths list
                paths.reserve(paths.size() + distance(res.begin(),res.end()));
                paths.insert(paths.end(),res.begin(),res.end());
            }

            path += dir_entry->d_name ;
            paths.push_back(path);

        }
    }
    return paths;
}

vector<string> slice(const vector<string>& v, int start=0, int end=-1) {
    int oldlen = v.size();
    int newlen;
    
    if (end == -1 or end >= oldlen){
        newlen = oldlen-start;
    } else {
        newlen = end-start;
    }
    
    vector<string> nv(newlen);
    
    for (int i=0; i<newlen; i++) {
        nv[i] = v[start+i];
    }
    return nv;
}



void task( vector<string> paths, vector<ph_imagepoint> *hashlist, int *id){
    //task for threads, reads through the files in the paths list

    for(std::vector<string>::size_type i = 0; i != paths.size(); i++){
        ph_imagepoint *h = NULL;

        h = ph_malloc_imagepoint();
        h->id = paths[i];

        ph_dct_imagehash(paths[i].c_str(), h->hash);
        hashlist->push_back(*h);

    }
    //set running state to false
    //*running = false;
}



/** TEST for image DCT hash function
 * the program takes in two directory names, each image from those directories will be compared with one another, 
 * the output of this is a csv file containing the distance between the hashes of each image 
 **/
int main(int argc, char **argv) {
    const char *msg = ph_about();
    printf(" %s\n", msg);

    int nb_threads = 1;

    if(argc == 4){

        nb_threads = atoi(argv[3]);
    }else if (argc < 3) {
            printf("no input args\n");
            printf("expected: \"test_imagephash [dir name] [dir_name]\"\n");
            exit(1);
        }
    
    char *dir_name = argv[1];
    char *dir_name2 = argv[2];

    vector<ph_imagepoint> hashlist1;  // for hashes in first directory
    vector<ph_imagepoint> hashlist2;  // for hashes in second directory
    ph_imagepoint *dp = NULL;


    vector<string> paths1 = read_dir(dir_name);
    vector<string> paths2 = read_dir(dir_name2);
    
    int nbfiles1 = paths1.size();
    printf("nb of files 1: %d \n", nbfiles1);
    int nbfiles2 = paths2.size();
    printf("nb of files 2: %d \n", nbfiles2);


    //now we can launch our threads
    int elems_per_thread = nbfiles1 / nb_threads ;
    int pos = 0;
    vector<string> thread_paths;
    vector<thread> threads(nb_threads);
    bool thread_running[nb_threads];
    

    for(int i=0; i < nb_threads; i ++){
        if (i == nb_threads -1){
            thread_paths = slice(paths1, pos, paths1.size());
        }else{
            thread_paths = slice(paths1, pos, pos + elems_per_thread);
        }

        thread_running[i] = true;
        threads[i] = thread(task, thread_paths, &hashlist1, &i);


        pos += elems_per_thread;
    }
    // wait for all threads to finish executing
    for (int i =0; i < nb_threads; i++) {
        cout << "waiting for thread " << i << endl;
        if(thread_running[i]){
            //thread is still runnning, we wait for it
            if (threads[i].joinable()){
                cout << "thread " << i << " is joinable" << endl; 
                threads[i].join();
            }else{
                cout << "thread " << i << " not joinable, not waiting" << endl;
            }
            
        }else{
            cout << "thread " << i << " finished running"<< endl;
        }

        cout << "waited for thread " << i  << endl;
    }

    //launch threads for the second directory
    elems_per_thread = nbfiles2 / nb_threads ;
    pos = 0;
    //vector<string> thread_paths;
    vector<thread> threads2(nb_threads);

    for(int i=0; i < nb_threads; i ++){
        if (i == nb_threads -1){
            thread_paths = slice(paths2, pos, paths2.size());
        }else{
            thread_paths = slice(paths2, pos, pos + elems_per_thread);
        }

        threads2[i] = thread(task, thread_paths, &hashlist2 );


        pos += elems_per_thread;
    }

    for (auto& th : threads2) {
        th.join();
    }

    
    int nbfiles = nbfiles1;
    if (nbfiles1 != nbfiles2) {
        nbfiles = (nbfiles2 > nbfiles1) ? nbfiles2 : nbfiles1;
    }

    
    double** dist = new double*[nbfiles];
    for(int i = 0; i < nbfiles; ++i)
        dist[i] = new double[nbfiles];


    printf("calculating distances between images\n");

    for (int i =0; i < nbfiles1; i ++){
        for (int j = 0; j < nbfiles2; j++){
            // array is symetric, we only work with the bottom diagonal
            if (j <= i){
                dist[i][j] = ph_hamming_distance(hashlist1[i].hash, hashlist2[j].hash);
                dist[j][i] = dist[i][j];
            }
        }
    }


    // now we write the measured distances into a file, 
    // because we can have multiple face, this file will contain a header to keep track of this

    printf("writing results to file\n");

    std::ofstream outfile("results.csv");

    for (int i =-1; i < nbfiles1; i ++){
        for (int j = 0; j < nbfiles2; j++){
            //write headers first
            if (i == -1){
                outfile << hashlist1[j].id  ;
            }else{

                // write down distances
                outfile << dist[i][j] ;
            }

            if (j < nbfiles2 ){
                    outfile << ","; 
                } 

        }
        outfile << std::endl;

    }

    outfile.close();

    return 0;
}
