//
//  PRWorkoutsViewController.m
//  MyWorkouts
//
//  Created by Tihomir Elek on 6/1/14.
//  Copyright (c) 2014 AIT Budapest. All rights reserved.
//

#import "PRWorkoutsViewController.h"
#import "PRWorkoutsDataManager.h"
#import "PRAppDelegate.h"
#import "PRWorkoutDetailViewController.h"
#import "PREditWorkoutViewController.h"

@interface PRWorkoutsViewController ()

@end

@implementation PRWorkoutsViewController
{
    PRWorkoutsDataManager* _workoutsDataMgr;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PRAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    
    _workoutsDataMgr = appDelegate.workoutsDataMgr;
    
    self.view.backgroundColor = [UIColor lightGrayColor];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _workoutsDataMgr.workouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WorkoutsTableViewCell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary* workoutData = _workoutsDataMgr.workouts[indexPath.row];
    cell.textLabel.text = workoutData[@"name"];
    cell.detailTextLabel.text = workoutData[@"location"];
    
    NSString* workoutImageName = workoutData [@"image-name"];
    
    UIImage* workoutImage = [workoutData objectForKey: @"image"];
    
    if (workoutImage)
        cell.imageView.image = workoutImage;
    else if (workoutImageName)
        cell.imageView.image = [UIImage imageNamed:workoutImageName];
    
    return cell; 
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
    
    [_workoutsDataMgr.workouts removeObjectAtIndex:indexPath.row];
    
    NSArray* rowsToDelete = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:rowsToDelete
                     withRowAnimation:UITableViewRowAnimationFade];
}
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
    }
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
    NSDictionary* workoutToMove =
    [_workoutsDataMgr.workouts objectAtIndex: fromIndexPath.row];
    [_workoutsDataMgr.workouts removeObjectAtIndex:fromIndexPath.row];
    [_workoutsDataMgr.workouts insertObject:workoutToMove atIndex:toIndexPath.row];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"WorkoutDetailSegue"])
    {
        PRWorkoutDetailViewController* vc =
        (PRWorkoutDetailViewController*)segue.destinationViewController;
        vc.workout =
        _workoutsDataMgr.workouts[self.tableView.indexPathForSelectedRow.row];
    } 
}

#pragma mark - New methods

- (IBAction)editWorkoutViewControllerDidSave:(UIStoryboardSegue *)unwindSegue
{
    PREditWorkoutViewController* viewController =
    unwindSegue.sourceViewController;
    
    NSDictionary* tripDictionary =
    [NSDictionary dictionaryWithObjectsAndKeys:
     viewController.nameTextField.text, @"name",
     viewController.locationTextField.text, @"location",
     viewController.descriptionTextView.text, @"description",
     viewController.imageView.image, @"image", nil];
    [_workoutsDataMgr.workouts addObject:tripDictionary];
    [self.tableView reloadData];
}

- (IBAction)editTripViewControllerDidCancel:
(UIStoryboardSegue *) unwindSegue
{
    
}


@end
