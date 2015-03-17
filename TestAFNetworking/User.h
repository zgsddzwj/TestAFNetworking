//
//  User.h
//  TestAFNetworking
//
//  Created by Adward on 14/11/24.
//  Copyright (c) 2014年 iDouKou. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kUserProfileImageDidLoadNotification;

@interface User : NSObject

@property (readonly, nonatomic,assign) NSUInteger userID;
@property (readonly, nonatomic,copy) NSString *username;
@property (readonly, nonatomic,unsafe_unretained)NSURL *avatarImageURL;

-(instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
