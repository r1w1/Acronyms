//
//  AcromineLongFormsModel.m
//  Acronyms
//

#import <Foundation/Foundation.h>
#import "AcromineLongFormsModel.h"
#import "AcromineLongFormModel.h"

@interface AcromineLongFormsModel()

@end

@implementation AcromineLongFormsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"lf": @"lf",
             @"freq": @"freq",
             @"since": @"since",
             @"vars": @"vars"
             };
}

+ (NSValueTransformer *)varsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:AcromineLongFormModel.class];
}

@end
