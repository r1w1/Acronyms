//
//  AcromineLongFormsModel.h
//  Acronyms
//

#ifndef AcromineLongFormsModel_h
#define AcromineLongFormsModel_h

#import "Mantle.h"
@class AcromineLongFormModel;

@interface AcromineLongFormsModel : MTLModel<MTLJSONSerializing>

//{"lf": "heavy meromyosin", "freq": 244, "since": 1971, "vars": [AcromineLongFormModel]}

@property (nonatomic, strong) NSString *lf;
@property (nonatomic, strong) NSNumber *freq;
@property (nonatomic, strong) NSNumber *since;
@property (nonatomic, strong) NSArray<AcromineLongFormModel *> *vars;

@end

#endif /* AcromineLongFormsModel_h */
