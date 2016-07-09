//
//  NTStatus.h
//  TableViewQQZone
//
//  Created by 刘隆昌 on 14-12-31.
//  Copyright (c) 2014年 刘隆昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NTStatus : NSObject



@property(nonatomic,assign)long long Id;
@property(nonatomic,copy)NSString* profileImageUrl;
@property(nonatomic,copy)NSString* userName;
@property(nonatomic,copy)NSString* mbtype;
@property(nonatomic,copy)NSString* createAt;
@property(nonatomic,copy)NSString* source;
@property(nonatomic,copy)NSString* text;



-(NTStatus*)initWithDictionary:(NSDictionary*)dic;
+(NTStatus*)statusWithDictionary:(NSDictionary*)dic;


@end
