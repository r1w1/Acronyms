//
//  AcromineModel.h
//  Acronyms
//

#ifndef AcromineModel_h
#define AcromineModel_h

#import "Mantle.h"
@class AcromineLongFormsModel;

@interface AcromineModel : MTLModel<MTLJSONSerializing>

// {"sf": "HMM", "lfs": [AcromineLongFormsModel]}

@property (nonatomic, strong) NSString *sf;
@property (nonatomic, strong) NSArray<AcromineLongFormsModel *> *lfs;

@end

#endif /* AcromineModel_h */
