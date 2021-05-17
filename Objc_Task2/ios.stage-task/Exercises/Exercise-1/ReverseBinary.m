#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 res = 0;
    int count = 8;
    if(n == 0 || n == UINT8_MAX){
        return n;
    }

    while(n>0)
    {
        res <<= 1;
        res |= n & 1;
        n >>= 1;
        count--;
    }
    res <<= count;

    return res;
}
