//
//  PostTableViewCell.m
//  TestAFNetworking
//
//  Created by Adward on 14/11/24.
//  Copyright (c) 2014年 iDouKou. All rights reserved.
//

#import "PostTableViewCell.h"
#import "Post.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
@implementation PostTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.textColor = [UIColor darkGrayColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    self.detailTextLabel.numberOfLines = 0;
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return self;
}

-(void)setPost:(Post *)post{
    _post = post;
    
    self.textLabel.text = _post.user.username;
    self.detailTextLabel.text = _post.text;
    [self.imageView setImageWithURL:_post.user.avatarImageURL placeholderImage:nil];
    [self setNeedsDisplay];
}

+(CGFloat)heightForCellWithPost:(Post *)post{
    CGSize sizeToFit = [post.text sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(220.0f, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    return fmaxf(70.0f, (float)sizeToFit.height + 45.0f);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10, 10, 50, 50);
    self.textLabel.frame = CGRectMake(70, 10, 240, 20);
    
    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0, 25);
    detailTextLabelFrame.size.height = [[self class]heightForCellWithPost:self.post]-45.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
}

@end
