unsigned setbits(unsigned x, int p, int n, unsigned y){
    unsigned xMask = ~(~(~0 << n) << (p + 1 - n));
    unsigned yMask = ~(~0 << n);
    return (x & xMask) | ((y & yMask) << (p + 1 - n));
}