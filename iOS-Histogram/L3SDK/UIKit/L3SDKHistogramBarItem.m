//
//  L3SDKHistogramBar.m
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 29/07/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKHistogramBarItem.h"


@implementation L3SDKHistogramBarItem
@synthesize color;
@synthesize value;
-(id)init{
    if ([super init]) {
        //read only properties initialization
        _label=[[L3SDKHistogramBarLabel alloc]init];
        _gadientColors=[[L3SDKHistogramBarLinearGradient alloc]init];
    }
    return self;
}

@end
