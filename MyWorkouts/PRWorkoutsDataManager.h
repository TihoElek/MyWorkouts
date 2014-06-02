//
//  PRWorkoutsDataManager.h
//  MyWorkouts
//
//  Created by Tihomir Elek on 6/1/14.
//  Copyright (c) 2014 AIT Budapest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRWorkoutsDataManager : NSObject

- (NSURL *)applicationDocumentsDirectory;
- (void)saveWorkouts;
- (void)loadWorkouts;

@property (strong, nonatomic) NSMutableArray *workouts;

@end
