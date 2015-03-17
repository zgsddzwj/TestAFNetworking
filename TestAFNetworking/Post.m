//
//  Post.m
//  TestAFNetworking
//
//  Created by Adward on 14/11/24.
//  Copyright (c) 2014年 iDouKou. All rights reserved.
//

#import "Post.h"
#import "User.h"

#import "AFAppDotNetAPIClient.h"


@implementation Post

-(instancetype)initWithAttributes:(NSDictionary *)attributes{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.postID = [[attributes valueForKeyPath:@"id"] integerValue];
    self.text = [attributes valueForKeyPath:@"text"];
    self.user = [[User alloc]initWithAttributes:[attributes valueForKeyPath:@"user"]];
    return self;
}

+(NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *, NSError *))block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"stream/0/posts/stream/global" parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *postsFromResponse = [JSON valueForKeyPath:@"data"];
        NSLog(@"%@",postsFromResponse);
        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
        for (NSDictionary *attributes in postsFromResponse) {
            Post *post = [[Post alloc] initWithAttributes:attributes];
            [mutablePosts addObject:post];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];

}

@end
