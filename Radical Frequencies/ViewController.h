//
//  ViewController.h
//  Radical Frequencies
//
//  Created by Gil Zamfirescu on 8/23/14.
//  Copyright (c) 2014 TechLiminal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberUIView.h"

@interface ViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UIWebView *WebView;
@property (weak, nonatomic) MemberUIView *MemberView;

@property (assign, nonatomic) BOOL goingUp;
@property (strong, nonatomic) UIImageView *arrow;

@property (weak, nonatomic) UILabel *welcomeI;

@property (weak, nonatomic) UIView *greetingsI;
@property (weak, nonatomic) UILabel *helloI;
@property (weak, nonatomic) UILabel *nameI;

@property (weak,nonatomic) UIView *scheduleI;

- (IBAction)ShowLightbox:(id)sender;

@end
