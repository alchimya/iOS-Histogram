//
//  L3SDKHistogramGraph.h
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 30/07/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "L3SDKHistogramGraphViewProtocol.h"
@class L3SDKHistogramBarItem;

@interface L3SDKHistogramGraphView : UIView

//enum to define graph orientation
typedef enum : NSUInteger {
    L3SDKHistogramGraphOrientationVertical,
    L3SDKHistogramGraphOrientationHorizontal
} L3SDKHistogramGraphOrientation;

//gets/sets class delegate
@property (nonatomic,assign)id<L3SDKHistogramGraphViewDelegate>delegate;
//gets/sets graph orientation
@property (nonatomic,assign) L3SDKHistogramGraphOrientation orientation;
//allows to add an L3SDKHistogramBarItem instance on the graph
-(void)addBar:(L3SDKHistogramBarItem*)bar;
@end
