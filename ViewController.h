//
//  ViewController.h
//  Tap Me
//
//  Created by Itar Mehak on 2016-03-06.
//  Copyright © 2016 Itar Mehak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate> {
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timerLabel;
    //IBOutlet UIButton *roundbutton;
    IBOutlet UIButton *roundButton;
    
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
}

- (IBAction)buttonPressed;


@end

