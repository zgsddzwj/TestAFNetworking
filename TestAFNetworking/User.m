//
//  User.m
//  TestAFNetworking
//
//  Created by Adward on 14/11/24.
//  Copyright (c) 2014年 iDouKou. All rights reserved.
//

#import "User.h"
#import "AFHTTPRequestOperation.h"

NSString *const kUserProfileImageDidLoadNotification = @"com.alamofire.user.profile-image.loaded";

@interface User()
@property (readwrite, nonatomic,assign) NSUInteger userID;
@property (readwrite, nonatomic,copy) NSString *username;
@property (readwrite, nonatomic,copy) NSString *avatarImageURLString;

@end

@implementation User

-(instancetype)initWithAttributes:(NSDictionary *)attributes{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.userID = [[attributes valueForKeyPath:@"id"] integerValue];
    self.username = [attributes valueForKeyPath:@"username"];
    self.avatarImageURLString = [attributes valueForKeyPath:@"avatar_image.url"];
    
    return self;
}

-(NSURL *)avatarImageURL{
    return [NSURL URLWithString:self.avatarImageURLString];
}

@end
