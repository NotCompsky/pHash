
#include <iostream>
#include <fstream> 

#include <dirent.h>
#include <errno.h>
#include <stdio.h>
#include <string.h> 
#include <algorithm>
#include <vector>
#include <thread>
#include "pHash.cpp"

using namespace std;


void free_mem(ulong64 **hashes, ulong64 **hashes2, int *lengths, int *lengths2 ){
    free(hashes);
    free(hashes2);
    free(lengths);
    free(lengths2);
    
}

int CountElemInDir(const char *dir_name) {
    struct dirent *dir_entry;
    int dir_count = 0;
    
    //Openning Dir
    DIR *dir = opendir(dir_name);
    
    //Verifing that the directory is correctly open
    if (!dir) {
        printf("unable to open directory: %s \n", dir_name);
        exit(1);
    }
    
    //count directory elements
    while ((dir_entry = readdir(dir)) != 0) {
        if (strcmp(dir_entry->d_name, ".") && strcmp(dir_entry->d_name, "..")){
            dir_count++;
        }
    }
    
    //Close Dir
    closedir(dir);
    
    return dir_count;
}

vector<string> GetListOfPath(const char *dir_name) {
    vector<string> paths;
    struct dirent *dir_entry;
    char path[100];
    path[0] = '\0';
    
    //Openning Dir
    DIR *dir = opendir(dir_name);
    
    while ((dir_entry = readdir(dir)) != 0) {
        path[0] = '\0';
        
        if (strcmp(dir_entry->d_name, ".") && strcmp(dir_entry->d_name, "..")) {
            strcat(path, dir_name);
            strcat(path, dir_entry->d_name);
            //printf("Saving file path %s\n", path);
           	paths.push_back(path);
        }
    }
    
    //Close Dir
    closedir(dir);
    
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

void task(vector<string> paths, int *lengths, ulong64 **hashes) {
	char path[100];
	path[0] = '\0';

    for(std::vector<string>::size_type i = 0; i != paths.size(); i++) {
    	path[0] = '\0';
    	strcpy(path, paths[i].c_str());
    	printf("opening file %s\n", path);

        // calculate the hash
    	hashes[i] = ph_dct_videohash(path, lengths[i]);
        if (hashes[i] == NULL){
            printf("this hash is NULL \n");
        }
    }
}

int main(int argc, char **argv) {
	int nb_threads = 1;

	if (argc == 4)
    {
    	nb_threads = atoi(argv[3]);
    } else if (argc != 3){
        printf("invalid number of arguments, please provide two paths to separate folders containing only videos\n");
        exit(1);
    }

    printf("Number of threads : %d\n", nb_threads);

    // getting directory names
    const char *dir_name = argv[1];
    int dir1_count = 0;
    const char *dir_name2 = argv[2];
    int dir2_count = 0;
    
    //Counting number of file in dir1
    dir1_count = CountElemInDir(dir_name);
    dir2_count = CountElemInDir(dir_name2);

    /*
    printf("Number of Files in dir1 %d\n", dir1_count);
    printf("Number of Files in dir2 %d\n", dir2_count);
    */
    
    //use number of files counted above to alloate proper memory
    // DIR1
    ulong64 **hashes = (ulong64 **)malloc(sizeof(ulong64 *) * (dir1_count));
    int *lengths = (int *)malloc(sizeof(int) * (dir1_count));

    // DIR2
    ulong64 **hashes2 = (ulong64 **)malloc(sizeof(ulong64 *) * (dir2_count));
    int *lengths2 = (int *)malloc(sizeof(int) * (dir2_count));
    
    //getting the list of paths
    vector<string> paths = GetListOfPath(dir_name);
    vector<string> paths2 = GetListOfPath(dir_name2);

    /*
    //printing path Recived
    printf("Paths of videos to Hash:\n");
    for (int i = 0; i < paths.size(); i++) 
        cout << paths[i] << "\n";
    for (int i = 0; i < paths2.size(); i++) 
        cout << paths2[i] << "\n";
    */

    //Get hashes
    errno = 0;
    std::vector<thread> threads(nb_threads);
    int nb_path_per_thread = paths.size()/(nb_threads-1);
    int position_in_vector = 0;
    for (int i = 0; i < nb_threads; ++i)
    {
    	//printf("Thread %d slice : %d à %d \n", i, position_in_vector, (position_in_vector+nb_path_per_thread));
    	
    	vector<string> thread_paths = slice(paths, position_in_vector, position_in_vector+nb_path_per_thread);
    	/*
    	for (int i = 0; i < thread_paths.size(); i++) 
        	cout << thread_paths[i] << "\n";
        */

    	threads[i] = thread(task, thread_paths, &lengths[position_in_vector], &hashes[position_in_vector]);

        position_in_vector = position_in_vector + nb_path_per_thread;
    }

    for (auto& th : threads) {
        th.join();
    }

    if (errno) {
        printf("error reading directory\n");
        free_mem(hashes,hashes2,lengths,lengths2);
        exit(1);
    }


    errno = 0;
    std::vector<thread> threads2(nb_threads);
    nb_path_per_thread = paths2.size()/(nb_threads-1);
    position_in_vector = 0;
    for (int i = 0; i < nb_threads; ++i)
    {
    	//printf("Thread %d slice : %d à %d \n", i, position_in_vector, (position_in_vector+nb_path_per_thread));
    	
    	vector<string> thread_paths = slice(paths2, position_in_vector, position_in_vector+nb_path_per_thread);
    	/*
    	for (int i = 0; i < thread_paths.size(); i++) 
        	cout << thread_paths[i] << "\n";
        */

        threads2[i] = thread(task, thread_paths, &lengths[position_in_vector], &hashes[position_in_vector]);

        position_in_vector = position_in_vector + nb_path_per_thread;
    }

    for (auto& th : threads2) {
        th.join();
    }

    if (errno) {
        printf("error reading directory\n");
        free_mem(hashes,hashes2,lengths,lengths2);
        exit(1);
    }

    //now we have the hashes and can move to calculating distance
    
    
    float** dist = new float*[dir2_count];
    for(int i = 0; i < dir2_count; ++i)
        dist[i] = new float[dir1_count];

    printf("calculating video distances\n");

    for(int i =0; i < dir1_count; i++){
        //for each original file, compare with all other video hashes
        for(int j = 0; j < dir2_count; j++){
            printf("dist btween vid: %d, and vid: %d\n", i,j);
            dist[i][j] = ph_dct_videohash_dist(hashes[i], lengths[i], hashes2[j], lengths2[j]);
        }
    }


    std::ofstream outfile("toto.txt");

    outfile << "my text here!" << std::endl;

    for (int i =0; i < 10; i++){

        outfile << i << "," << std::endl ;
    }

    //free up our distance array
    delete(dist);
    outfile.close();



    // free up allocated memory
    free_mem(hashes,hashes2,lengths,lengths2);

    return 0;
}
