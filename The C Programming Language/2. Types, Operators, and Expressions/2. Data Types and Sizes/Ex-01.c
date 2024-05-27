#include <limits.h>
#include <float.h>
#include <stdio.h>

int main(){
    printf("Maximum value of char: %d\n", CHAR_MAX);
    printf("Minimum value of char: %d\n", CHAR_MIN);

    printf("Maximum value of int: %d\n", INT_MAX);
    printf("Minimum value of int: %d\n", INT_MIN);

    printf("Maximum value of long: %d\n", LONG_MAX);
    printf("Minimum value of long: %d\n", LONG_MIN);

    printf("Maximum value of short: %d\n", SHRT_MAX);
    printf("Minimum value of short: %d\n", SHRT_MIN);

    printf("Maximum value of unsigned char: %u\n", UCHAR_MAX);
    printf("Maximum value of unsigned int: %u\n", UINT_MAX);
    printf("Maximum value of unsigned long: %u\n", ULONG_MAX);
    printf("Maximum value of unsigned short: %u\n", USHRT_MAX);

    printf("Maximum value of floating point: %f\n", FLT_MAX);
    printf("Minimum value of floating point: %f\n", FLT_MIN);
}