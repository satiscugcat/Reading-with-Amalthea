#include <stdio.h>

int isAlphaNumeric(char c);
int main(){
    char c;
    while((c=getchar())!=EOF){
        if(c==' '||c=='\t'||c=='\n');
        else{
            putchar(c);
            while(isAlphaNumeric(c=getchar())){
                putchar(c);
            }
            putchar('\n');
        }
    }
}

int isAlphaNumeric(char c){
    return (c >='0' && c<='9' || c>='a' && c<='z' ||c>='A' && c<='Z' )? 1 : 0;
}