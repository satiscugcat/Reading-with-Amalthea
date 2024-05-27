#include <stdio.h>

void squeeze(char[], char[]);
int main(){
    char s1[]="Hello! This is some text.";
    char s2[]="aeiou";
    squeeze(s1,s2);
    printf("%s",s1);
}

void squeeze(char s1[], char s2[]){
    int i, j, k;
    int isPresent;
    for(i=j=0; s1[i]!= '\0'; i++){
        isPresent = 0;

        for (k = 0; s2[k]!='\0';++k)
            if (s1[i] == s2[k])
                isPresent = 1;
        
        if(!isPresent)
            s1[j++] = s1[i];    
    }
    s1[j]='\0';
}