//
//  L3SDKHistogramBarLabel.h
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 30/07/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface L3SDKHistogramBarLabel : NSObject
//gets/sets text label of the bar
@property (nonatomic,strong)NSString*text;
//gets/sets the color for the text label
@property (nonatomic,strong)UIColor*color;
//gets/sets the font for the text label
@property (nonatomic,assign)UIFont*font;
@end
