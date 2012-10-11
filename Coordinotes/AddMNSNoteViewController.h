//
//  AddMNSNoteViewController.h
//  Coordinotes
//
//  Created by Max Scheiber on 10/10/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddMNSNoteViewControllerDelegate;

@interface AddMNSNoteViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *bodyInput;
@property (weak, nonatomic) id <AddMNSNoteViewControllerDelegate> delegate;

- (IBAction)save:(id)sender;

- (IBAction)cancel:(id)sender;

@end

@protocol AddMNSNoteViewControllerDelegate <NSObject>

- (void)addMNSNoteViewControllerDidCancel:(AddMNSNoteViewController *)controller;

- (void)addMNSNoteViewControllerDidFinish:(AddMNSNoteViewController *)controller
                                     body:(NSString *)body
                                 latitude:(double)latitude
                                longitude:(double)longitude;
@end