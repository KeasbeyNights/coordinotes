//
//  MNSDetailViewController.m
//  MasterDetail
//
//  Created by Max Scheiber on 10/09/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import "MNSDetailViewController.h"
#import "MNSNote.h"

@interface MNSDetailViewController ()
- (void)configureView;
@end

@implementation MNSDetailViewController

@synthesize note = _note, bodyText = _bodyText, dateLabel = _dateLabel;

#pragma mark - Managing the detail item

- (void)setNote:(MNSNote *) newNote {
    if (_note != newNote) {
        _note = newNote;
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    MNSNote *theNote = self.note;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM dd, yyyy HH:mm"];
    }
    if (theNote) {
        self.bodyText.text = theNote.body;
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theNote.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    self.note = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
