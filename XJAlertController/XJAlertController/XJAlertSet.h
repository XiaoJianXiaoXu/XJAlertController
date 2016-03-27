//
//  XJAlertSet.h
//  XJAlertAssemble
//
//  Created by mac on 2016/3/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XJAlertSet : NSObject
/**
 *  警告框名字
 */
@property (nonatomic, strong) NSString *title;
/**
 *  警告框提示信息
 */
@property (nonatomic, strong) NSString *message;
/**
 *  警告框风格
 */
@property (nonatomic, assign) UIAlertControllerStyle alertControllerStyle;
/**
 *  警告框中按钮们的名字
 */
@property (nonatomic, strong) NSArray *arrActionNames;
/**
 *  用字典初始化模型
 *
 *  @param dic 用来初始化的字典
 *
 *  @return 返回自己
 */
- (id)initWithDic:(NSDictionary *)dic;

@end
