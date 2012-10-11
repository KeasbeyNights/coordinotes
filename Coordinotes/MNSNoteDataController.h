//
//  MNSNoteDataController.h
//  Coordinotes
//
//  Created by Max Scheiber on 10/10/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNSSharedNotes.h"

@class MNSNote;

@interface MNSNoteDataController : NSObject {
    MNSSharedNotes *notesObj;
}

@property (nonatomic, copy) NSMutableArray *masterNoteList;

- (NSUInteger) countOfList;

- (MNSNote *)objectInListAtIndex:(NSUInteger)theIndex;

- (void)addNoteWithBody:(NSString *)inputBody latitude:(double)inputLatitude
              longitude:(double)inputLongitude;

@end
