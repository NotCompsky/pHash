
#include <dirent.h>
#include <fstream> 
#include <iostream>
#include <errno.h>
#include <stdio.h>
#include <algorithm>
#include <vector>
#include "pHash.h"
#include <string.h> 

using namespace std;

#define TRUE 1
#define FALSE 0

// data structure for a hash and id
struct ph_imagepoint {
    ulong64 hash;
    char *id;
};

// aux function to create imagepoint data struct
struct ph_imagepoint *ph_malloc_imagepoint() {
    return (struct ph_imagepoint *)malloc(sizeof(struct ph_imagepoint));
}

// auxiliary function for sorting list of hashes
bool cmp_lt_imp(struct ph_imagepoint dpa, struct ph_imagepoint dpb) {
    int result = strcmp(dpa.id, dpb.id);
    if (result < 0) return TRUE;
    return FALSE;
}

int count_dir_elements(char *dir_name ){
    return 0;
}

/** TEST for image DCT hash function
 * the program takes in two directory names, each image from those directories will be compared with one another, 
 * the output of this is a csv file containing the distance between the hashes of each image 
 **/
int main(int argc, char **argv) {
    const char *msg = ph_about();
    printf(" %s\n", msg);

    if (argc < 3) {
        printf("no input args\n");
        printf("expected: \"test_imagephash [dir name] [dir_name]\"\n");
        exit(1);
    }
    const char *dir_name = argv[1];
    const char *dir_name2 = argv[2];
    struct dirent *dir_entry;
    struct dirent *dir_entry_inside;
    vector<ph_imagepoint> hashlist1;  // for hashes in first directory
    vector<ph_imagepoint> hashlist2;  // for hashes in second directory
    ph_imagepoint *dp = NULL;

    // first directory
    DIR *dir = opendir(dir_name);
    if (!dir) {
        printf("unable to open directory\n");
        exit(1);
    }
    errno = 0;
    int i = 0;
    ulong64 tmphash;
    char path[100];
    path[0] = '\0';
    while ((dir_entry = readdir(dir)) != 0) {
        
        if (strcmp(dir_entry->d_name, ".") && strcmp(dir_entry->d_name, "..")){
            
            // check if the file is a directory
            if (dir_entry->d_type == DT_DIR){
                // we get the images contained in this directory
                //open directory

                printf("directory: %s\n", dir_entry->d_name);

                char inside_path[200];
                inside_path[0] = '\0';

                strcat(inside_path, dir_name);
                strcat(inside_path, dir_entry->d_name);
                strcat(inside_path, "/");

                DIR *dir_inside = opendir(inside_path);

                while( (dir_entry_inside = readdir(dir_inside)) != 0 ){
                    errno = 0;
                    path[0] = '\0';

                    if (strcmp(dir_entry_inside->d_name, ".") && strcmp(dir_entry_inside->d_name, "..")) {
                        strcat(path, dir_name);
                        strcat(path, "/");
                        strcat(path, dir_entry->d_name);
                        strcat(path, "/");
                        strcat(path, dir_entry_inside->d_name);

                        /*printf("dir name: %s\n" , dir_name);
                        printf("dir entry: %s\n", dir_entry->d_name);
                        printf("dir inside: %s\n", dir_entry_inside->d_name);
                        printf("folder1: %s\n", path);
                        */

                        if (ph_dct_imagehash(path, tmphash) < 0)  // calculate the hash
                            continue;
                        dp = ph_malloc_imagepoint();  // store in structure with file name
                        dp->id = dir_entry_inside->d_name;
                        dp->hash = tmphash;
                        hashlist1.push_back(*dp);
                        i++;
                    }                
                    
                }
                
            }
            
        }
        
    }

    if (errno) {
        printf("error reading directory\n");
        exit(1);
    }


    // remove sort to keep track of files in order ?
    //sort(hashlist1.begin(), hashlist1.end(), cmp_lt_imp);

    // second directory
    dir_entry = NULL;
    DIR *dir2 = opendir(dir_name2);
    if (!dir) {
        printf("unable to open directory\n");
        exit(1);
    }
    errno = 0;
    path[0] = '\0';
    i = 0;
    while ((dir_entry = readdir(dir2)) != 0) {

        if (strcmp(dir_entry->d_name, ".") && strcmp(dir_entry->d_name, "..")){

            // check if the file is a directory
            if (dir_entry->d_type == DT_DIR){
                // we get the images contained in this directory
                //open directory

                char inside_path[200];
                inside_path[0] = '\0';
                
                strcat(inside_path, dir_name2);
                strcat(inside_path, dir_entry->d_name);
                strcat(inside_path, "/");

                printf("directory2: %s\n", inside_path);

                DIR *dir_inside = opendir(inside_path);

                while( (dir_entry_inside = readdir(dir_inside)) != 0 ){
                    errno = 0;
                    path[0] = '\0';
                    
                    if (strcmp(dir_entry_inside->d_name, ".") && strcmp(dir_entry_inside->d_name, "..")) {
                        strcat(path, dir_name2);
                        strcat(path, "/");
                        strcat(path, dir_entry->d_name);
                        strcat(path, "/");
                        strcat(path, dir_entry_inside->d_name);

                        if (ph_dct_imagehash(path, tmphash) < 0)  // calculate the hash
                            continue;
                        dp = ph_malloc_imagepoint();  // store in structure with filename
                        dp->id = dir_entry->d_name;
                        dp->hash = tmphash;
                        hashlist2.push_back(*dp);
                        i++;
                    }
                    
                }
                
            }
        }
        
    }

    if (errno) {
        printf("error reading directory\n");
        exit(1);
    }

    //sort(hashlist2.begin(), hashlist2.end(), cmp_lt_imp);

    int nbfiles1 = hashlist1.size();
    printf("nb of files 1: %d \n", nbfiles1);
    int nbfiles2 = hashlist2.size();
    printf("nb of files 2: %d \n", nbfiles2);



    
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
