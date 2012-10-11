//
//  MNSMapViewController.m
//  Coordinotes
//
//  Created by Max Scheiber on 10/10/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import "MNSMapViewController.h"
#import "MNSNote.h"

@interface MNSMapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MNSMapViewController

@synthesize mapView = _mapView;
@synthesize dataController = _dataController;

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    notesObj = [MNSSharedNotes sharedNotes];
    
    for (MNSNote *note in notesObj.notes) {
        CLLocation *l = [[CLLocation alloc] initWithLatitude:note.latitude longitude:note.longitude];
        MKPointAnnotation* annot = [[MKPointAnnotation alloc] init];
        [annot setCoordinate: l.coordinate];
        [annot setTitle:note.body];
		
        [self.mapView addAnnotation:annot];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.mapView removeAnnotations: self.mapView.annotations];
    [super viewDidDisappear:animated];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
