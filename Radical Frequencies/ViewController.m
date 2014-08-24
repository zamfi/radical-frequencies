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

@synthesize displayingMemberInfo, goingUp, arrow, scheduleImage, payPrompt, bounce, lightBoxCurtains, activityDetails, TLHeader, touchAmuletI, MemberView, welcomeI, greetingsI, helloI, nameI, scheduleI, welcomeView;

- (void)amuletWasTaggedByMember:(NSDictionary *)memberInfo shouldDisplay:(NSDictionary *)displayInfo {
//    UIAlertView *alertView =
//    [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Welcome, %@!", [memberInfo objectForKey:@"firstName"]]
//                               message:@"Good to see you again!"
//                              delegate:nil
//                     cancelButtonTitle:@"OK"
//                     otherButtonTitles:nil ];
//    [alertView show];
    
    if (self.displayingMemberInfo == true) {
        
        [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        [self displayMemberInfo:[memberInfo objectForKey:@"firstName"]];
    
    } else {
        
        [self displayMemberInfo:[memberInfo objectForKey:@"firstName"]];
    
    }
}

//- (void) removeFromSuperviewSlowly
//{
//    
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.networkHandler = [[RFNetworkHandler alloc] initWithDelegate:self];
    
    [self setUpHomescreen];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setUpHomescreen
{
    self.displayingMemberInfo = false;
    
    self.goingUp = true;
    self.arrow = [[UIImageView alloc] init];
    self.arrow.image = [UIImage imageNamed:@"arrow-1.png"];
    [self.view addSubview:self.arrow];
    
    self.scheduleImage = [[UIImageView alloc] init];
    self.scheduleImage.image = [UIImage imageNamed:@"OrangePanel-1.png"];
    
    self.lightBoxCurtains = [[UIImageView alloc] init];
    self.lightBoxCurtains.image = [UIImage imageNamed:@"Curtain-1.png"];
    self.lightBoxCurtains.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    self.payPrompt = [[UIImageView alloc] init];
    self.payPrompt.image = [UIImage imageNamed:@"PayPrompt-1.png"];
    self.payPrompt.frame = CGRectMake(0, self.view.frame.size.height, 768, 536);
    
    self.TLHeader = [[UIImageView alloc] init];
    self.TLHeader.image = [UIImage imageNamed:@"TechLiminalBanner.png"];
    self.TLHeader.frame = CGRectMake(0, -302, 768, 302);
    [self.view addSubview:self.TLHeader];
    
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
    
    NSString *memberName = @"Joseph";
    
    if (self.displayingMemberInfo == true) {
        
        [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        [self displayMemberInfo:memberName];
        
    } else {
        
        [self displayMemberInfo:memberName];
        
    }
    
//    [UIView transitionWithView:self.view
//                      duration:0.25
//                       options:UIViewAnimationOptionCurveEaseIn
//                    animations:^{
//                        [self.view addSubview:MemberViewController.MemberUIView];
//                    }
//                    completion:nil];

}

- (void) displayMemberInfo:(NSString*)memberName {
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
    int boxHeight = 0.3 * (self.view.frame.size.height);
    
    
    self.greetingsI = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, yOrigin, boxWidth, boxHeight)];
    [self.greetingsI setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.greetingsI];
    
    self.greetingsI.frame =  CGRectMake(xOrigin, -1 * (self.view.frame.size.height), boxWidth, boxHeight);
    [UIView animateWithDuration:0.4 animations:^{
        self.greetingsI.frame = CGRectMake(xOrigin, yOrigin, boxWidth, boxHeight);
    }];

//    self.greetingsI.layer.borderColor = [UIColor grayColor].CGColor;
//    self.greetingsI.layer.borderWidth = 1.0f;

//    self.greetingsI.layer.borderColor = [UIColor grayColor].CGColor;
//    self.greetingsI.layer.borderWidth = 1.0f;

    
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
    
    

    
    CGRect nameFrame;
    nameFrame.origin.x = 0;
    nameFrame.origin.y = helloFrame.origin.y + helloFrame.size.height + 32;
    nameFrame.size.width = self.greetingsI.frame.size.width;
    nameFrame.size.height = 80;
    
    UILabel *name = [[UILabel alloc] initWithFrame:nameFrame];
    [name setText:memberName];
    [name setTextAlignment:UITextAlignmentCenter];
    [name setFont:[UIFont fontWithName:@"AvenirNext-UltraLight" size:78]];
    
    [self.greetingsI addSubview:name];

    [self.welcomeI setFont:[UIFont fontWithName:@"AvenirNext-UltraLight" size:46]];
    [self.welcomeI setFrame:CGRectMake(self.welcomeI.frame.origin.x, self.view.frame.size.height / 2, self.welcomeI.frame.size.width, self.welcomeI.frame.size.height)];
    
    [self.view addSubview:self.welcomeI];
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.welcomeI setFrame:CGRectMake(self.welcomeI.frame.origin.x, self.view.frame.size.height / 2 - 70, self.welcomeI.frame.size.width, self.welcomeI.frame.size.height)];
                     }
                     completion:nil];

    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.touchAmuletI.alpha = 0.0;
                         [self.touchAmuletI setFrame:CGRectMake(self.touchAmuletI.frame.origin.x, self.view.frame.size.height, self.touchAmuletI.frame.size.width, self.touchAmuletI.frame.size.height)];
                         
                     }
                     completion:nil];
    
    
    self.scheduleImage.frame = CGRectMake(0, self.view.frame.size.height, 768, 466);
    [self.view addSubview:self.scheduleImage];

    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.scheduleImage setFrame:CGRectMake(self.scheduleImage.frame.origin.x, self.view.frame.size.height - scheduleImage.frame.size.height, self.scheduleImage.frame.size.width, self.scheduleImage.frame.size.height)];
                         
                     }
                     completion:nil];
    
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
    
    
    [self.view sendSubviewToBack:self.arrow];
    self.arrow.hidden = true;
    
    [self killArrow];
    
    [self.bounce invalidate];
    self.bounce = nil;
    
    self.scheduleImage.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *tapGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
