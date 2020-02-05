
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

vector<string> split_string(string& str, char delim = ' ')
{
    vector<string> split;
    std::stringstream ss(str);
    std::string token;
    while (std::getline(ss, token, delim)) {
        split.push_back(token);
    }

    return split;
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
	
    if (argc != 3){
        printf("invalid number of arguments, expected : [path to video] [output csv file path]\n");
        exit(1);
    }


    // getting directory names
    const char *video_path = argv[1];
    
    const char *out_path = argv[2];
    
    int dir1_count = 1;
    
    //use number of files counted above to alloate proper memory
    // DIR1
    ulong64 **hashes = (ulong64 **)malloc(sizeof(ulong64 *) * (dir1_count));
    int *lengths = (int *)malloc(sizeof(int) * (dir1_count));

    //Get hashes
    errno = 0;
    ulong64 *hash =  ph_dct_videohash(video_path, lengths[0]);


    std::ofstream outfile("hash.csv");

    outfile << "name,hash" << endl;
    outfile << video_path << ',' << *hash << endl;
    /*
    for(int i=-1; i< dir1_count; i++){
        for(int j =0; j < dir2_count; j++){
            //print headers
            if (i == -1){
                outfile << files[j];
            }else{
                outfile << dist[i][j];
            }

            if(j < dir2_count-1){
                outfile << ',';
            }
        }
        outfile << endl;
    }

    */

    
    //free up our distance array
    outfile.close();



    // free up allocated memory
    free(hashes);
    free(lengths);
    return 0;
}
