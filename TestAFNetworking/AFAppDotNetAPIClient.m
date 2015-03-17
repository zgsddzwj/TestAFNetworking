//
//  AFAppDotNetAPIClient.m
//  TestAFNetworking
//
//  Created by Adward on 14/11/24.
//  Copyright (c) 2014年 iDouKou. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"

static NSString *const AFAppDotNetAPIBaseURLString = @"https://api.app.net/";

@implementation AFAppDotNetAPIClient
+(instancetype)sharedClient{
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc]initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return _sharedClient;
}
@end
