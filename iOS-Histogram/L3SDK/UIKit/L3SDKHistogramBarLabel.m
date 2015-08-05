//
//  L3SDKHistogramBarLabel.m
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 30/07/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKHistogramBarLabel.h"

@implementation L3SDKHistogramBarLabel
@synthesize text;
@synthesize color;
@synthesize font;

-(id)init{
    if ([super init]) {
        //read only properties initialization
        self.color=[UIColor blackColor];
    }
    return self;
}

@end
