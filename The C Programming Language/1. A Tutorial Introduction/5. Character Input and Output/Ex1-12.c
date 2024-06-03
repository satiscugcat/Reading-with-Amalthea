#include <stdio.h>

int isAlphaNumeric(int c);
int main(){
    int c;
    while((c=getchar())!=EOF){
        if(isAlphaNumeric(c));
        else{
            putchar(c);
            while(isAlphaNumeric(c=getchar())){
                putchar(c);
            }
            putchar('\n');
        }
    }
}

int isAlphaNumeric(int c){
    return ((c >='0' && c<='9') || (c>='a' && c<='z') || (c>='A' && c<='Z') );
}
