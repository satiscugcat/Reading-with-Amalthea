#include <stdio.h>
#define TABSPACE 8

int spaceTillNexTabStop(int lineWidth) {return (TABSPACE-lineWidth % TABSPACE);}
int main(){
    int currentLineWidth=0;
    int spaceCounter=0;
    char c;
    while((c=getchar())!=EOF){
        switch(c){
            case '\n':
                putchar(c);
                currentLineWidth=0;
                break;
            case '\t':
                ++currentLineWidth;
                currentLineWidth+=spaceTillNexTabStop(currentLineWidth);
                putchar(c);
                break;
            case ' ':
                ++spaceCounter;
                while((c=getchar())==' ') ++spaceCounter;
                if(spaceTillNexTabStop(currentLineWidth)<=spaceCounter){
                    putchar('\t');
                    spaceCounter-=spaceTillNexTabStop(currentLineWidth);
                    currentLineWidth+=spaceTillNexTabStop(currentLineWidth);
                    int noOfTabs =  (int) (spaceCounter/TABSPACE);
                    
                    // This has the same effect as floor(spaceCounter/TABSPACE)
                    
                    for(int i=0; i<noOfTabs; ++i){
                        putchar('\t');
                        spaceCounter-=TABSPACE;
                        currentLineWidth+=TABSPACE;
                    }
                }
                for(;spaceCounter>0;--spaceCounter){
                    putchar(' ');
                    ++currentLineWidth;
                }
                putchar(c);
                ++currentLineWidth;
                break;
            default:
                putchar(c);
                ++currentLineWidth;
                break;
        }
    }
}