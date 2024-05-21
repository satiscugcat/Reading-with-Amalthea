#include <stdio.h>
#define TABSPACE 8
int main(){
    int currentLineWidth=0;
    char c;
    while((c=getchar())!=EOF){
        switch(c){
            case '\n':
                putchar(c);
                currentLineWidth=0;
                break;
            case '\t':
                putchar(' ');
                ++currentLineWidth;
                while ((currentLineWidth%TABSPACE)!=0){
                    putchar(' ');
                    ++currentLineWidth;
                    }
                break;
            default:
                putchar(c);
                ++currentLineWidth;
                break;
        }
    }
}