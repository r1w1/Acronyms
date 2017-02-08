//
//  AcronymPresenter.m
//  Acronyms
//

#import <UIKit/UIKit.h>
#import "AcronymPresenter.h"
#import "AcromineModel.h"
#import "AcromineLongFormsModel.h"

@interface AcronymPresenter()

@property (atomic, weak) AcronymViewController *viewController;

@end

@implementation AcronymPresenter

-(instancetype)initWithViewController:(AcronymViewController *)viewController {
    self = [super init];
    if(self) {
        _viewController = viewController;
        _viewController.delegate = self;
    }
    return self;
}

- (void)showLongFormData:(AcromineModel * _Nonnull)acromineModel {
    NSMutableArray<NSString *> *highLevelLongForms = [[NSMutableArray alloc] initWithCapacity:acromineModel.lfs.count];
    [acromineModel.lfs enumerateObjectsUsingBlock:^(AcromineLongFormsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [highLevelLongForms addObject:obj.lf];
    }];
    
    [self.viewController hideProgress];
    [self.viewController updateResults:highLevelLongForms];
    if (highLevelLongForms.count <= 0) {
        [self.viewController showAlertWithTitle:@"Acronyms" message:@"No long form results found."];
    }
}

- (void)showError:(NSError * _Nonnull)error {
    // we ignore the error details. instead we clear the search results and show alert.
    [self.viewController hideProgress];
    [self.viewController updateResults:@[]];
    [self.viewController showAlertWithTitle:@"Acronyms" message:@"An error occured. Please try again."];
}

#pragma mark AcronymViewControllerDelegate

- (void)viewController:(AcronymViewController *)viewController didSetAcronym:(NSString *)acronym {
    [self.viewController showProgress];
    [self.delegate presenter:self didSetAcronym:acronym];
}

@end
