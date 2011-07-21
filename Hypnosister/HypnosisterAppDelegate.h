//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Jerrad Thramer on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HypnosisView;

@interface HypnosisterAppDelegate : NSObject <UIApplicationDelegate> 
{
    HypnosisView *view;
}

@property (strong, nonatomic) UIWindow *window;

@end
