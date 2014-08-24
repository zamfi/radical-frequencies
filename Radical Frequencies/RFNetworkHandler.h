//
//  RFNetworkHandler.h
//  Radical Frequencies
//
//  Created by J.D. Zamfirescu-Pereira on 8/23/14.
//  Copyright (c) 2014 TechLiminal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkHandlerDelegate <NSObject>

- (void)amuletWasTaggedByMember:(NSDictionary *)memberInfo shouldDisplay:(NSDictionary *)displayInfo;

@end


@interface RFNetworkHandler : NSObject

@property (weak, nonatomic) id <NetworkHandlerDelegate> delegate;

- (id)initWithDelegate:(id <NetworkHandlerDelegate>)delegate;

@end

