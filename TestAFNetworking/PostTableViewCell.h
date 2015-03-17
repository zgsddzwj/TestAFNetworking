//
//  PostTableViewCell.h
//  TestAFNetworking
//
//  Created by Adward on 14/11/24.
//  Copyright (c) 2014年 iDouKou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Post;

@interface PostTableViewCell : UITableViewCell
@property (nonatomic,strong)Post *post;
+(CGFloat)heightForCellWithPost:(Post *)post;
@end
