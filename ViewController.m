//
//  ViewController.m
//  Tap Me
//
//  Created by Itar Mehak on 2016-03-06.
//  Copyright © 2016 Itar Mehak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGame];
    self->roundButton.layer.cornerRadius = 10.0;
   // roundbutton.clipsToBounds = true;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed {
    count++;
    
    //scoreLabel.text=@"Pressed";
    
    scoreLabel.text = [NSString stringWithFormat:@"Score\n %li", count];
}



- (void)setupGame {
    // 1
    seconds = 10;
    count = 0;
    
    // 2
    timerLabel.text = [NSString stringWithFormat:@"Time: %li", seconds];
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%li", count];
    
    // 3
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil
                                            repeats:YES];
}
- (void)subtractTime {
    // 1
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",seconds];
    
    // 2
    if (seconds == 0) {
        [timer invalidate];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!"
                                                    message:[NSString stringWithFormat:@"You scored %li points", count]
                                                   delegate:self
                                          cancelButtonTitle:@"Play Again"
                                          otherButtonTitles:@"Quit", nil]; // Though quit is not recommended by Apple
    
    [alert show];
    }
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != 0)  // 0 == the cancel button
    {
        //This is the code to press the home button programatically 
        [NSThread sleepForTimeInterval:1.0];
        UIApplication *app = [UIApplication sharedApplication];
        [app performSelector:@selector(suspend)];   
        
                                            // Apple does not reccommed it, because it makes it seem as if the app crashed
        
       // NSLog(@"The app will now quit");
        
        //wait 2 seconds while app is going background
        [NSThread sleepForTimeInterval:10.0];
        
        //exit app when app is in background
        exit(0);
    }
    if (buttonIndex == 0)
    {
        [self setupGame];
    }
}

@end
