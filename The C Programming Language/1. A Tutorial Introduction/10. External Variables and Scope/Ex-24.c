#include <stdio.h>


char bracketKeepTrack[128]={0};
int bracketIndex = 0;

int lineNumber=1;
int characterNumber=1;

void parseLineComment();
void parseMultiLineComment();
void parseString(char);
void openBracket(char);
void closeBracket(char);
void callError(char);
int main(){
    char c=getchar();
    int openParenthesesCount;
    
    while (c!=EOF){
        switch(c){
            case '[':
            case '(':
            case '{':

                openBracket(c);
                break;
            case ']':
            case ')':
            case '}':
                closeBracket(c);
                break;

            case '\'':
            case '"':
                parseString(c);
                break;
            
            case '/':
                c=getchar();
                ++bracketIndex;
                if(c=='/'){
                    parseLineComment();
                    ++lineNumber;
                    characterNumber=0;
                }else if(c=='*'){
                    parseMultiLineComment();
                } else{
                    continue;
                }
                break;
            
            case '\n':
                ++lineNumber;
                characterNumber=0;
            default:
                putchar(c);
                break;
        }
        c=getchar();
        ++characterNumber;
    }
    if(bracketIndex!=0){
        while(bracketIndex>0){
            --bracketIndex;
            printf("Unmatched %c\n",bracketKeepTrack[bracketIndex]);        
        }
    }
}

void parseString(char marker){
    char c = getchar();
    ++characterNumber;
    while(c!= EOF && c!= marker){
        if(c=='\\'){getchar(); ++characterNumber;} 
        c = getchar();
        ++characterNumber;
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
            while(c=='*' && c!=EOF && c!='/'){
                c=getchar();
            }
            if(c=='/' || c==EOF) return;
        }
        ++characterNumber;
        if(c=='\n'){
            ++lineNumber;
            characterNumber=0;
        }
    }
}


void openBracket(char c){
    bracketKeepTrack[bracketIndex]=c;
    ++bracketIndex;
}

void closeBracket(char c){
    if(bracketIndex==0) {
        callError(c);
        return;
    }
    switch(c){
        case ']':
            if (bracketKeepTrack[bracketIndex-1] == '['){
                --bracketIndex;
                bracketKeepTrack[bracketIndex]=0;
            } else callError(c);

            break;
        case '}':
            if (bracketKeepTrack[bracketIndex-1] == '{'){
                --bracketIndex;
                bracketKeepTrack[bracketIndex]=0;
            } else callError(c);
            break;
        case ')':
            if (bracketKeepTrack[bracketIndex-1] == '('){
                --bracketIndex;
                bracketKeepTrack[bracketIndex]=0;
            } else callError(c);
        break;
    }
    return;
}

void callError(char c){
    printf("Error at line %d, character %d: Unmatched %c\n",lineNumber, characterNumber,c);
}
