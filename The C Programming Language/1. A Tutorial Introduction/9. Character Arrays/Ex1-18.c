#include <stdio.h>
#define MAXLINE 1024

int getline(char line[], int maxline);
void cleanseLine(char [], int);
int main(){
    int len;
    char line[MAXLINE];

    while((len = getline(line,MAXLINE))>0) {
        cleanseLine(line,len);
        printf("%s",line);
    }
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

void cleanseLine(char uncleansedLine[], int nullPosition){
    int index;
    for(index=nullPosition-2; index>=0 && (uncleansedLine[index] =='\t' || uncleansedLine[index]=='*'); --index); //-2, -1 for the null character, another -1 for the \n
    uncleansedLine[index+1]='\0';
}