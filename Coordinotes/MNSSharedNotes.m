//
//  MNSSharedNotes.m
//  Coordinotes
//
//  Created by Max Scheiber on 10/10/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import "MNSSharedNotes.h"

@implementation MNSSharedNotes

@synthesize notes;

static MNSSharedNotes *sharedInstance = nil;

+ (MNSSharedNotes *) sharedNotes {
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }
    
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        notes = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
