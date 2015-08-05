//
//  L3SDKCGGradient.h
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 05/08/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface L3SDKCGGradient : NSObject
//it allows to draw a gradient
+(void) drawLinearGradientWithContext:(CGContextRef)context andRect:(CGRect) rect andStartColor:(CGColorRef) startColor andEndColor:(CGColorRef) endColor;
@end
