//
//  PRWorkoutsDataManager.m
//  MyWorkouts
//
//  Created by Tihomir Elek on 6/1/14.
//  Copyright (c) 2014 AIT Budapest. All rights reserved.
//

#import "PRWorkoutsDataManager.h"

@implementation PRWorkoutsDataManager

- (id)init
{
    if (self = [super init])
    {
        NSString *filePath = [[NSBundle mainBundle]
                              pathForResource:@"InitialWorkouts" ofType:@"plist"];
        self.workouts = [NSMutableArray arrayWithContentsOfFile:filePath];
    } 
    
    return self; 
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager]
             URLsForDirectory:NSDocumentDirectory
             inDomains:NSUserDomainMask] lastObject];
}

- (void)saveWorkouts
{
    NSString *workoutsFilePath = [[[self applicationDocumentsDirectory] path]
                               
                               stringByAppendingPathComponent:@"workouts.plist"];
    
    NSData *data = [NSPropertyListSerialization
                    dataFromPropertyList:self.workouts
                    format:NSPropertyListXMLFormat_v1_0
                    errorDescription:nil]; 
    [data writeToFile:workoutsFilePath atomically:YES];
    
}

- (void)loadWorkouts
{
    NSString *workoutsFilePath = [[[self applicationDocumentsDirectory] path]
                               
                               stringByAppendingPathComponent:@"workouts.plist"];
    
    NSData *plistData = [NSData dataWithContentsOfFile:workoutsFilePath];
    
    NSMutableArray* workouts = [NSPropertyListSerialization
                             propertyListFromData:plistData
                             mutabilityOption:
                             NSPropertyListMutableContainersAndLeaves 
                             format:NULL errorDescription:nil];
    
    if (workouts)
    {
        self.workouts = workouts;
    } 
}
@end
