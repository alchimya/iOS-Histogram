//
//  L3SDKHistogramBar.h
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 29/07/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "L3SDKHistogramBarLabel.h"
#import "L3SDKHistogramBarLinearGradient.h"
@interface L3SDKHistogramBarItem : NSObject
//gets/sets value (0-100 %) of the bar
@property (nonatomic,assign)float value;
//gets an instance of an L3SDKHistogramBarLabel object
//through this instance you can set text, color and font of the bar label
@property (nonatomic,strong, readonly)L3SDKHistogramBarLabel*label;
//gets/sets the (flat) color of the bar
@property (nonatomic,strong)UIColor*color;
//gets an instance of an L3SDKHistogramBarLinearGradient object
//through this instance you can fill the bar with a linear gradint by defining
// start and end color of the gradient
@property (nonatomic,strong, readonly)L3SDKHistogramBarLinearGradient*gadientColors;
@end
