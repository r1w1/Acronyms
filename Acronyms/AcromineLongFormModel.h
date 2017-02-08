//
//  AcromineLongFormModel.h
//  Acronyms
//

#ifndef AcromineLongFormModel_h
#define AcromineLongFormModel_h

#import "Mantle.h"

@interface AcromineLongFormModel : MTLModel <MTLJSONSerializing>

//{"lf": "heavy meromyosin", "freq": 244, "since": 1971}

@property (nonatomic, strong) NSString *lf;
@property (nonatomic, strong) NSNumber *freq;
@property (nonatomic, strong) NSNumber *since;

@end

#endif /* AcromineLongFormModel_h */
