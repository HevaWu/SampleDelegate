//
//  ViewController.m
//  SampleDelegate
//
//  Created by ST21235 on 2017/12/06.
//  Copyright © 2017 He Wu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (IBAction)Clickbutton:(id)sender {
    //checking delegate
//    SampleAlertController *alert1 = [SampleAlertController alertControllerWithTitle:@"Test1" message:nil preferredStyle:UIAlertControllerStyleAlert];
//    [alert1 addButton:@"OK" handler:^(UIAlertAction *action) {
//        //
//    }];
//    //    [salert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}]];
//    //    [salert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}]];
//    //    salert.delegate = self;
//    alert1.delegate = self;
//    [self presentViewController:alert1 animated:YES completion:nil];

    //===========================================================================================================================================================
    //checking multiple alertControllers

    NSLog(@"Before Creating");
    SampleAlertController *alert2 = [SampleAlertController alertControllerWithTitle:@"Test2" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert2 addButton:@"OK" handler:^(UIAlertAction *action) {
        //
    }];

    SampleAlertController *alert3 = [SampleAlertController alertControllerWithTitle:@"Test3" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert3 addButton:@"OK" handler:^(UIAlertAction *action) {
        //
    }];

    SampleAlertController *alert4 = [SampleAlertController alertControllerWithTitle:@"Test4" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert4 addButton:@"OK" handler:^(UIAlertAction *action) {
        //
    }];

    //method 1
    //using presentedVC, could only show up to 2 alertcontrollers
//    [self presentViewController:self salert:alert2];
//    [self presentViewController:self salert:alert3];


    //test the childVC
    UIViewController* myChildViewController = [[UIViewController alloc]init];
    myChildViewController.view.backgroundColor = [[UIColor alloc] initWithRed:12 green:0 blue:0 alpha:0.5];

    //if want to keep the myChidViewController translucent, must set the presentaionstyle as .currentcontext and set the transitionstyle as .coververtical
    //if want to curl the page, must set as full screen
//    myChildViewController.modalPresentationStyle = UIModalPresentationFullScreen;
//    myChildViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;

    //test some modalPresentationStyle
    myChildViewController.modalPresentationStyle = UIModalPresentationCustom;
    myChildViewController.transitioningDelegate = self;

//    [self addChildViewController:myChildViewController];
//    [myChildViewController didMoveToParentViewController:self];
//    myChildViewController.view.frame = self.view.bounds;
//    [self.view addSubview:myChildViewController.view];

//    [self presentViewController:alert4 animated:true completion:nil];

//    self.modalPresentationStyle = UIModalPresentationPopover;
//    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:myChildViewController animated:true completion:nil];
//    self.modalPresentationStyle = UIModalPresentationPopover;
//    [self presentedViewController].modalTransitionStyle = UIModalTransitionStylePartialCurl;

    //method 2
    //creating UIWindow for each alertController

//    UIWindow *alertWindow1 = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    alertWindow1.rootViewController = [[UIViewController alloc]init];
//    alertWindow1.windowLevel = UIWindowLevelAlert;
//    [alertWindow1 makeKeyAndVisible];
//    [alertWindow1.rootViewController presentViewController:alert2 animated:YES completion:nil];
//
//    UIWindow *alertWindow2 = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    alertWindow2.rootViewController = [[UIViewController alloc]init];
//    alertWindow2.windowLevel = UIWindowLevelAlert;
//    [alertWindow2 makeKeyAndVisible];
//    [alertWindow2.rootViewController presentViewController:alert3 animated:YES completion:nil];
//    UIWindow *alertWindow3 = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    alertWindow3.rootViewController = [[UIViewController alloc]init];
//    alertWindow3.windowLevel = UIWindowLevelAlert;
//    [alertWindow3 makeKeyAndVisible];
//    [alertWindow3.rootViewController presentViewController:alert3 animated:YES completion:nil];


    //===========================================================================================================================================================
    //test performance of dismiss and release
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self dismissAlertControllerIfExists];

