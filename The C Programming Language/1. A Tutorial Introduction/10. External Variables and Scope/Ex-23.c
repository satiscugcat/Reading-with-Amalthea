#include <stdio.h>
char* s = " \" ";
void parseLineComment();
void parseMultiLineComment();
void parseString(char);

int main(){
    char c=getchar();
    while (c!=EOF){
        switch(c){
            case '\'':
            case '"':
                parseString(c);
                break;
            case '/':
                c=getchar();
                if(c=='/'){
                    parseLineComment();
                }else if(c=='*'){
                    parseMultiLineComment();
                } else{
                    putchar('/');
                    continue;
                }
                break;
            default:
                putchar(c);
                break;
        }
        c=getchar();
    }
}

void parseString(char marker){
    char c = getchar();
    while(c!= EOF && c!= marker){
        if(c=='\\') getchar();
        c = getchar();
    }

}


void parseLineComment(){
    char c = getchar();
    while(c!= EOF && c!= '\n'){
        c = getchar();
    }
    if(c=='\n') putchar(c);
}

void parseMultiLineComment(){
    char c;
    int inAsteriskString=0;
    while((c = getchar())!=EOF){
        if(c=='*'){
            inAsteriskString=1;
            while(inAsteriskString){
                c=getchar();
                switch(c){
                    case EOF:
                    case '/':
                        return;
                    case '*': break;
                    default: 
                        inAsteriskString=0;
                        break;
                }

            }
        }
    }
}