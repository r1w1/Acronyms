//
//  AcromineLongFormModelTests.m
//  Acronyms
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

#import "AcromineLongFormModel.h"

@interface AcromineLongFormModelTests : XCTestCase

@end

@implementation AcromineLongFormModelTests

- (void)setUp {
    [super setUp];

}

- (void)tearDown {
    [super tearDown];
}

- (void)testWhenDictionary_createsModel {
    NSDictionary *acromineLongFormDictionary = @{
                                                 @"lf": @"heavy meromyosin",
                                                 @"freq": @244,
                                                 @"since": @1971
                                                 };
    
    AcromineLongFormModel *acromineLongFormModel = [MTLJSONAdapter modelOfClass:AcromineLongFormModel.class fromJSONDictionary:acromineLongFormDictionary error:NULL];
    
    XCTAssertEqual(acromineLongFormModel.lf, @"heavy meromyosin");
    XCTAssertEqual(acromineLongFormModel.freq.intValue, 244);
    XCTAssertEqual(acromineLongFormModel.since.intValue, 1971);
}

@end
