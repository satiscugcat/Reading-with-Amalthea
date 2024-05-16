#include <stdio.h>
float fahrToCelsius( float );
int main(){
    float fahr, celsius;
    int lower, upper, step;

    lower = 0;
    upper = 300; 
    step = 20;

    fahr = lower;
    while (fahr<=upper){
        printf("%3.0f %6.1f\n", fahr, fahrToCelsius(fahr));
        fahr=fahr+step;
    }
}

float fahrToCelsius(float F){
    return (5.0/9.0)*(F-32.0);
}