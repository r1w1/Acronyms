//
//  AcromineModel.m
//  Acronyms
//

#import <Foundation/Foundation.h>

#import "AcromineModel.h"
#import "AcromineLongFormsModel.h"

@interface AcromineModel()

@end

@implementation AcromineModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"sf": @"sf",
             @"lfs": @"lfs"
             };
}

+ (NSValueTransformer *)lfsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:AcromineLongFormsModel.class];
}

@end

