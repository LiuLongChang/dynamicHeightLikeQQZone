//
//  NTStatusTableViewCell.m
//  TableViewQQZone
//
//  Created by 刘隆昌 on 14-12-31.
//  Copyright (c) 2014年 刘隆昌. All rights reserved.
//

#import "NTStatusTableViewCell.h"

@implementation NTStatusTableViewCell
{
    
    UIImageView * _avatar;
    UILabel * _userName;
    UIImageView * _mbType;
    UILabel * _createAt;
    UILabel * _source;
    UILabel * _text;
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubview];
    }
    return self;
}

-(void)initSubview{
 
    _avatar = [[UIImageView alloc]init];
    [self addSubview:_avatar];
    
    _userName = [[UILabel alloc]init];
    _userName.textColor = kStatusGrayColor;
    _userName.font = [UIFont systemFontOfSize:kStatusTableViewCellUserNameFontSize];
    [self addSubview:_userName];
    
    
     _mbType = [[UIImageView alloc]init];
    [self addSubview:_mbType];
    
    _createAt = [[UILabel alloc]init];
    _createAt.textColor = kStatusLightGrayColor;
    _createAt.font = [UIFont systemFontOfSize:kStatusTableViewCellCreateAtFontSize];
    [self addSubview:_createAt];
    
    
    _source = [[UILabel alloc]init];
    _source.textColor = kStatusLightGrayColor;
    _source.font = [UIFont systemFontOfSize:kStatusTableViewCellSourceFontSize];
    [self addSubview:_source];
    
    
    _text = [[UILabel alloc]init];
    _text.textColor = kStatusGrayColor;
    _text.font = [UIFont systemFontOfSize:kStatusTableViewCellTextFontSize];
    [self addSubview:_text];
    
    
    
    
}

-(void)setStatus:(NTStatus*)status{
    
    
    CGFloat avatarX = 10,avatarY = 10;
    CGRect avatarRect = CGRectMake(avatarX,avatarY, kStatusTableViewCellAvatarWidth, kStatusTableViewCellAvatarHeight);
    _avatar.image = [UIImage imageNamed:status.profileImageUrl];
    _avatar.frame = avatarRect;
    
    
    CGFloat userNameX = CGRectGetMaxX(_avatar.frame)+kStatusTableViewCellControlSpacing;
    CGFloat userNameY = avatarY;
    CGSize userNameSize = [status.userName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellUserNameFontSize]}];
    CGRect userNameRect = CGRectMake(userNameX, userNameY, userNameSize.width, userNameSize.height);
    _userName.text = status.userName;
    _userName.frame = userNameRect;
    
    
    CGFloat mbTypeX = CGRectGetMaxX(_userName.frame)+kStatusTableViewCellControlSpacing;
    CGFloat mbTypeY = userNameY;
    CGRect mbTypeRect = CGRectMake(mbTypeX, mbTypeY, kStatusTableViewCellMbTypeWidth,kStatusTableViewCellMbTypeHeight);
    _mbType.image = [UIImage imageNamed:status.mbtype];
    _mbType.frame = mbTypeRect;
    
    
    CGSize createAtSize = [status.createAt sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellCreateAtFontSize]}];
    CGFloat createAtX = CGRectGetMaxX(_avatar.frame)+kStatusTableViewCellControlSpacing;
    CGFloat createAtY = CGRectGetMaxY(_mbType.frame)+kStatusTableViewCellControlSpacing;    CGRect createAtRect = CGRectMake(createAtX, createAtY, createAtSize.width,createAtSize.height);
    _createAt.text = status.createAt;
    _createAt.frame = createAtRect;
    
    
    
    CGSize sourceSize = [status.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellSourceFontSize]}];
    CGFloat sourceX = CGRectGetMaxX(_createAt.frame)+kStatusTableViewCellControlSpacing;
    CGFloat sourceY = createAtY;
    CGRect sourceRect = CGRectMake(sourceX, sourceY, sourceSize.width,sourceSize.height);
    _source.text = status.source;
    _source.frame = sourceRect;
    
    
    
    CGFloat textX = avatarX;
    CGFloat textY = CGRectGetMaxY(_avatar.frame)+kStatusTableViewCellControlSpacing;
    CGFloat textWidth = self.frame.size.width-2*kStatusTableViewCellControlSpacing;
    CGSize textSize = [status.text boundingRectWithSize:CGSizeMake(textWidth,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellTextFontSize]} context:nil].size;
    CGRect textRect = CGRectMake(textX, textY, textSize.width, textSize.height);
    _text.text = status.text;
    _text.frame = textRect;
    _text.numberOfLines = 0;
    _height = CGRectGetMaxY(_text.frame)+kStatusTableViewCellControlSpacing;
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
