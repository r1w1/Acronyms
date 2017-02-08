//
//  AcronymViewController.h
//  Acronyms
//

#ifndef AcronymViewController_h
#define AcronymViewController_h

#import <UIKit/UIKit.h>

@class AcronymViewController;

@protocol AcronymViewControllerDelegate <NSObject>

- (void)viewController:(AcronymViewController * _Nonnull)viewController didSetAcronym:(NSString * _Nonnull)acronym;

@end

@interface AcronymViewController: UITableViewController<UISearchBarDelegate>

@property (atomic, weak) id<AcronymViewControllerDelegate> _Nullable delegate;

- (void)updateResults:(NSArray<NSString *> * _Nonnull)longForms;
- (void)showProgress;
- (void)hideProgress;
- (void)showAlertWithTitle:(NSString * _Nonnull)title message:(NSString * _Nonnull)message;

@end

#endif /* AcronymViewController_h */
