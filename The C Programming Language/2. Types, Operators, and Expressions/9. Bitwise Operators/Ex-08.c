unsigned rightrot(unsigned x,int n){
    int unsignedSize = (sizeof (unsigned));
    int shiftAmount = n % unsignedSize;

    unsigned digitsToCycle = (x & (~(0 << shiftAmount)));
    return (x >> shiftAmount) + (digitsToCycle << (unsignedSize - shiftAmount));

}