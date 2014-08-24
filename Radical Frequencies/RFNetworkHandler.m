//
//  RFNetworkHandler.m
//  Radical Frequencies
//
//  Created by J.D. Zamfirescu-Pereira on 8/23/14.
//  Copyright (c) 2014 TechLiminal. All rights reserved.
//

#import "RFNetworkHandler.h"
#import "AFNetworking.h"

@implementation RFNetworkHandler

- (id)initWithDelegate:(id <NetworkHandlerDelegate>)delegate {
    self = [super init];
    self.delegate = delegate;
    self.lastTagTime = [[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]*1000] unsignedLongLongValue];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(pingServerForTags) userInfo:nil repeats:YES];
    
    self.checkUrl = [NSString stringWithFormat:@"http://jd-mbp.local:8000/checkForTags?shared_secret=%@", [@"O[RVeWmPrm4OIzmXz&C}w-CM!m:f7*I" stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-_.!~*'()"]]];
    self.displayDataUrl = [NSString stringWithFormat:@"http://jd-mbp.local:8000/getMemberDisplayData?shared_secret=%@", [@"O[RVeWmPrm4OIzmXz&C}w-CM!m:f7*I" stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-_.!~*'()"]]];
    return self;
}

- (void)pullMemberDisplayData:(unsigned int)userId {
    NSString *urlString = [NSString stringWithFormat:@"%@&id=%d", self.displayDataUrl, userId];
//    NSLog(@"urlString %@", urlString);
    NSURL *url = [NSURL URLWithString:urlString];
//    NSLog(@"Using URL %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * response = (NSDictionary *)responseObject;
        
        if ([@"ok" isEqualToString:[response objectForKey:@"status"]]) {
//            NSLog(@"Success getting display data! %@", response);
            NSDictionary *data = [response objectForKey:@"data"];
            [self.delegate amuletWasTaggedByMember:[data objectForKey:@"member"]
                                     shouldDisplay:[data objectForKey:@"events"]];
        } else {
//            NSLog(@"Weird json value: %@", response);
            UIAlertView *alertView =
            [[UIAlertView alloc] initWithTitle:@"Error getting display data! (1)"
                                       message:@"Unexpected JSON status value"
                                      delegate:nil
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil ];
            [alertView show];
            [self.timer invalidate];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alertView =
        [[UIAlertView alloc] initWithTitle:@"Error getting display data! (2)"
                                   message:[error localizedDescription]
                                  delegate:nil
                         cancelButtonTitle:@"OK"
                         otherButtonTitles:nil];
        [alertView show];
        [self.timer invalidate];
    }];
    
    [operation start];

}

- (void)pingServerForTags {
    NSString *urlString = [NSString stringWithFormat:@"%@&since=%llu", self.checkUrl, self.lastTagTime];
//    NSLog(@"urlString %@", urlString);
    NSURL *url = [NSURL URLWithString:urlString];
//    NSLog(@"Using URL %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * response = (NSDictionary *)responseObject;

        if ([@"ok" isEqualToString:[response objectForKey:@"status"]]) {
//            NSLog(@"Success checking for tags since %llu! %@", self.lastTagTime, response);
            NSDictionary *lastId = [[response objectForKey:@"tags"] lastObject];
            if (lastId != NULL) {
                self.lastTagTime = [[lastId objectForKey:@"date"] unsignedLongLongValue];
                [self pullMemberDisplayData:[[lastId objectForKey:@"id"] unsignedIntValue]];
            }
        } else {
//            NSLog(@"Weird json value: %@", response);
            UIAlertView *alertView =
            [[UIAlertView alloc] initWithTitle:@"Error checking for tags! (1)"
                                       message:@"Unexpected JSON status value"
                                      delegate:nil
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil ];
            [alertView show];
            [self.timer invalidate];
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alertView =
            [[UIAlertView alloc] initWithTitle:@"Error checking for tags! (2)"
                                       message:[error localizedDescription]
                                      delegate:nil
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
        [alertView show];
        [self.timer invalidate];
    }];
    
    [operation start];
}

@end
