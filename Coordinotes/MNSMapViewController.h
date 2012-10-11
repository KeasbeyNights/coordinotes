//
//  MNSMapViewController.h
//  Coordinotes
//
//  Created by Max Scheiber on 10/10/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MNSSharedNotes.h"
#import "MNSNoteDataController.h"

@interface MNSMapViewController : UIViewController {
    MNSSharedNotes *notesObj;
}

@property (strong, nonatomic) MNSNoteDataController *dataController;

@end
