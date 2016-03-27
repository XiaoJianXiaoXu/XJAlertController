//
//  XJAlertController.m
//  XJAlertAssemble
//
//  Created by mac on 2016/3/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "XJAlertController.h"

@interface XJAlertController ()

@end

@implementation XJAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}

+ (XJAlertController *)alertControllerTitle:(NSString *)title WithMessage:(NSString *)message WithDismissTime:(NSInteger)time {
    
    XJAlertController *alertController = [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [[self alloc] performSelector:@selector(dismissAlertController:) withObject:alertController afterDelay:time];
    return alertController;
}
/**
 *  返回到上一页
 *
 *  @param alert 现在所在的alert
 */
- (void)dismissAlertController:(XJAlertController *)alert {
    [alert dismissViewControllerAnimated:YES completion:^{
        
    }];
}
+ (XJAlertController *)XJalertControllerWithParameter:(XJAlertSet *)alertSet clickedBlock:(void (^)(NSInteger btnIndex))block {
    
    XJAlertController *alertController = [self alertControllerWithTitle:alertSet.title message:alertSet.message preferredStyle:alertSet.alertControllerStyle];
    
    if (alertSet.arrActionNames.count == 0) {
        [[self alloc] performSelector:@selector(dismissAlertController:) withObject:alertController afterDelay:1];
    }
    
    [alertSet.arrActionNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *alertAction = nil;
        
        if ([obj isEqualToString:@"取消"]) {
            alertAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
                block(idx);
                
                [alertController btnClicked:idx];
            }];
        }
        else if ([obj isEqualToString:@"确定"]) {
            alertAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                block(idx);
                [alertController btnClicked:idx];
            }];
            
        }
        else {
            alertAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                block(idx);
                [alertController btnClicked:idx];
                
            }];
            
        }
        [alertController addAction:alertAction];
        
    }];
    return alertController;
}

- (void)btnClicked:(NSInteger)index {
    if ([_delegate respondsToSelector:@selector(XJAlertController:)]) {
        [_delegate XJAlertController:index];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
