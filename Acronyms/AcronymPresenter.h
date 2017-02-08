//
//  AcronymPresenter.h
//  Acronyms
//

#ifndef AcronymPresenter_h
#define AcronymPresenter_h

#import "AcromineModel.h"
#import "AcronymViewController.h"

@class AcronymPresenter;

@protocol AcronymPresenterDelegate <NSObject>

- (void)presenter:(AcronymPresenter * _Nonnull)viewController didSetAcronym:(NSString * _Nonnull)acronym;

@end

// Converts between business logic and views

@interface AcronymPresenter : NSObject<AcronymViewControllerDelegate>

@property (atomic, weak) id<AcronymPresenterDelegate> _Nullable delegate;

- (void)showLongFormData:(AcromineModel * _Nonnull)acromineModel;
- (void)showError:(NSError * _Nonnull)error;
- (instancetype _Nonnull)initWithViewController:(AcronymViewController  * _Nonnull)viewController;
    
@end

#endif /* AcronymPresenter_h */
