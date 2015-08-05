//
//  L3SDKHistogramGraph.m
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 30/07/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKHistogramGraphView.h"
#import "L3SDKHistogramBarView.h"
#import "L3SDKHistogramBarItem.h"
@interface L3SDKHistogramGraphView()
@property (nonatomic,strong)NSMutableArray*bars;
-(void)initClass;
-(CGRect)getRectForBar:(L3SDKHistogramBarItem*)bar withPreviousRect:(CGRect)rect;
-(void)clearContext;
@end
@implementation L3SDKHistogramGraphView
@synthesize delegate;
@synthesize orientation;

#pragma mark Init Methods

-(id)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        [self initClass];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    if (self) {
        [self initClass];
    }
    return self;
}

-(CGRect)getRectForBar:(L3SDKHistogramBarItem*)bar withPreviousRect:(CGRect)rect {
    
    //this function will build a CGRect for bar drawing,
    //depending on the graph orientation
    float rectWidth=0;
    float rectHeight=0;
    float x=0;
    float y=0;
    
    switch (self.orientation) {
        case L3SDKHistogramGraphOrientationHorizontal:
            rectWidth=(bar.value/100)*self.frame.size.width;
            rectHeight=self.frame.size.height/self.bars.count;
            x=0;
            y=rect.origin.y+ rect.size.height;
            break;
        case L3SDKHistogramGraphOrientationVertical:
            rectWidth=self.frame.size.width/self.bars.count;
            rectHeight=(bar.value/100)*self.frame.size.height;
            x=rect.origin.x+ rect.size.width;
            y=self.frame.size.height-rectHeight;
            break;
    }
    
    return CGRectMake( x,y,rectWidth,rectHeight);
}

- (void)drawRect:(CGRect)rect {
    
    CGRect barRect=CGRectZero;
    //just for convenience, if the orientation is L3SDKHistogramGraphOrientationHorizontal
    //we will start to add bars by starting from the last item
    NSEnumerator*bars=self.orientation==L3SDKHistogramGraphOrientationVertical ? [self.bars objectEnumerator] : [self.bars reverseObjectEnumerator];
    
    for (L3SDKHistogramBarItem*bar in bars)
    {
        //gets the bar CGRect (depending ofr the graph orientation)
        barRect=[self getRectForBar:bar withPreviousRect:barRect];
        //create an L3SDKHistogramBarView instance
        L3SDKHistogramBarView*barView=[[L3SDKHistogramBarView alloc] initWithFrame:barRect andBarItem:bar];
        barView.delegate=self.delegate;
        //add bar on the graph view
        [self addSubview:barView];
        //raise event
        if (self.delegate!=NULL && [self.delegate respondsToSelector:@selector(L3SDKHistogramGraphView_BarViewAdded:)])  {
            [self.delegate L3SDKHistogramGraphView_BarViewAdded:barView];
        }
    }
    
    //raise event
    if (self.delegate!=NULL && [self.delegate respondsToSelector:@selector(L3SDKHistogramGraphView_DwawingCompleted)]) {
        [self.delegate L3SDKHistogramGraphView_DwawingCompleted];
    }
    
}

#pragma mark Public Methods
-(void)addBar:(L3SDKHistogramBarItem*)bar{
    [self.bars addObject:bar];
}
#pragma mark Public Getter/Setter Methods
-(void)setOrientation:(L3SDKHistogramGraphOrientation)value{
    orientation=value;
    [self clearContext];
}

#pragma mark Private Methods
-(void)initClass{
    self.bars=[NSMutableArray arrayWithCapacity:10];
    self.backgroundColor = [UIColor clearColor];
    self.clearsContextBeforeDrawing = YES;
}
-(void)clearContext {
    //remove all L3SDKHistogramBarView and redraw graph
    for (L3SDKHistogramBarView*barView in [self.subviews objectEnumerator]) {
        [barView removeFromSuperview];
    }
    [self setNeedsDisplay];
}


@end
