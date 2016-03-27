//
//  XJAlertSet.m
//  XJAlertAssemble
//
//  Created by mac on 2016/3/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "XJAlertSet.h"

@implementation XJAlertSet

- (id)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        
        _title = [dic objectForKey:@"title"];
        _message = dic[@"message"];
        _alertControllerStyle = [dic[@"alertControllerStyle"] intValue];
        _arrActionNames = dic[@"arrActionNames"];
        
    }
    return self;
}

@end
