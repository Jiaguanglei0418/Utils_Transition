//
//  jj_Transition.h
//  Utils_ShowImage
//
//  Created by Guangleijia on 2018/5/9.
//  Copyright © 2018年 JJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface jj_Transition : NSObject <UIViewControllerAnimatedTransitioning>

/** 初始化 */
- (instancetype)initWithTransitionDuration:(NSTimeInterval)transitionDuration
                                  fromView:(UIView *)fromeView
                              isPresenting:(BOOL)present;

@end
