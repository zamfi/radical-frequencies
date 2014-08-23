//
//  MemberUIView.m
//  Radical Frequencies
//
//  Created by Gil Zamfirescu on 8/23/14.
//  Copyright (c) 2014 TechLiminal. All rights reserved.
//

#import "MemberUIView.h"

@implementation MemberUIView

- (id)initWithFrame:(CGRect)frame andColor:(UIColor*)color
{

//    CGRect thisFrame = self.frame;
//    
//    thisFrame.size.width = 200;
//    thisFrame.size.height = 200;
    
    self = [super initWithFrame:frame];
    if (self) {
//        [self setFrame:thisFrame];
        
        [self setBackgroundColor:[UIColor lightGrayColor]];
        NSLog(@"Inside class.");
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
