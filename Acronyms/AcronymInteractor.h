//
//  AcronymsInteractor.h
//  Acronyms
//

#ifndef AcronymsInteractor_h
#define AcronymsInteractor_h

#import "AcronymPresenter.h"
@class AFHTTPSessionManager;

// Business logic + network interactions

@interface AcronymInteractor : NSObject<AcronymPresenterDelegate>

+ (AFHTTPSessionManager*)createSessionManager;

- (instancetype)initWithPresenter:(AcronymPresenter *)presenter sessionManager:(AFHTTPSessionManager*)sessionManager;

@end

#endif /* AcronymInteractor_h */
