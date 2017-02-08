//
//  AcromineModelTests.m
//  Acronyms
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

#import "AcromineModel.h"
#import "AcromineLongFormsModel.h"

@interface AcromineModelTests : XCTestCase

@end

@implementation AcromineModelTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWhenDictionary_createsModel {
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
    
    AcromineModel *acromineModel = [MTLJSONAdapter modelOfClass:AcromineModel.class fromJSONDictionary:acromineDictionary error:NULL];
    
    XCTAssertEqual(acromineModel.sf, @"HMM");
    XCTAssertEqual(acromineModel.lfs.count, 2);
    XCTAssertEqual([acromineModel.lfs objectAtIndex:0].vars.count, 1);
    XCTAssertEqual([acromineModel.lfs objectAtIndex:1].vars.count, 2);
}

- (void)testWhenDictionary_WhenNoLfs_createsModel {
    NSDictionary *acromineDictionary = @{
                                         @"sf": @"HMM"
                                        };
    
    AcromineModel *acromineModel = [MTLJSONAdapter modelOfClass:AcromineModel.class fromJSONDictionary:acromineDictionary error:NULL];
    
    XCTAssertEqual(acromineModel.sf, @"HMM");
    XCTAssertEqual(acromineModel.lfs.count, 0);
}

@end
