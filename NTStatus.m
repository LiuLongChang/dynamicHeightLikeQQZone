//
//  NTStatus.m
//  TableViewQQZone
//
//  Created by 刘隆昌 on 14-12-31.
//  Copyright (c) 2014年 刘隆昌. All rights reserved.
//

#import "NTStatus.h"

@implementation NTStatus


-(NTStatus*)initWithDictionary:(NSDictionary *)dic{
    
    if (self = [super init]) {
        self.Id = [dic[@"Id"] longLongValue];
        self.profileImageUrl = dic[@"profileImageUrl"];
        self.userName = dic[@"userName"];
        self.mbtype = dic[@"mbtype"];
        self.createAt = dic[@"createAt"];
        self.text = dic[@"text"];
        self.source = dic[@"source"];
    }
    return self;
}

+(NTStatus*)statusWithDictionary:(NSDictionary *)dic{
    
    NTStatus * status = [[NTStatus alloc]initWithDictionary:dic];
    return status;
    
}


-(NSString*)source{
    
    return [NSString stringWithFormat:@"来自 %@",_source];
}



@end
