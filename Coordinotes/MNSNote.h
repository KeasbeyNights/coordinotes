//
//  MNSNote.h
//  Coordinotes
//
//  Created by Max Scheiber on 10/10/12.
//  Copyright (c) 2012 Max Scheiber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNSNote : NSObject

@property (nonatomic, copy) NSString *body;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic, strong) NSDate *date;

-(id)initWithBody:(NSString *)body latitude:(double)latitude longitude:(double)longitude
             date:(NSDate *)date;

@end
