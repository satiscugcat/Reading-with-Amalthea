#include <stdio.h>
#define MAXLINE 1024

int getline(char line[], int maxline);

int main(){
    int len;
    int threshold=80;
    char line[MAXLINE];

    while((len = getline(line,MAXLINE))>0)  if(len>threshold) printf("Length %d: %s",len,line);
        
    return 0;    
}

int getline(char s[], int lim){
    int c,i;
    
    for(i=0; i<lim-1 && (c=getchar())!=EOF && c!='\n'; ++i) 
        s[i]=c;
    
    if (c=='\n'){
        s[i]=c;
        ++i;
    }
    s[i]='\0';
    return i;
}
