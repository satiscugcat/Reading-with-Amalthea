#include <stdio.h>

void any(char[], char[]);
int main(){

}

void any(char s1[], char s2[]){
    int i, k;
    int isPresent;
    for(i=0; s1[i]!= '\0'; i++){
        isPresent = 0;

        for (k = 0; s2[k]!='\0';++k)
            if (s1[i] == s2[k])
                isPresent = 1;
        
        if(isPresent)
            return  i; 
    }
    return -1;
}