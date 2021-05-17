#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    if(!array || array.count<2){
        return 0;
    }
    NSInteger result = 0;
    NSSet *set = [NSSet setWithArray:array];
    NSArray *sorted = [array sortedArrayUsingSelector:@selector(compare:)];
    
    for (int i=0; i< sorted.count-1; i++) {
        NSNumber *target = [NSNumber numberWithInt:[sorted[i] intValue]+[number intValue]];
        if([set containsObject:target]){
            result++;
        }
    }
    
    return result;
}

@end
