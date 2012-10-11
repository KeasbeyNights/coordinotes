//
//  MNSNoteDataController.m
//  Coordinotes
//
//  Created by Max Scheiber on 10/10/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import "MNSNoteDataController.h"
#import "MNSNote.h"

@interface MNSNoteDataController ()
- (void)initializeDefaultDataList;
@end

@implementation MNSNoteDataController

@synthesize masterNoteList = _masterNoteList;

- (void)initializeDefaultDataList {
    NSMutableArray *noteList = [[NSMutableArray alloc] init];
    self.masterNoteList = noteList;
}

- (void)setMasterNoteList:(NSMutableArray *)newList {
    if (_masterNoteList != newList) {
        _masterNoteList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfList {
    notesObj.notes = self.masterNoteList;
    return [self.masterNoteList count];
}

- (MNSNote *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterNoteList objectAtIndex:theIndex];
}

- (void)addNoteWithBody:(NSString *)inputBody latitude:(double)inputLatitude longitude:(double)inputLongitude {
    MNSNote *note;
    NSDate *now = [NSDate date];
    note = [[MNSNote alloc] initWithBody:inputBody latitude:inputLatitude longitude:inputLongitude date:now];
    [self.masterNoteList insertObject:note atIndex: 0];
}

- (id)init {
    notesObj = [MNSSharedNotes sharedNotes];
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

@end
