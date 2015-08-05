//
//  L3SDKHistogramGraphProtocol.h
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 31/07/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

@class L3SDKHistogramBarView;
@protocol L3SDKHistogramGraphViewDelegate <NSObject>
//it will be raised when a bar will be touched
-(void)L3SDKHistogramGraphView_BarViewTouched:(L3SDKHistogramBarView*)barView;
//it will be raised when a bar has been drawed and added on the graph view
-(void)L3SDKHistogramGraphView_BarViewAdded:(L3SDKHistogramBarView*)barView;
//it will be raised when the drawing operation will be completed
-(void)L3SDKHistogramGraphView_DwawingCompleted;
@end