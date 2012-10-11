//
//  AddMNSNoteViewController.m
//  Coordinotes
//
//  Created by Max Scheiber on 10/10/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import "AddMNSNoteViewController.h"

@interface AddMNSNoteViewController ()

@end

@implementation AddMNSNoteViewController

@synthesize bodyInput = _bodyInput;
@synthesize delegate = _delegate;

- (void)viewDidLoad
{   
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setBodyInput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)save:(id)sender {
    [[self delegate] addMNSNoteViewControllerDidFinish:self body:self.bodyInput.text latitude:0 longitude:0];
}

- (IBAction)cancel:(id)sender {
     [[self delegate] addMNSNoteViewControllerDidCancel:self];
}
@end
