//
//  jj_Transition.m
//  Utils_ShowImage
//
//  Created by Guangleijia on 2018/5/9.
//  Copyright © 2018年 JJ. All rights reserved.
//

#import "jj_Transition.h"
#import "DetailViewController.h"
#define kScreenWidth         [UIScreen mainScreen].bounds.size.width
#define kScreenHeight        [UIScreen mainScreen].bounds.size.height

@interface UIView(UIImageView)
- (UIImageView *)imageView;
@end


@interface jj_Transition()
@property(nonatomic, assign) NSTimeInterval transitionDuration;
@property(nonatomic, assign) CGFloat startingAlpha;
@property(nonatomic, assign) BOOL isPresenting;
@property(nonatomic, strong) UIView *fromView;

@end

@implementation jj_Transition
- (instancetype)initWithTransitionDuration:(NSTimeInterval)transitionDuration
                                  fromView:(UIView *)fromeView
                              isPresenting:(BOOL)present {
    if (self = [super init]) {
        _transitionDuration = transitionDuration;
        _isPresenting = present;
        _fromView = fromeView;
    }
    return self;
}


#pragma mark - UIViewControllerAnimatedTransitioning
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    DetailViewController *imageVC = nil;
    UIImageView *fromImageView = nil;
    UIImageView *toImageView = nil;
    UIImageView *transitonView = nil;
    
    if (_isPresenting) {
        imageVC = (DetailViewController *)toVC;
        fromImageView = _fromView.imageView;
        toImageView = imageVC.imageView;

    } else {
        imageVC = (DetailViewController *)fromVC;
        fromImageView = imageVC.imageView;
        toImageView = _fromView.imageView;
    }
    
    transitonView = [[UIImageView alloc] initWithImage:fromImageView.image];
    fromView.alpha = 1.f;
    toView.alpha = 0.f;
    fromImageView.hidden = YES;
    toImageView.hidden = YES;
    transitonView.frame = [containerView convertRect:fromImageView.frame fromView:fromImageView.superview];
    [containerView addSubview:toVC.view];
    [containerView addSubview:transitonView];
    
    [UIView animateWithDuration:_transitionDuration animations:^{
        transitonView.frame = [containerView convertRect:toImageView.frame fromView:toImageView.superview];
        fromView.alpha = 0.f;
        toView.alpha = 1.f;
    } completion:^(BOOL finished) {
        toImageView.hidden = NO;
        [transitonView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    
}



- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return _transitionDuration;
}
@end


@implementation UIView(UIImageView)
- (UIImageView *)imageView {
    
    if ([self isKindOfClass:[UIImageView class]]) {
        return (UIImageView *)self;
    }
    
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[UIImageView class]]) {
            return (UIImageView *)subView;
        }
    }
    
    return nil;
}
@end
