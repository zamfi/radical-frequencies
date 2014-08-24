//
//  ViewController.m
//  Radical Frequencies
//
//  Created by Gil Zamfirescu on 8/23/14.
//  Copyright (c) 2014 TechLiminal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize goingUp, arrow, bounce, TLHeader, touchAmuletI, MemberView, welcomeI, greetingsI, helloI, nameI, scheduleI, welcomeView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.goingUp = true;
    self.arrow = [[UIImageView alloc] init];
    self.arrow.image = [UIImage imageNamed:@"arrow-1.png"];
    
    self.TLHeader = [[UIImageView alloc] init];
    self.TLHeader.image = [UIImage imageNamed:@"TechLiminalBanner.png"];
    self.TLHeader.frame = CGRectMake(0, -302, 768, 302);
    [self.view addSubview:TLHeader];

    [UIView animateWithDuration:1.5 animations:^{
        self.TLHeader.frame = CGRectMake(0, 0, 768, 302);
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:2
                                     target:self
                                   selector: @selector(welcomeToTL)
                                   userInfo:nil
                                    repeats:NO];
    
//    self.welcomeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    CGRect welcFrame;
    welcFrame.origin.x = 0;
    welcFrame.origin.y = self.view.frame.size.height / 2;
    welcFrame.size.width = self.view.frame.size.width;
    welcFrame.size.height = 60;
    
    self.welcomeI = [[UILabel alloc] initWithFrame:welcFrame];
    [self.welcomeI setText:@"Welcome to Tech Liminal"];
    [self.welcomeI setTextAlignment:UITextAlignmentCenter];
    [self.welcomeI setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:46]];

    //
    
    
    CGRect amuFrame;
    amuFrame.origin.x = 0;
    amuFrame.origin.y = self.view.frame.size.height / 2 + 60;
    amuFrame.size.width = self.view.frame.size.width;
    amuFrame.size.height = 60;
    
    self.touchAmuletI = [[UILabel alloc] initWithFrame:amuFrame];
    [self.touchAmuletI setText:@"Touch your Amulet Below"];
    [self.touchAmuletI setTextAlignment:UITextAlignmentCenter];
    [self.touchAmuletI setTextColor:[UIColor colorWithRed:246.0/255.0 green:70.0/255.0 blue:41.0/255.0 alpha:1.0]];
    [self.touchAmuletI setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:30]];

    //

    
    [self startAnimationWithDuration];
    
    int animationDuration = 1;
    
    self.bounce = [NSTimer scheduledTimerWithTimeInterval:0.6
                                     target:self
                                   selector:@selector(startAnimationWithDuration)
                                   userInfo:nil
                                    repeats:YES];
    
	// Do any additional setup after loading the view, typically from a nib.
    
//    WebView.scalesPageToFit = true;
//    [WebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://techliminal.com/"]]];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) welcomeToTL
{
    
    self.welcomeI.alpha = 0;
    [self.view addSubview:self.welcomeI];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ self.welcomeI.alpha = 1;}
                     completion:nil];

    self.touchAmuletI.alpha = 0;
    [self.view addSubview:self.touchAmuletI];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ self.touchAmuletI.alpha = 1;}
                     completion:nil];


}

- (IBAction)ShowLightbox:(id)sender {
    
    [self displayMemberInfo];
    
//    [UIView transitionWithView:self.view
//                      duration:0.25
//                       options:UIViewAnimationOptionCurveEaseIn
//                    animations:^{
//                        [self.view addSubview:MemberViewController.MemberUIView];
//                    }
//                    completion:nil];

}

- (void) displayMemberInfo {
    NSLog(@"Inserting subview.");
    
    
//    CGRect lbFrame = self.MemberView.frame;
//    
//    lbFrame.size.width = 200;
//    lbFrame.size.height = 200;
//    
//    self.MemberView.frame = lbFrame;
//    [self.MemberView setBackgroundColor:[UIColor lightGrayColor]];
//    
//    [self.view insertSubview:self.MemberView aboveSubview:self.view];
//    
//    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
//    //    label.text=@"LABEL";
//    //    [label setBackgroundColor:[UIColor whiteColor]];
//    //    [self.view insertSubview:label aboveSubview:self.view];
//    
//    lbFrame.origin.x = 0.2 * (self.view.frame.size.width);
//    lbFrame.origin.y = 100;
    

//    int greetingsHeight = 400;
    
    int xOrigin = 0;
    int yOrigin = 0;
    int boxWidth = self.view.frame.size.width;
    int boxHeight = self.view.frame.size.height;
    
    
    self.greetingsI = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, yOrigin, boxWidth, boxHeight)];
    [self.greetingsI setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.greetingsI];
    
    self.greetingsI.frame =  CGRectMake(xOrigin, -1 * (self.view.frame.size.height), boxWidth, boxHeight);
    [UIView animateWithDuration:0.4 animations:^{
        self.greetingsI.frame = CGRectMake(xOrigin, yOrigin, boxWidth, boxHeight);
    }];

    self.greetingsI.layer.borderColor = [UIColor grayColor].CGColor;
    self.greetingsI.layer.borderWidth = 1.0f;

    
    CGRect helloFrame;
    helloFrame.origin.x = 0;
    helloFrame.origin.y = 160;
    helloFrame.size.width = self.greetingsI.frame.size.width;
    helloFrame.size.height = 115;
    
    self.helloI = [[UILabel alloc] initWithFrame:helloFrame];
    [self.helloI setText:@"HELLO"];
    [self.helloI setTextAlignment:UITextAlignmentCenter];
    [self.helloI setFont:[UIFont fontWithName:@"AvenirNext-UltraLight" size:136]];
    
    [self.greetingsI addSubview:self.helloI];
    
    
