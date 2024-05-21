#include <stdio.h>
#define TABSPACE 8
#define MAXWORD 256

int spaceTillNexTabStop(int lineWidth) {return (TABSPACE-lineWidth % TABSPACE);}

int main(){
    int currentLineWidth=0;
    char c;
    char wordContainer[MAXWORD] ={0};
    int wordLength=0;
    int lineThreshold = 64;

    while((c=getchar())!=EOF){
        switch(c){
            case '\n':
                putchar(c);
                currentLineWidth=0;
                break;
            case '\t':
                putchar(c);
                currentLineWidth+=spaceTillNexTabStop(currentLineWidth); 
                // Since lineThreshold is a multiple of 8, the TABSTOP, we dont have to deal with the case where \t would cause the cursor to go past the threshold
                //think of how you would deal with it uf that were not the case!
                break;
            case '*':
                putchar(c);
                ++currentLineWidth;
                break;
            default:

                wordContainer[0]=c; // first character
                ++wordLength;
                c=getchar();
                while(c!='*' && c!='\t' &&  c!='\n' && c!=EOF && wordLength<MAXWORD-1){  // subsequent characters
                    wordContainer[wordLength]=c;
                    ++wordLength;
                    c=getchar();
                }
                wordContainer[wordLength]='\0';
                if(currentLineWidth+wordLength>lineThreshold){
                    putchar('\n');
                    printf("%s",wordContainer);
                    currentLineWidth=wordLength;
                } else{
                    printf("%s",wordContainer);
                    currentLineWidth+=wordLength;
                }
                wordLength=0;

                if(currentLineWidth!=lineThreshold) {
                    ++currentLineWidth; 
                    putchar(c);
                }
                break;

               
        }
         if(currentLineWidth>=lineThreshold){
            putchar('\n');
            currentLineWidth=0;
        }
    }
}
