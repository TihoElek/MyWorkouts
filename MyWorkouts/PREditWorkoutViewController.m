//
//  PREditWorkoutViewController.m
//  MyWorkouts
//
//  Created by Tihomir Elek on 6/2/14.
//  Copyright (c) 2014 AIT Budapest. All rights reserved.
//

#import "PREditWorkoutViewController.h"

@interface PREditWorkoutViewController ()

- (IBAction)textFieldDidEndOnExit:(id)sender;
- (IBAction)textFieldEditingDidBegin:(UITextField *)sender;
- (IBAction)textFieldEditingDidEnd:(UITextField *)sender;
- (void)handeImageViewTap:(UITapGestureRecognizer*)recognizer;

@end

@implementation PREditWorkoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handeImageViewTap:)];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:tapRecognizer];
    
    self.descriptionTextView.delegate = self;
    
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setNameTextField:nil];
    [self setLocationTextField:nil];
    [self setDescriptionTextView:nil];
    [super viewDidUnload];
}

- (IBAction)textFieldDidEndOnExit:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)textFieldEditingDidBegin:(UITextField *)sender
{
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.view.frame = CGRectOffset(self.view.frame, 0, -100);
                     } completion:nil];
}

- (IBAction)textFieldEditingDidEnd:(UITextField *)sender
{
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.view.frame = CGRectOffset(self.view.frame, 0, 100);
                     } completion:nil];
}

- (void)handeImageViewTap:(UITapGestureRecognizer*)recognizer
{
    UIImagePickerController* pickerController = [[UIImagePickerController alloc] init];
    pickerController.delegate = self;
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:pickerController animated:YES completion:nil];
}

#pragma mark - from UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.view.frame = CGRectOffset(self.view.frame, 0, -210);
                     } completion:nil];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.view.frame = CGRectOffset(self.view.frame, 0, 210);
                     } completion:nil];
}

#pragma mark - from UIImagePickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = selectedImage;
    [self dismissViewControllerAnimated:YES completion:nil];
    self.imageView.backgroundColor = [UIColor whiteColor];
}

@end