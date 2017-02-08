//
//  AcromineLongFormModel.m
//  Acronyms
//

#import <Foundation/Foundation.h>
#import "AcromineLongFormModel.h"

@interface AcromineLongFormModel()

@end

@implementation AcromineLongFormModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"lf": @"lf",
             @"freq": @"freq",
             @"since": @"since"
             };
}

@end