//        [self dismissViewControllerAnimated:true completion:nil];

    });

    //for method 2
    //checking if the window we created has already released
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (UIWindow* window in [[UIApplication sharedApplication] windows]) {
            if (window == nil) {
                NSLog(@"Is NIL!!");
            }
        }
        NSLog(@"Windows Count: %lu", (unsigned long)[[[UIApplication sharedApplication] windows] count]);
//        NSLog([[UIApplication sharedApplication] windows]);
    });

    //===========================================================================================================================================================
    //Styles of viewController
//    UIViewController* vc1 = [[UIViewController alloc] init];
//    UIViewController* vc2 = [[UIViewController alloc] init];
//    alert2.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    alert2.modalPresentationStyle = UIModalPresentationCurrentContext;
}

-(void)presentViewController:(UIViewController *)vc salert:(SampleAlertController *)salert
{//present salert in vc
    if(vc.presentedViewController == nil){
        [vc presentViewController:salert animated:true completion:nil];
        return;
    }
    [self presentViewController:vc.presentedViewController salert:salert];
}

-(void)dismissAlertControllerIfExists{
    //method 1
    //dismiss by checking the presentVC and childVCs
    for (UIWindow *window in [UIApplication sharedApplication].windows){
        [self dismissSampleAlertController:window.rootViewController];
    }

    //meghod 2
    //dismiss by checking current windowLevels
//    for (int i = 0; i < [UIApplication sharedApplication].windows.count; i++) {
//        UIWindow* window = [UIApplication sharedApplication].windows[i];
//        if([window windowLevel] == UIWindowLevelAlert) {
//
//            [window.rootViewController dismissViewControllerAnimated:true completion:nil];
//
//        }
//    }

//    for (UIWindow* window in [UIApplication sharedApplication].windows)
//    {
//        if([window windowLevel] >= UIWindowLevelAlert && [window windowLevel] < UIWindowLevelStatusBar ){
//        if([window windowLevel] == UIWindowLevelAlert) {
//            [window setHidden:YES];
    //            window.screen
    //            NSLog(window.superview == nil ? @"No superview" : window.superview);
    ////            [window removeFromSuperview];
//            window.rootViewController = nil;
//            [window resignKeyWindow];
//            [window removeFromSuperview];
//            window = nil;

//        }

//    }

}

- (void)dismissSampleAlertController:(UIViewController *) vc
{
    if(vc == nil) return;

    if(vc.presentedViewController){
        [self dismissSampleAlertController:vc.presentedViewController];
    }

    if(vc.childViewControllers.count){
        for(UIViewController *childVC in vc.childViewControllers){
            [self dismissSampleAlertController:childVC];
        }
    }

    if ([vc isKindOfClass:SampleAlertController.class]) {
        [vc dismissViewControllerAnimated:true completion:nil];
        return;
    }
}

- (void)alertController:(SampleAlertController *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    printf("Test clicked");
}
- (void)alertController:(SampleAlertController *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{

}
- (void)alertController:(SampleAlertController *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{

}

#pragma mark UIViewControllerTransitioningDelegate
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.isPresented = YES;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.isPresented = NO;
    return self;
}

#pragma mark UIViewControllerTransitioningDelegate

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    if (self.isPresented == YES) {
        //pop up
        UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
        [[transitionContext containerView]addSubview:presentedView];
        presentedView.frame = CGRectMake(0, -667, 375, 667);
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            presentedView.frame = CGRectMake(0, 0, 375, 667);}completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
    } else {
        //dismis
        UIView *dismissedView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        [[transitionContext containerView] addSubview:dismissedView];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            dismissedView.frame =CGRectMake(0, -667, 375, 667);
        }completion:^(BOOL finished) {

            [transitionContext completeTransition:YES];
        }];

    }
}

@end
