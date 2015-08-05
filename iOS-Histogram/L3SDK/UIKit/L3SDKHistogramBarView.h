//
//  L3SDKHistogramBarView.h
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 31/07/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "L3SDKHistogramGraphViewProtocol.h"
@class L3SDKHistogramBarItem;
@interface L3SDKHistogramBarView : UIView
//gets/sets a class delegate
@property (nonatomic,assign) id<L3SDKHistogramGraphViewDelegate> delegate;
//gets the instance of the L3SDKHistogramBarItem passed by initWithFrame:andBarItem factory method
@property (nonatomic,strong, readonly)L3SDKHistogramBarItem*barItem;
//factory method for initialization
-(id)initWithFrame:(CGRect)rect andBarItem:(L3SDKHistogramBarItem*)bar;
@end
