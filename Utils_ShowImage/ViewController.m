//
//  ViewController.m
//  Utils_ShowImage
//
//  Created by Guangleijia on 2018/5/9.
//  Copyright © 2018年 JJ. All rights reserved.
//

#import "ViewController.h"
#import "jj_Transition.h"
#import "DetailViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

@implementation ViewController
- (IBAction)presentTo:(id)sender {
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.transitioningDelegate = self;
    
    [self presentViewController:detailVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];



}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[jj_Transition alloc] initWithTransitionDuration:0.35f fromView:self.imageView isPresenting:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[jj_Transition alloc] initWithTransitionDuration:0.25f fromView:self.imageView isPresenting:NO];
}

//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
//
//
//}
//
//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
//
//
//}
//
//- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0) {
//
//
//}


@end
