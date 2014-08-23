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

@synthesize goingUp, arrow, MemberView, welcomeI, greetingsI, helloI, nameI, scheduleI;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.goingUp = false;
    self.arrow.image = [UIImage imageNamed:@"arrow-1.png"];
    
    [self startAnimationWithDuration];
    
    int animationDuration = 1;
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
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

    
    
//    [self.greetings initWithFrame:CGRectMake(xOrigin, yOrigin, boxWidth, boxHeight)];
    
    UIView *greetings = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, yOrigin, boxWidth, boxHeight)];
    [greetings setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:greetings];
    
    greetings.frame =  CGRectMake(xOrigin, -1 * (self.view.frame.size.height), boxWidth, boxHeight);
    [UIView animateWithDuration:0.4 animations:^{
        greetings.frame = CGRectMake(xOrigin, yOrigin, boxWidth, boxHeight);
    }];

    greetings.layer.borderColor = [UIColor grayColor].CGColor;
    greetings.layer.borderWidth = 1.0f;

    
    CGRect helloFrame;
    helloFrame.origin.x = 0;
    helloFrame.origin.y = 160;
    helloFrame.size.width = greetings.frame.size.width;
    helloFrame.size.height = 115;
    
    UILabel *hello = [[UILabel alloc] initWithFrame:helloFrame];
    [hello setText:@"HELLO"];
    [hello setTextAlignment:UITextAlignmentCenter];
    [hello setFont:[UIFont fontWithName:@"AvenirNext-UltraLight" size:136]];
    
    [greetings addSubview:hello];
    
    
//    hello.layer.borderColor = [UIColor grayColor].CGColor;
//    hello.layer.borderWidth = 1.0f;

    
    
    
    CGRect nameFrame;
    nameFrame.origin.x = 0;
    nameFrame.origin.y = helloFrame.origin.y + helloFrame.size.height + 7;
    nameFrame.size.width = greetings.frame.size.width;
    nameFrame.size.height = 80;
    
    UILabel *name = [[UILabel alloc] initWithFrame:nameFrame];
    [name setText:@"J.D."];
    [name setTextAlignment:UITextAlignmentCenter];
    [name setFont:[UIFont fontWithName:@"AvenirNext-UltraLight" size:78]];
    
    [greetings addSubview:name];


//    name.layer.borderColor = [UIColor grayColor].CGColor;
//    name.layer.borderWidth = 1.0f;


    
    
    
    
    CGRect welcFrame;
    welcFrame.origin.x = 0;
    welcFrame.origin.y = nameFrame.origin.y + nameFrame.size.height + 34;
    welcFrame.size.width = greetings.frame.size.width;
    welcFrame.size.height = 60;
    
    UILabel *welcome = [[UILabel alloc] initWithFrame:welcFrame];
    [welcome setText:@"Welcome to Tech Liminal"];
    [welcome setTextAlignment:UITextAlignmentCenter];
    [welcome setFont:[UIFont fontWithName:@"AvenirNext-UltraLight" size:42]];
    
    [greetings addSubview:welcome];
    
    
    
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
    UIImageView *imageToMove =
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-1.png"]];
    
    int imageWidth = 113;
    int imageHeight = 152;
    int bounceHeight = 100;
    int gapAtBottom = 40;
    
    if (self.goingUp == false) {
    
        imageToMove.frame = CGRectMake((self.view.frame.size.width / 2) - (imageWidth / 2), self.view.frame.size.height - imageHeight - bounceHeight - gapAtBottom, imageWidth, imageHeight);
        [self.view addSubview:imageToMove];
        
        // Move the image
        [self moveImage:imageToMove duration:1.0
                  curve:UIViewAnimationCurveEaseInOut x:0 y:bounceHeight];
        
        self.goingUp = true;
        
    } else {
        
        imageToMove.frame = CGRectMake((self.view.frame.size.width / 2) - (imageWidth / 2), self.view.frame.size.height - imageHeight - gapAtBottom, imageWidth, imageHeight);
        [self.view addSubview:imageToMove];
        
        // Move the image
        [self moveImage:imageToMove duration:1.0
                  curve:UIViewAnimationCurveEaseInOut x:0 y:(-1 * bounceHeight)];

        self.goingUp = false;
        
    }
    
}

@end
