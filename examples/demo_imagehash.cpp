
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






/** TEST for image DCT hash function
 * the program takes in two directory names, each image from those directories will be compared with one another, 
 * the output of this is a csv file containing the distance between the hashes of each image 
 **/
int main(int argc, char **argv) {
    const char *msg = ph_about();
    printf(" %s\n", msg);

    int nb_threads = 1;

    if(argc == 3){

        nb_threads = atoi(argv[2]);
    }else if (argc < 2) {
            printf("no input args\n");
            printf("expected: \"test_imagephash [dir name] nb_threads\"\n");
            exit(1);
        }
    
    char *dir_name = argv[1];
    //char *dir_name2 = argv[2];

    vector<ph_imagepoint> hashlist1;  // for hashes in first directory
    //vector<ph_imagepoint> hashlist2;  // for hashes in second directory
    ph_imagepoint *dp = NULL;


    vector<string> paths1 = read_dir(dir_name);
    //vector<string> paths2 = read_dir(dir_name2);
    
    int nbfiles1 = paths1.size();
    printf("nb of files 1: %d \n", nbfiles1);
    ph_imagepoint *h = NULL;
    ulong64 tmphash;
    h = ph_malloc_imagepoint();
    vector<ulong64> hashlist;


    for(int i = 0; i  < paths1.size(); i++){
        
        //printf("cal for path %s\n", paths1[i].c_str());
        
        ph_dct_imagehash(paths1[i].c_str(), tmphash);
        
        //h->id = paths1[i];
        //h->hash = tmphash;
        
        //hashlist1.push_back(tmp);
        hashlist.push_back(tmphash);
    }
    

    
    printf("writing results to file\n");

    std::ofstream outfile("image_hash.csv");
    outfile << "name,hash" << endl;
    for(int i = 0; i < nbfiles1; i++){
        outfile <<paths1[i] << ',' << hashlist[i] << endl;
    }

    outfile.close();

    return 0;
}
