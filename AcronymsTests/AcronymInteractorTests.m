//
//  AcronymInteractorTests.m
//  Acronyms
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "OCMock.h"

#import "AcronymInteractor.h"
#import "AcronymPresenter.h"
#import "AFNetworking.h"

@interface AcronymInteractorTests : XCTestCase

@property (nonatomic,strong) AcronymInteractor *interactor;
@property (nonatomic,strong) id presenter;
@property (nonatomic,strong) id sessionManager;

@end

@implementation AcronymInteractorTests

- (void)setUp {
    [super setUp];
    
    self.presenter = OCMClassMock([AcronymPresenter class]);
    self.sessionManager = OCMClassMock([AFHTTPSessionManager class]);
    self.interactor = [[AcronymInteractor alloc] initWithPresenter:self.presenter sessionManager:self.sessionManager];
}

- (void)testWhenValidData {
    NSArray *model = [self getModel];
    id sessionDataTask = OCMClassMock([NSURLSessionDataTask class]);
    OCMStub([self.sessionManager
             GET:OCMOCK_ANY
             parameters:OCMOCK_ANY
             progress:OCMOCK_ANY
             success:([OCMArg invokeBlockWithArgs:sessionDataTask, model, nil])
             failure:OCMOCK_ANY]);

    OCMExpect([self.presenter showLongFormData:OCMOCK_ANY]);

    [self.interactor presenter:self.presenter didSetAcronym:@"hmm"];
    
    OCMVerifyAll(self.presenter);
}

- (void)testWhenNoData {
    id sessionDataTask = OCMClassMock([NSURLSessionDataTask class]);
    OCMStub([self.sessionManager
             GET:OCMOCK_ANY
             parameters:OCMOCK_ANY
             progress:OCMOCK_ANY
             success:([OCMArg invokeBlockWithArgs:sessionDataTask, @[], nil])
             failure:OCMOCK_ANY]);
    
    OCMExpect([self.presenter showLongFormData:OCMOCK_ANY]);
    
    [self.interactor presenter:self.presenter didSetAcronym:@"hmm"];
    
    OCMVerifyAll(self.presenter);
}

- (void)testWhenError {
    OCMStub([self.sessionManager
             GET:OCMOCK_ANY
             parameters:OCMOCK_ANY
             progress:OCMOCK_ANY
             success:OCMOCK_ANY
             failure:([OCMArg invokeBlock])]);
    
    OCMExpect([self.presenter showError:OCMOCK_ANY]);
    
    [self.interactor presenter:self.presenter didSetAcronym:@"hmm"];
    
    OCMVerifyAll(self.presenter);
}

// TODO ... more tests

- (NSArray *)getModel {
    NSDictionary *acromineDictionary = @{
                                      @"sf": @"HMM",
                                      @"lfs": @[
                                              @{
                                                  @"lf": @"heavy meromyosin",
                                                  @"freq": @244,
                                                  @"since": @1971,
                                                  @"vars": @[
                                                          @{
                                                              @"lf": @"heavy meromyosin 3",
                                                              @"freq": @245,
                                                              @"since": @1972
                                                              }
                                                          ]
                                                  },
                                              @{
                                                  @"lf": @"heavy meromyosin",
                                                  @"freq": @244,
                                                  @"since": @1971,
                                                  @"vars": @[
                                                          @{
                                                              @"lf": @"heavy meromyosin 3",
                                                              @"freq": @245,
                                                              @"since": @1972
                                                              },
                                                          @{
                                                              @"lf": @"heavy meromyosin 4",
                                                              @"freq": @246,
                                                              @"since": @1973
                                                              }
                                                          ]
                                                  }
                                              ]
                                      };
 
    return @[acromineDictionary];
}
     
@end
