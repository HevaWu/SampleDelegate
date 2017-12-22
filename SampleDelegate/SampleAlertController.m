//
//  SampleAlertController.m
//  SampleDelegate
//
//  Created by ST21235 on 2017/12/06.
//  Copyright © 2017 He Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SampleAlertController.h"

@implementation SampleAlertController
@synthesize delegate;


- (void) addButton:(NSString *)title handler:(void (^ __nullable)(UIAlertAction *action))handler {

    [self addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        handler(action);
        
        if(delegate != nil){
            if([delegate respondsToSelector:@selector(alertController:clickedButtonAtIndex:)]){
                [delegate alertController:self clickedButtonAtIndex:0];
            }
        }

    }]];


}

- (void)alertController:(SampleAlertController *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    printf("Haha");
}




@end
