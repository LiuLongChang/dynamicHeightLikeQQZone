//
//  NTStatusTableViewCell.h
//  TableViewQQZone
//
//  Created by 刘隆昌 on 14-12-31.
//  Copyright (c) 2014年 刘隆昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTStatusTableViewCell : UITableViewCell







#pragma mark 微博对象
@property (nonatomic ,strong) NTStatus * status;

#pragma mark 单元格高度
@property (nonatomic ,assign) CGFloat height;





@end