//    tapGesture.numberOfTapsRequired = 1;
    tapGesture.minimumPressDuration = 0.1;
    [self.scheduleImage addGestureRecognizer:tapGesture];
    tapGesture.delegate = self;

    
    self.displayingMemberInfo = true;
    
//    [tapGesture release];
}

-(void) handleTapGesture:(UIGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Hold.");
        self.scheduleImage.image = [UIImage imageNamed:@"OrangePanel-Depressed-1.png"];
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Release.");
        self.scheduleImage.image = [UIImage imageNamed:@"OrangePanel-1.png"];
        
        self.lightBoxCurtains.alpha = 0.0;
        [self.view addSubview:lightBoxCurtains];
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
                             self.lightBoxCurtains.alpha = 1.0;
                         }
                         completion:nil];
        
        [self showActivityDetails];
        
        

    }

//    
//    NSLog(@"Tapped.");
//
//    CGPoint tapPoint = [sender locationInView:self.scheduleImage];
//    int tapX = (int) tapPoint.x;
//    int tapY = (int) tapPoint.y;
//    NSLog(@"TAPPED X:%d Y:%d", tapX, tapY);
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"How are you?" delegate:nil cancelButtonTitle:@"I'm awesome." otherButtonTitles:nil];
//    [alert show];
}

- (void) showActivityDetails
{
    
    //    CGRectMake(0.1 * (self.view.frame.size.width), 0.1 * (self.view.frame.size.height), 0.8 * (self.view.frame.size.width), 0.8 * (self.view.frame.size.height))

    
    self.activityDetails = [[UIImageView alloc] init];
    self.activityDetails.image = [UIImage imageNamed:@"Lightbox-1.png"];
    self.activityDetails.frame = CGRectMake(0.02 * (self.view.frame.size.width), 0.02 * (self.view.frame.size.height), 0.96 * (self.view.frame.size.width), 0.96 * (self.view.frame.size.height));
    self.activityDetails.contentMode = UIViewContentModeScaleAspectFit;
    
    self.activityDetails.alpha = 0.0;
    [self.view addSubview:self.activityDetails];
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.activityDetails.alpha = 1.0;
                     }
                     completion:nil];

    
//    [self.view addSubview:self.activityDetails];

    self.activityDetails.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *activityTapGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActivityTapGesture:)];
    //    tapGesture.numberOfTapsRequired = 1;
    activityTapGesture.minimumPressDuration = 0.01;
    [self.activityDetails addGestureRecognizer:activityTapGesture];
    activityTapGesture.delegate = self;
    
    //    [tapGesture release];
}

