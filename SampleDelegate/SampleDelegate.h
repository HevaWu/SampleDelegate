//
//  SampleDelegate.h
//  SampleDelegate
//
//  Created by ST21235 on 2017/12/06.
//  Copyright © 2017 He Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SampleAlertController;

@protocol SampleDelegate <NSObject>

- (void)alertController:(SampleAlertController *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
- (void)alertController:(SampleAlertController *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;
- (void)alertController:(SampleAlertController *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex;

@end

//@interface SampleAlertController : UIAlertController
//
//@property (nonatomic, weak) id<SampleDelegate> delegate;
//
//@end


