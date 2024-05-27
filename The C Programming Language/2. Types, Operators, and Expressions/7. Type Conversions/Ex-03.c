#include <stdio.h>
int htoi(char[]);
int hexCharToDec(char);
int main(){
    char hexString[]="0xaa";
    printf("%d\n", htoi(hexString));
}

int htoi(char hexString[]){
    int numStart=0;
    int nullPos=0;

    while(hexString[nullPos]!='\0') ++ nullPos;

    if (nullPos >= 2){
        if(hexString[0]=='0' && (hexString[1]=='x'|| hexString[1]=='X')){
            numStart=2;
        }
    }

    int output=0;
    for(;hexString[numStart]!='\0'; ++numStart)
        output = output*16 + hexCharToDec(hexString[numStart]);
    
    return output;
}

int hexCharToDec(char c){
    if(c>= '0' && c<='9') return c-'0';
    if(c>= 'a' && c<='f') return c-'a'+10;
    if(c>= 'A' && c<='F') return c-'A'+10;
    printf("Non-hexadecimal digit %c given\n",c);
    return -1;
}