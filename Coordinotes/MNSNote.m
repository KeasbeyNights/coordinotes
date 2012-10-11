//
//  MNSNote.m
//  Coordinotes
//
//  Created by Max Scheiber on 10/10/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import "MNSNote.h"

@implementation MNSNote

@synthesize body = _body, latitude = _latitude, longitude = _longitude, date = _date;

-(id)initWithBody:(NSString *)body latitude:(double)latitude longitude:(double)longitude date:(NSDate *)date {
    {
        self = [super init];
        if (self) {
            _body = body;
            _latitude = latitude;
            _longitude = longitude;
            _date = date;
            return self;
        }
        return nil;
    }
}

@end