-(void) handleActivityTapGesture:(UIGestureRecognizer *) sender {
//    if (sender.state == UIGestureRecognizerStateBegan) {
//        NSLog(@"Hold.");
//        self.scheduleImage.image = [UIImage imageNamed:@"OrangePanel-Depressed-1.png"];
//    }
//    
//    if (sender.state == UIGestureRecognizerStateEnded) {
//        NSLog(@"Release.");
//        self.scheduleImage.image = [UIImage imageNamed:@"OrangePanel-1.png"];
//        
//        self.lightBoxCurtains.alpha = 0.0;
//        [self.view addSubview:lightBoxCurtains];
//        [UIView animateWithDuration:0.3
//                              delay:0
//                            options:UIViewAnimationOptionCurveEaseIn
//                         animations:^{
//                             
//                             self.lightBoxCurtains.alpha = 1.0;
//                         }
//                         completion:nil];
//        
//        [self showActivityDetails];
//        
//        
//        
//    }
    

    NSLog(@"Activity tapped.");

    CGPoint tapPoint = [sender locationInView:self.activityDetails];
    int tapX = (int) tapPoint.x;
    int tapY = (int) tapPoint.y;
    NSLog(@"TAPPED X:%d Y:%d", tapX, tapY);

    if (tapX >= 627 && tapX <= 699 && tapY >= 40 && tapY <= 109) {
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
                             self.activityDetails.alpha = 0.0;
                         }
                         completion:nil];
        
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
                             self.lightBoxCurtains.alpha = 0.0;
                         }
                         completion:nil];
        
        [self.payPrompt setFrame:CGRectMake(0, self.view.frame.size.height, 768, 536)];
        
        [self killArrow];

    }
    
    if (tapX >= 512 && tapX <= 662 && tapY >= 345 && tapY <= 442) {

        NSLog(@"Display payment");
        
        [self.view addSubview:self.payPrompt];
        
        self.payPrompt.alpha = 0.0;
        [self.payPrompt setFrame:CGRectMake(0, self.view.frame.size.height, 768, 536)];
        
        int currentOriginY = self.payPrompt.frame.origin.y - self.payPrompt.frame.size.height;
        NSLog(@"%d", currentOriginY);
        
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.payPrompt.alpha = 1.0;
                         }
                         completion:nil];
        
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [self.payPrompt setFrame:CGRectMake(0, 488, 768, 536)];
                         }
                         completion:nil];
        
        [self arrowPrompt];
        
    }
    
    if (tapX >= 255 && tapX <= 480 && tapY >= 714 && tapY <= 767) {
        
        NSLog(@"Paying with PayPal!");
        
    }

    
//    x from 627 to 699
//    y from 40 to 109

    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"How are you?" delegate:nil cancelButtonTitle:@"I'm awesome." otherButtonTitles:nil];
//    [alert show];
    
}

- (void) arrowPrompt
{
    
    [self.bounce invalidate];
    self.bounce = nil;
    
    self.goingUp = false;
//    self.arrow = [[UIImageView alloc] init];
//    self.arrow.image = [UIImage imageNamed:@"arrow-1.png"];
    
    [self.view addSubview:self.arrow];
    self.arrow.hidden = false;
    
    self.arrow.alpha = 0.0;
    
    [UIView animateWithDuration:1.0
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.arrow.alpha = 1.0;
                     }
                     completion:nil];

    
    
//    [self startAnimationWithDuration];
    
//    int animationDuration = 1;
    
    self.bounce = [NSTimer scheduledTimerWithTimeInterval:0.6
                                                   target:self
                                                 selector:@selector(startAnimationWithDuration)
                                                 userInfo:nil
                                                  repeats:YES];
    NSLog(@"Arrow prompt.");
    
    
}

- (void) killArrow
{
    
    [self.bounce invalidate];
    self.bounce = nil;
    
    self.arrow.alpha = 1.0;
    
    [UIView animateWithDuration:1.0
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.arrow.alpha = 0.0;
                     }
                     completion:nil];

    self.arrow.hidden = true;
    [self.arrow removeFromSuperview];
    
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

//    UIImageView *imageToMove = self.arrow;
    
    int imageWidth = 113;
    int imageHeight = 152;
    int bounceHeight = 30;
    int gapAtBottom = 20;
    
    if (self.goingUp == true) {
        
        NSLog(@"Going down.");
    
        int originY = self.view.frame.size.height - imageHeight - bounceHeight - gapAtBottom;
        
        self.arrow.frame = CGRectMake((self.view.frame.size.width / 2) - (imageWidth / 2), originY, imageWidth, imageHeight);
//        [self.view addSubview:self.arrow];
        
        // Move the image
        [self moveImage:self.arrow duration:0.5
                  curve:UIViewAnimationCurveEaseInOut x:0 y:(bounceHeight / 2)];
        
        self.goingUp = false;
        
    } else {
        
        NSLog(@"Going UP.");
        
        int originY = self.view.frame.size.height - imageHeight - gapAtBottom;
        
        self.arrow.frame = CGRectMake((self.view.frame.size.width / 2) - (imageWidth / 2), originY, imageWidth, imageHeight);
//        [self.view addSubview:self.arrow];
        
        // Move the image
        [self moveImage:self.arrow duration:0.5
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