//    hello.layer.borderColor = [UIColor grayColor].CGColor;
//    hello.layer.borderWidth = 1.0f;

    
    
    
    CGRect nameFrame;
    nameFrame.origin.x = 0;
    nameFrame.origin.y = helloFrame.origin.y + helloFrame.size.height + 7;
    nameFrame.size.width = self.greetingsI.frame.size.width;
    nameFrame.size.height = 80;
    
    UILabel *name = [[UILabel alloc] initWithFrame:nameFrame];
    [name setText:@"J.D."];
    [name setTextAlignment:UITextAlignmentCenter];
    [name setFont:[UIFont fontWithName:@"AvenirNext-UltraLight" size:78]];
    
    [self.greetingsI addSubview:name];


//    name.layer.borderColor = [UIColor grayColor].CGColor;
//    name.layer.borderWidth = 1.0f;


    
    
    
    
    
    
    
//    name.layer.borderColor = [UIColor grayColor].CGColor;
//    name.layer.borderWidth = 1.0f;

    
    
//
//    CGRectMake(0.1 * (self.view.frame.size.width), 0.1 * (self.view.frame.size.height, ), 0.8 * (self.view.frame.size.width), 0.8 * (self.view.frame.size.height))
    
//    
//    [UIView transitionWithView:self.view
//                      duration:2.5
//                       options:UIViewAnimationCurveEaseOut|UIViewAnimationCurveLinear
//                    animations:^{
//                        [self.view insertSubview:lb aboveSubview:self.view];
//                        NSLog(@"Animating");
//                    }
//                    completion:nil];
    
//    UIView *fromView = self.view;
//    fromView.backgroundColor = [UIColor blueColor];
//    UIView *toView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    toView.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:fromView];
//    
//    [CATransaction flush];
//    
//    [UIView transitionFromView:fromView toView:toView duration:0.4f options:UIViewAnimationOptionTransitionFlipFromLeft completion:NULL];
    
    
    
    [self.bounce invalidate];
    self.bounce = nil;
    

}

- (void)moveImage:(UIImageView *)image duration:(NSTimeInterval)duration
            curve:(int)curve x:(CGFloat)x y:(CGFloat)y
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeTranslation(x, y);
    image.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
    
}

- (void)startAnimationWithDuration
{
//    UIImageView *imageToMove = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-1.png"]];

    UIImageView *imageToMove = self.arrow;
    
    int imageWidth = 113;
    int imageHeight = 152;
    int bounceHeight = 40;
    int gapAtBottom = 40;
    
    if (self.goingUp == true) {
    
        int originY = self.view.frame.size.height - imageHeight - bounceHeight - gapAtBottom;
        
        imageToMove.frame = CGRectMake((self.view.frame.size.width / 2) - (imageWidth / 2), originY, imageWidth, imageHeight);
        [self.view addSubview:imageToMove];
        
        // Move the image
        [self moveImage:imageToMove duration:0.5
                  curve:UIViewAnimationCurveEaseInOut x:0 y:(bounceHeight / 2)];
        
        self.goingUp = false;
        
    } else {
        
        int originY = self.view.frame.size.height - imageHeight - gapAtBottom;
        
        imageToMove.frame = CGRectMake((self.view.frame.size.width / 2) - (imageWidth / 2), originY, imageWidth, imageHeight);
        [self.view addSubview:imageToMove];
        
        // Move the image
        [self moveImage:imageToMove duration:0.5
                  curve:UIViewAnimationCurveEaseInOut x:0 y:(-1 * (bounceHeight / 2))];

        self.goingUp = true;
        
    }
    
}

//- (void) animateImage
//{
//    UIImageView *imageToMove = self.arrow;
//
//    if (self.goingUp == false) {
//        
//        [UIView animateWithDuration:0.5
//                              delay:0
//                            options:UIViewAnimationOptionCurveEaseIn
//                         animations:^{ self.welcomeI.alpha = 1;}
//                         completion:nil];
//        
//        self.goingUp = true;
//        
//    } else {
//        
//        self.goingUp = false;
//        
//    }
//
//    
//}

@end
