
#include <iostream>
#include <fstream> 

#include <dirent.h>
#include <errno.h>
#include <stdio.h>
#include <string.h> 
#include <algorithm>
#include <vector>
#include "pHash.cpp"

using namespace std;


void free_mem(ulong64 **hashes, ulong64 **hashes2, int *lengths, int *lengths2 ){
    free(hashes);
    free(hashes2);
    free(lengths);
    free(lengths2);
    
}


int main(int argc, char **argv) {

    if (argc != 3){
        printf("invalid number of arguments, please provide two paths to separate folders containing only videos\n");
        exit(1);
    }

    // getting directory names
    const char *dir_name = argv[1];
    int dir1_count = 0;
    const char *dir_name2 = argv[2];
    int dir2_count = 0;

    struct dirent *dir_entry;
    
    //reading 1st directory

    DIR *dir = opendir(dir_name);
    if (!dir) {
        printf("unable to open directory 1\n");
        exit(1);
    }

    //count directory elements
    while ((dir_entry = readdir(dir)) != 0) {
        if (strcmp(dir_entry->d_name, ".") && strcmp(dir_entry->d_name, "..")){ 
            dir1_count++;
        }
    }

    DIR *dir2 = opendir(dir_name2);
    if (!dir2) {
        printf("unable to open directory 2\n");
        exit(1);
    }

    //count directory elements
    while ((dir_entry = readdir(dir2)) != 0) {
        if (strcmp(dir_entry->d_name, ".") && strcmp(dir_entry->d_name, "..")){ 
            dir2_count++;
        }
    }

    //reopen directories so we can read them again
    dir = opendir(dir_name);
    dir2 = opendir(dir_name2);


    //use number of files counted above to alloate proper memory
    // DIR1
    ulong64 **hashes = (ulong64 **)malloc(sizeof(ulong64 *) * (dir1_count));
    int *lengths = (int *)malloc(sizeof(int) * (dir1_count));

    // DIR2
    ulong64 **hashes2 = (ulong64 **)malloc(sizeof(ulong64 *) * (dir2_count));
    int *lengths2 = (int *)malloc(sizeof(int) * (dir2_count));


    // iterate over directory contents and calculate hashes of videos
    errno = 0;
    int i = 0;
    char path[100];
    path[0] = '\0';
    
    while ((dir_entry = readdir(dir)) != 0) {
        errno = 0;
        path[0] = '\0';

        if (strcmp(dir_entry->d_name, ".") && strcmp(dir_entry->d_name, "..")) {

            strcat(path, dir_name);
            strcat(path, dir_entry->d_name);
            printf("opening file %s\n", path);

            // calculate the hash
            hashes[i] = ph_dct_videohash(path, lengths[i]);
            if (hashes[i] == NULL){
                printf("failed to hash video, exiting\n");
                free_mem(hashes,hashes2,lengths,lengths2);
                exit(1);
            }
            printf("hash: %lx\n", hashes[i][0]);
            i++;
        }
        
    }

    if (errno) {
        printf("error reading directory\n");
        free_mem(hashes,hashes2,lengths,lengths2);
        exit(1);
    }


    errno = 0;
    i = 0;
    char path2[100];
    path2[0] = '\0';
    
    while ((dir_entry = readdir(dir2)) != 0) {
        errno = 0;
        path2[0] = '\0';

        if (strcmp(dir_entry->d_name, ".") && strcmp(dir_entry->d_name, "..")) {
            strcat(path2, dir_name2);
            strcat(path2, dir_entry->d_name);
            printf("opening file %s\n", path2);

            // calculate the hash
            hashes2[i] = ph_dct_videohash(path2, lengths2[i]);
            if (hashes2[i] == NULL){
                printf("failed to hash video, exiting\n");
                free_mem(hashes,hashes2,lengths,lengths2);
                exit(1);
            }  
                
            printf("hash: %lx\n", hashes2[i][0]);
            i++;
        }
        
    }

    if (errno) {
        printf("error reading directory\n");
        free_mem(hashes,hashes2,lengths,lengths2);
        exit(1);
    }


    //now we have the hashes and can move to calculating distance
    
    
    double** dist = new double*[dir2_count];
    for(int i = 0; i < dir2_count; ++i)
        dist[i] = new double[dir1_count];

    printf("calculating video distances\n");

    //open/create file to write results to and get a handler
    std::ofstream outfile("results.txt");

    for(int i =0; i < dir1_count; i++){
        //for each original file, compare with all other video hashes
        for(int j = 0; j < dir2_count; j++){
            dist[i][j] = ph_dct_videohash_dist(hashes[i], lengths[i], hashes2[j], lengths2[j]);
            printf("i:%d, j:%d distance: %lf\n", i,j,dist[i][j]);

            outfile << dist[i][j];

            if(j < dir2_count - 1){
                outfile << ",";
            }else{
                outfile << std::endl;
            }
        }
    }

    //free up our distance array

    delete(dist);
    outfile.close();



    // free up allocated memory
    free_mem(hashes,hashes2,lengths,lengths2);

    return 0;
}
