//
//  ZYAlertTool.m
//  Ape
//
//  Created by Geminy on 16/4/20.
//  Copyright © 2016年 Geminy. All rights reserved.
//

#import "ZYAlertTool.h"

typedef void (^CancelBlock)();
typedef void (^OkBlock)();
static CancelBlock cancelBlock;
static OkBlock okBlock;

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"

@interface  ZYAlertTool()<UIAlertViewDelegate>

@end

@implementation ZYAlertTool

+ (void)zy_showAlertWithTitle:(NSString *)title msg:(NSString *)msg cancel:(NSString *)cancel cancelHandler:(void(^)())cancelHandler ok:(NSString *)ok okHandler:(void(^)())okHandler
{

    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:cancelHandler];
        UIAlertAction *okAct = [UIAlertAction actionWithTitle:ok style:UIAlertActionStyleDefault handler:okHandler];
        if(cancel) [ac addAction:cancelAct];
        if(ok) [ac addAction:okAct];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
    } else {
        if(cancel) cancelBlock = cancelHandler;
        if(ok) okBlock = okHandler;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancel otherButtonTitles:ok, nil];
        [alert show];
    }
}

#pragma mark   UIAlertViewDelegate
+ (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        !cancelBlock ? : cancelBlock();
    } else {
        !okBlock ? : okBlock();
    }
    cancelBlock = nil;
    okBlock = nil;
}
@end

#pragma clang diagnostic pop
