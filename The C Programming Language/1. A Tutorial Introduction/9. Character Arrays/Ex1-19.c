#include <stdio.h>
void reverse(char []);

int main(){
    char s[]="Hello World!";
    reverse(s);
    printf("%s",s);
}

void reverse(char s[]){
    int nullIndex, i;
    char temp;
    for(nullIndex=0; s[nullIndex]!='\0';++nullIndex);
    for(i=0; i<nullIndex/2;++i ){
        temp=s[i];
        s[i]=s[nullIndex-i-1];
        s[nullIndex-i-1]=temp;
    }
}
