//
//  L3SDKHistogramBarView.m
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 31/07/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKHistogramBarView.h"
#import "L3SDKHistogramBarItem.h"
#import "L3SDKCGGradient.h"
@interface L3SDKHistogramBarView()
@property (nonatomic,assign)CGRect rect;
-(void)createBarWithContext:(CGContextRef)context;
-(void)addBarLabel;
@end
@implementation L3SDKHistogramBarView
@synthesize delegate;
@synthesize barItem;
-(id)initWithFrame:(CGRect)rect andBarItem:(L3SDKHistogramBarItem*)bar{

    barItem=bar;
    self=[super initWithFrame:rect];
    if (self) {
        //nothing
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //gets the current UI graphics context
    CGContextRef context=UIGraphicsGetCurrentContext();
    //store rect in a private property
    self.rect=rect;
    //draw a rect
    [self createBarWithContext:context];
    //if start and end colors have been defined for the L3SDKHistogramBarLinearGradient instance
    //baw will be filled with a gradient
    if (self.barItem.gadientColors.startColor!=nil && self.barItem.gadientColors.endColor!=nil ) {
        [L3SDKCGGradient drawLinearGradientWithContext:context andRect:self.rect andStartColor:self.barItem.gadientColors.startColor.CGColor andEndColor:self.barItem.gadientColors.endColor.CGColor];
    }
    //add label on the graph
    [self addBarLabel];
    
}
#pragma mark - Touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    //set start touch point
    CGPoint gestureStartPoint = [touch locationInView:self];
    //get view from touch
    L3SDKHistogramBarView*v=(L3SDKHistogramBarView*) [self hitTest:gestureStartPoint withEvent:event];
    //raise event
    if (self.delegate!=NULL && [self.delegate respondsToSelector:@selector(L3SDKHistogramGraphView_BarViewTouched:)]) {
        [self.delegate L3SDKHistogramGraphView_BarViewTouched:v];
    }
}



-(void)createBarWithContext:(CGContextRef)context{
    //drwa a bar as a rect
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.rect);
    CGContextSetFillColorWithColor(context, self.barItem.color.CGColor);
    CGContextAddPath(context, path);
    CGPathRelease(path);
    CGContextFillPath(context);
    
}
-(void)addBarLabel{
    
    //add text on the bar through L3SDKHistogramBarLabel instance
    CGRect textRect=CGRectMake(self.rect.origin.x, self.rect.origin.y, self.rect.size.width, self.rect.size.height);
    
    if (self.barItem.label.font==nil) {
        self.barItem.label.font=[UIFont fontWithName:@"Courier" size:12];
    }
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = kCTTextAlignmentRight;
    
    NSDictionary *attributes = @{ NSFontAttributeName: self.barItem.label.font,
                                  NSParagraphStyleAttributeName:style,
                                  NSForegroundColorAttributeName:self.barItem.label.color};
    
    NSString*label= self.barItem.label.text==nil ? [NSString stringWithFormat:@"%.2f",self.barItem.value] :self.barItem.label.text;
    
    [label drawInRect:textRect withAttributes:attributes];
    
}



@end
