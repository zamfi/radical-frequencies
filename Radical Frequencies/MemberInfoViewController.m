//
//  MemberInfoViewController.m
//  Radical Frequencies
//
//  Created by Gil Zamfirescu on 8/23/14.
//  Copyright (c) 2014 TechLiminal. All rights reserved.
//

#import "MemberInfoViewController.h"

@interface MemberInfoViewController ()

@end

@implementation MemberInfoViewController

@synthesize MemberUIView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CGRect newFrame = self.MemberUIView.frame;
        
        newFrame.size.width = 200;
        newFrame.size.height = 200;
        [self.MemberUIView setFrame:newFrame];

        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
