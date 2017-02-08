//
//  AcronymsInteractor.m
//  Acronyms
//

#import <Foundation/Foundation.h>
#import "AcronymInteractor.h"
#import "AFNetworking.h"
#import "AcromineModel.h"
#import "AcronymPresenter.h"

@interface AcronymInteractor()

@property (nonatomic, strong) AFHTTPSessionManager* sessionManager;
@property (nonatomic, strong) NSURLSessionDataTask *sessionDataTask;
@property (nonatomic, weak) AcronymPresenter *presenter;

@end

@implementation AcronymInteractor

static NSString *BASE_URL_STRING = @"https://www.nactem.ac.uk/software/acromine/";

+ (AFHTTPSessionManager*)createSessionManager {
    NSURL *baseUrl = [NSURL URLWithString:BASE_URL_STRING];
    return [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
}

- (instancetype)initWithPresenter:(AcronymPresenter *)presenter sessionManager:(AFHTTPSessionManager*)sessionManager {
    self = [super init];
    if (self) {
        _presenter = presenter;
        _presenter.delegate = self;
        _sessionManager = sessionManager;
        
        // accomodate for the fact that the response type is text/plain ...
        AFJSONResponseSerializer *jsonResponseSerializer = [AFJSONResponseSerializer serializer];
        jsonResponseSerializer.acceptableContentTypes = [NSMutableSet setWithArray:@[@"text/plain"]];
        _sessionManager.responseSerializer = jsonResponseSerializer;
    }
    return self;
}

- (void)getLongFormsForAcronym:(NSString*)acronym {
    self.sessionDataTask = [self getArticlesWithAcronym:acronym success:^(AcromineModel * _Nonnull acromineModel) {
        [self showLongFormData:acromineModel];
    } failure:^(NSError * _Nonnull error) {
        [self showError:error];
    }];
}

- (NSURLSessionDataTask *)getArticlesWithAcronym:(NSString*)acronym
                                              success:(void (^)(AcromineModel * _Nonnull acromineModel))success
                                              failure:(void (^)(NSError * _Nonnull error))failure {
    
    NSDictionary *parameters = @{@"sf": acronym, @"lf": @""};
    return [self.sessionManager GET:@"dictionary.py" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (!responseObject || ((NSArray *)responseObject).count <= 0) {
            success([[AcromineModel alloc] init]);
            return;
        }
        
        NSDictionary *acromineResponseDictionary = [(NSArray *)responseObject objectAtIndex:0];
        
        NSError *error;
        AcromineModel *acromineModel = [MTLJSONAdapter modelOfClass:AcromineModel.class
                                                 fromJSONDictionary:acromineResponseDictionary error:&error];
        
        if (error) {
            failure(error);
            return;
        }
        
        success(acromineModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)showLongFormData:(AcromineModel * _Nonnull)acromineModel {
    [self.presenter showLongFormData:acromineModel];
}

- (void)showError:(NSError * _Nonnull)error {
    [self.presenter showError:error];
}

#pragma mark AcronymPresenterDelegate

- (void)presenter:(AcronymPresenter *)presenter didSetAcronym:(NSString *)acronym {
    [self getLongFormsForAcronym:acronym];
}

@end
