//
//  PREditWorkoutViewController.h
//  MyWorkouts
//
//  Created by Tihomir Elek on 6/2/14.
//  Copyright (c) 2014 AIT Budapest. All rights reserved.
//

@class ITEditTripViewController;

#import <UIKit/UIKit.h>

@interface PREditWorkoutViewController : UIViewController <UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@end