//
//  MNSDetailViewController.h
//  MasterDetail
//
//  Created by Max Scheiber on 10/09/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MNSNote;

@interface MNSDetailViewController : UIViewController

@property (strong, nonatomic) MNSNote *note;
@property (weak, nonatomic) IBOutlet UITextView *bodyText;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
