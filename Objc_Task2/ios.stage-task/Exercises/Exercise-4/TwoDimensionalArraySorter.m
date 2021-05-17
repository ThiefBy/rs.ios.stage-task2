#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if(!array || array.count == 0){
        return @[];
    }
    
    NSMutableArray *numbers = [NSMutableArray new];
    NSMutableArray *strings = [NSMutableArray new];
    for (NSArray *subArray in array) {
        if(![subArray isKindOfClass:[NSArray class]] || subArray.count==0)
        {
            continue;
        }
        id firstElement = [subArray firstObject];
        BOOL isNumber = [firstElement isKindOfClass:[NSNumber class]];
        if(isNumber){
            [numbers addObjectsFromArray:subArray];
        }else{
            [strings addObjectsFromArray:subArray];
        }
    }
    NSMutableArray *result = [NSMutableArray new];
    if(numbers.count > 0){
        [result addObjectsFromArray:[numbers sortedArrayUsingSelector:@selector(compare:)]];
    }
    
    if(strings.count > 0){
        NSSortDescriptor *sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: result.count==0];
        [result addObjectsFromArray:[strings sortedArrayUsingDescriptors: @[sortOrder]]];
    }
    
    return result.count == 1 ? result[0] : result;
}

@end
