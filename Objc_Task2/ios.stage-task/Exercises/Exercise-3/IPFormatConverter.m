#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if(!numbersArray || !numbersArray.count){
        return  @"";
    }
    
    NSMutableArray *resultSegements = [NSMutableArray new];
    for(int i = 0; i<4; i++){
        NSNumber *segment = i < numbersArray.count ? [numbersArray objectAtIndex:i]: @(0);
        
        int intSegment = [segment intValue];
        if(intSegment > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        
        if(intSegment < 0){
            return  @"Negative numbers are not valid for input.";
        }
        
        [resultSegements addObject:segment];
    }
    
    return [resultSegements componentsJoinedByString:@"."];
}

@end
