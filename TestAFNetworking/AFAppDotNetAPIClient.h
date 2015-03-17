//
//  AFAppDotNetAPIClient.h
//  TestAFNetworking
//
//  Created by Adward on 14/11/24.
//  Copyright (c) 2014年 iDouKou. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFAppDotNetAPIClient : AFHTTPSessionManager
+(instancetype)sharedClient;
@end
