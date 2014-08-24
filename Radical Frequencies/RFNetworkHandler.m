//
//  RFNetworkHandler.m
//  Radical Frequencies
//
//  Created by J.D. Zamfirescu-Pereira on 8/23/14.
//  Copyright (c) 2014 TechLiminal. All rights reserved.
//

#import "RFNetworkHandler.h"

@implementation RFNetworkHandler

- (id)initWithDelegate:(id <NetworkHandlerDelegate>)delegate {
    self = [super init];
    self.delegate = delegate;
    return self;
}

@end
