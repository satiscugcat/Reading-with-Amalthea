#include <stdio.h>

#define ON 1
#define OFF 0

int main(){
    int c;
    int SWITCH=OFF;
    while((c=getchar())!=EOF){
        if(c==' '){
            if(!SWITCH){
                putchar(c);
                SWITCH=ON;
            }
        } else{
            putchar(c);
            SWITCH=OFF;
        }
    }
}
