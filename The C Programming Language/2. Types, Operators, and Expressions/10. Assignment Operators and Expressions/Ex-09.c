// Suppose there is a number whose binary word is of the form ..100..00
// on doing x-1, that turns into ..011..11 with nothing else changed
// on soing x & x-1, we thus get ..000..00 with nothing else changed

int bitcount(unsigned x){
    int b;
    for(b=0; x!=0; x&=(x-1)) ++b;
    return b;
}

// The for loop deletes a 1 in each step.