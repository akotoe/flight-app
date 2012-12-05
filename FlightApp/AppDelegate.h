//
//  AppDelegate.h
//  FlightApp
//
//  Created by Edward Akoto on 12/2/12.
//  Copyright (c) 2012 Edward Akoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSString *arrivalDelay;
}

@property (strong, nonatomic) UIWindow *window;
@property (copy, readwrite) NSString *arrivalDelay;

@end
