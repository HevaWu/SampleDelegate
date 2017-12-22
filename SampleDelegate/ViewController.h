//
//  ViewController.h
//  SampleDelegate
//
//  Created by ST21235 on 2017/12/06.
//  Copyright © 2017 He Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleAlertController.h"

@interface ViewController : UIViewController<SampleDelegate, UIViewControllerTransitioningDelegate, UIViewControllerContextTransitioning>
@property (nonatomic, assign) BOOL isPresented;



@end

