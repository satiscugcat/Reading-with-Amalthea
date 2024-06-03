unsigned invert(unsigned x, int p, int n){
    unsigned xMask = ~(~(~0 << n) << (p + 1 - n));
    return (x & xMask) | (~x & ~xMask);
}