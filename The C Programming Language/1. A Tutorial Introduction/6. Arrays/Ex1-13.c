#include <stdio.h>
#define MAXBUCKETNO 16

void horizontalHistogram(int [], int, int);
void verticalHistogram(int [], int, int);

int isAlphaNumeric(char);

int sum(int [], int);
int max(int [], int);

int main(){
    int wordLengths[16]={0};
    int c;
    int counter = 0;
    int state = 0;
    while((c=getchar())!=EOF){
        if(isAlphaNumeric(c)!=1);
        else{
            counter=1;
            while(isAlphaNumeric(c=getchar())){
                ++counter;
            }
            wordLengths[counter]+=1;
        }
    }
    printf("Horizontal Histogram: Bucket Size 5");
    horizontalHistogram(wordLengths, 10, 5);
    putchar('\n');
    printf("Vertical Histogram: Bucket Size 5");

    verticalHistogram(wordLengths, 10, 5);
}


void horizontalHistogram(int counts[], int length, int bucketSize){
    for(int i = 0; i<length; ++i){
        for(int k = 0; k<counts[i];++k){
            putchar('|');
        }
        if((i%bucketSize)==0) putchar('\n');
    }
}

int sum(int array[], int length){
    int output=0;
    for(int i=0; i<length; i++){
        output+=array[i];
    }
    return output;
}

int max (int array[], int length){
    int output=0;
    for(int i=0; i<length; i++){
        output = (array[i]>output)? array[i]: output; //This is the ternary operator, same thing can be done with an if statement but I'm lazy
    }
    return output;
}
void verticalHistogram(int counts[], int length, int bucketSize){
    int bucketCountArray[MAXBUCKETNO]={0};
    int bucketIndex=0;
   for(int i = 0; i<length; ++i){
        for(int k = 0; k<counts[i];++k){
            ++bucketCountArray[bucketIndex]; 
        }
        if((i%bucketSize)==0) ++bucketIndex;
    }
    
    while(sum(bucketCountArray, MAXBUCKETNO)!=0){
        int maximumCount=max(bucketCountArray,  MAXBUCKETNO);
        putchar('\n');
        for(int i=0; i<MAXBUCKETNO;i++){
            if (bucketCountArray[i]==maximumCount){
                putchar('+');
                --bucketCountArray[i];
            }
            else{
                putchar(' ');
            }
        }
    }
}


int isAlphaNumeric(char c){
    return (c >='0' && c<='9' || c>='a' && c<='z' ||c>='A' && c<='Z' )? 1 : 0;
}
