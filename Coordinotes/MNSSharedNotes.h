//
//  MNSSharedNotes.h
//  Coordinotes
//
//  Created by Max Scheiber on 10/10/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNSSharedNotes : NSObject

@property (nonatomic, strong) NSMutableArray *notes;

+(MNSSharedNotes *)sharedNotes;

@end
