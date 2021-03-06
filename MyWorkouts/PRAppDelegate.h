//
//  PRAppDelegate.h
//  MyWorkouts
//
//  Created by Tihomir Elek on 6/1/14.
//  Copyright (c) 2014 AIT Budapest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRWorkoutsDataManager.h"

@interface PRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PRWorkoutsDataManager *workoutsDataMgr;

@end
