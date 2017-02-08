//
//  AcromineLongFormsModelTests.m
//  Acronyms
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

#import "AcromineLongFormsModel.h"

@interface AcromineLongFormsModelTests : XCTestCase

@end

@implementation AcromineLongFormsModelTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWhenDictionary_createsModel {
    NSDictionary *acromineLongFormsDictionary = @{
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
                                                 };
    
    AcromineLongFormsModel *acromineLongFormsModel = [MTLJSONAdapter modelOfClass:AcromineLongFormsModel.class fromJSONDictionary:acromineLongFormsDictionary error:NULL];
    
    XCTAssertEqual(acromineLongFormsModel.lf, @"heavy meromyosin");
    XCTAssertEqual(acromineLongFormsModel.freq.intValue, 244);
    XCTAssertEqual(acromineLongFormsModel.since.intValue, 1971);
    XCTAssertEqual(acromineLongFormsModel.vars.count, 2);
}

- (void)testWhenDictionary_WhenNoVars_createsModel {
    NSDictionary *acromineLongFormsDictionary = @{
                                                  @"lf": @"heavy meromyosin",
                                                  @"freq": @244,
                                                  @"since": @1971
                                                  };
    
    AcromineLongFormsModel *acromineLongFormsModel = [MTLJSONAdapter modelOfClass:AcromineLongFormsModel.class fromJSONDictionary:acromineLongFormsDictionary error:NULL];
    
    XCTAssertEqual(acromineLongFormsModel.lf, @"heavy meromyosin");
    XCTAssertEqual(acromineLongFormsModel.freq.intValue, 244);
    XCTAssertEqual(acromineLongFormsModel.since.intValue, 1971);
    XCTAssertEqual(acromineLongFormsModel.vars.count, 0);
}

@end
