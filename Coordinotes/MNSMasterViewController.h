//
//  MNSMasterViewController.h
//  MasterDetail
//
//  Created by Max Scheiber on 10/09/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNSSharedNotes.h"
#import "CoreLocation/CLLocationManager.h"

@class MNSNoteDataController;

@interface MNSMasterViewController : UITableViewController


@property (strong, nonatomic) MNSNoteDataController *dataController;
@property (strong, nonatomic) CLLocationManager* locationManager;

@end
