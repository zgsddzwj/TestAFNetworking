//
//  Post.h
//  TestAFNetworking
//
//  Created by Adward on 14/11/24.
//  Copyright (c) 2014年 iDouKou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Post : NSObject

@property (nonatomic,assign)NSInteger postID;
@property (nonatomic,strong)NSString *text;

@property (nonatomic,strong)User *user;

-(instancetype)initWithAttributes:(NSDictionary *)attributes;

+(NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void(^)(NSArray *posts,NSError *error))block;

@end
