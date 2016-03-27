//
//  XJAlertController.h
//  XJAlertAssemble
//
//  Created by mac on 2016/3/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJAlertSet.h"

//typedef struct {
//    NSString *title;
//    NSString *message;
//    
//}XJAlertSet;

@protocol XJAlertControllerDeledate <NSObject>

@optional
- (void)XJAlertController:(NSInteger)index;

@end


@interface XJAlertController : UIAlertController

@property (nonatomic, strong) id<XJAlertControllerDeledate>delegate;

/**
 *  弹出一个纯文字的警告框
 *  只有题目和提醒信息
 *  @param title   警告框题目
 *  @param message 警告框提示信息
 *  @param time    警告框消失时间
 *
 *  @return 返回警告框，加号方法方便直接跳转
 */
+ (XJAlertController *)alertControllerTitle:(NSString *)title WithMessage:(NSString *)message WithDismissTime:(NSInteger)time;

/**
 *  在这个里边我可以自己添加任意按钮
 *
 *  @param parameter 参数字典
 *
 *  @return 返回警告框
 */
+ (XJAlertController *)XJalertControllerWithParameter:(XJAlertSet *)alertSet clickedBlock:(void (^)(NSInteger btnIndex))block;

@end
