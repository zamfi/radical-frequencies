//
//  ViewController.h
//  Radical Frequencies
//
//  Created by Gil Zamfirescu on 8/23/14.
//  Copyright (c) 2014 TechLiminal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberUIView.h"
#import "RFNetworkHandler.h"

#import "CardIO.h"

@interface ViewController : UIViewController <NetworkHandlerDelegate, UIGestureRecognizerDelegate, CardIOPaymentViewControllerDelegate>

//@property (weak, nonatomic) IBOutlet UIWebView *WebView;
@property (strong, nonatomic) MemberUIView *MemberView;

@property (strong, nonatomic) NSString *latestCheckinName;
@property (assign, nonatomic) BOOL awaitingPaymentConfirmtion;

@property (assign, nonatomic) BOOL displayingMemberInfo;

@property (assign, nonatomic) BOOL payingWithPayPal;

@property (assign, nonatomic) BOOL goingUp;
@property (strong, nonatomic) UIImageView *arrow;

@property (strong, nonatomic) UIImageView *TLHeader;

@property (strong, nonatomic) UIView *welcomeView;
@property (strong, nonatomic) UILabel *welcomeI;
@property (strong, nonatomic) UILabel *touchAmuletI;

@property (strong, nonatomic) UIView *greetingsI;
@property (strong, nonatomic) UILabel *helloI;
@property (strong, nonatomic) UILabel *nameI;

@property (strong, nonatomic) UIView *scheduleI;
@property (strong, nonatomic) UIImageView *scheduleImage;

@property (strong, nonatomic) NSTimer *bounce;


@property (strong, nonatomic) UIImageView *lightBoxCurtains;

@property (strong, nonatomic) UIImageView *activityDetails;

@property (strong, nonatomic) UIImageView *payPrompt;
@property (strong, nonatomic) UIImageView *payCheckmark;


@property (strong, nonatomic) RFNetworkHandler *networkHandler;

- (IBAction)ShowLightbox:(id)sender;

- (void)amuletWasTaggedByMember:(NSDictionary *)memberInfo shouldDisplay:(NSDictionary *)displayInfo;

@end
