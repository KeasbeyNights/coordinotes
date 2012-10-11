//
//  MNSMasterViewController.m
//  MasterDetail
//
//  Created by Max Scheiber on 10/09/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import "MNSMasterViewController.h"
#import "MNSDetailViewController.h"
#import "MNSNote.h"
#import "MNSNoteDataController.h"
#import "AddMNSNoteViewController.h"
#import "CoreLocation/CoreLocation.h"

@interface MNSMasterViewController () <AddMNSNoteViewControllerDelegate, CLLocationManagerDelegate>  {

}
@end

@implementation MNSMasterViewController

@synthesize dataController = _dataController;
@synthesize locationManager = _locationManager;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    [self beginCollectionLocations];
}

- (void)viewDidAppear:(BOOL)animated {
    [self beginCollectionLocations];
}

- (void)beginCollectionLocations
{
    if (nil == self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
    }
    
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 5;
    
    [self.locationManager startUpdatingLocation];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.locationManager stopUpdatingLocation];
    [super viewDidDisappear: animated];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)addMNSNoteViewControllerDidCancel:(AddMNSNoteViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)addMNSNoteViewControllerDidFinish:(AddMNSNoteViewController *)controller body:(NSString *)body latitude:(double)latitude longitude:(double)longitude {
    if ([body length]) {
        CLLocation *location = self.locationManager.location;
        double latitude = location.coordinate.latitude;
        double longitude = location.coordinate.longitude;
        [self.dataController addNoteWithBody: body latitude: latitude longitude: longitude];
        [[self tableView] reloadData];
    }
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MNSNoteCell"];

    NSDate *object = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = [object description];
    return cell; */
    
    static NSString *CellIdentifier = @"MNSNoteCell";
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM dd, yyyy HH:mm"];
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    MNSNote *noteAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:noteAtIndex.body];
    [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)noteAtIndex.date]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataController.masterNoteList removeObjectAtIndex:indexPath.row]; //_objects
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showNoteDetails"]) {
        MNSDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.note = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    } else if ([[segue identifier] isEqualToString:@"showAddMNSNoteView"]) {
        AddMNSNoteViewController *addController = (AddMNSNoteViewController *)[[[segue destinationViewController] viewControllers] objectAtIndex:0];
        addController.delegate = self;
    }
}

@end
