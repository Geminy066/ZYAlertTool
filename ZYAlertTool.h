//
//  ZYAlertTool.h
//  Ape
//
//  Created by Geminy on 16/4/20.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYAlertTool : NSObject

/**
 *  一句话弹出视窗
 *  
 *  @author Geminy
 *  @param vc            当前调用改方法的控制器
 *  @param title         标题
 *  @param msg           内容
 *  @param cancel        取消按钮
 *  @param cancelHandler 点击取消后的操作
 *  @param ok            确认按钮
 *  @param okHandler     点击确认后的操作
 */
+ (void)zy_showAlertInVC:(UIViewController *)vc withTitle:(NSString *)title msg:(NSString *)msg cancel:(NSString *)cancel cancelHandler:(void(^)())cancelHandler ok:(NSString *)ok okHandler:(void(^)())okHandler;
@end
