# iOS-Histogram
A very simple histogram graph built with Core Graphics.

<br/> 
![ScreenShot](https://raw.github.com/alchimya/iOS-Histogram/master/screenshots/v_graph.jpg)
![ScreenShot](https://raw.github.com/alchimya/iOS-Histogram/master/screenshots/h_graph.jpg)

# How to use?
This package consists of the following classes:
- <b>L3SDKHistogramBarItem</b>: it defines the bar graph parameters
- <b>L3SDKHistogramBarLabel</b>: it defines the label bar parameters
- <b>L3SDKHistogramBarLinearGradient</b>: it defines the bar linear gradient start and end colors
- <b>L3SDKHistogramBarView</b>: it defines the bar view
- <b>L3SDKHistogramGraphView</b>: it defines the graph view (a composite view of L3SDKHistogramBarView objects)

![ScreenShot](https://raw.github.com/alchimya/iOS-Histogram/master/screenshots/graph.jpg)

<b>L3SDKHistogramBarItem</b>
<h5>properties</h5>

  name                        |     type                        |   description    
------------------------------| --------------------------------|--------------------------------------------------------
value                         | float                           | gets/sets value (0-100 %) of the bar
label                         | L3SDKHistogramBarLabel          | gets an instance of an L3SDKHistogramBarLabel object. Through this instance you can set text, color and font of the bar label.
color                         | UIColor                         | gets/sets the (flat) color of the bar
gadientColors                 | L3SDKHistogramBarLinearGradient | gets an instance of an L3SDKHistogramBarLinearGradient object. Through this instance you can fill the bar with a linear gradint by defining start and end color of the gradient

<b>L3SDKHistogramBarLabel</b>
<h5>properties</h5>

  name                        |     type                        |   description    
------------------------------| --------------------------------|--------------------------------------------------------
text                          | NSString                        | gets/sets text label of the bar
color                         | UIColor                         | gets/sets the color for the text label
font                          | UIFont                          | gets/sets the font for the text label

<b>L3SDKHistogramBarLinearGradient</b>
<h5>properties</h5>

  name                        |     type                        |   description    
------------------------------| --------------------------------|--------------------------------------------------------
startColor                    | UIColor                         | gets/sets start color for linear gradient color definition
endColor                      | UIColor                         | gets/sets end color for linear gradient color definition

<b>L3SDKHistogramBarView</b>
<h5>properties</h5>

  name                        |     type                            |   description    
------------------------------| ------------------------------------|--------------------------------------------------------
delegate                      | id<L3SDKHistogramGraphViewDelegate> | gets/sets a class delegate (see L3SDKHistogramGraphViewDelegate)
barItem                       | L3SDKHistogramBarItem               | gets the instance of the L3SDKHistogramBarItem passed by initWithFrame:andBarItem factory method

<h5>methods</h5>
  name                    |     type        |   description    
--------------------------| ----------------|-------------------------------------------------------------------
initWithFrame:andBarItem: | id              | factory method for initialization

<b>L3SDKHistogramGraphView</b>
<h5>properties</h5>

  name                        |     type                            |   description    
------------------------------| ------------------------------------|--------------------------------------------------------
delegate                      | id<L3SDKHistogramGraphViewDelegate> | gets/sets a class delegate (see L3SDKHistogramGraphViewDelegate)
orientation                   | L3SDKHistogramGraphOrientation      | allows to add an L3SDKHistogramBarItem instance on the graph

<h5>methods</h5>
  name                    |     type        |   description    
--------------------------| ----------------|-------------------------------------------------------------------
addBar                    | void            | allows to add an L3SDKHistogramBarItem instance on the graph

<h5>protocols</h5>

```objectivec
@protocol L3SDKHistogramGraphViewDelegate <NSObject>
//it will be raised when a bar will be touched
-(void)L3SDKHistogramGraphView_BarViewTouched:(L3SDKHistogramBarView*)barView;
//it will be raised when a bar has been drawed and added on the graph view
-(void)L3SDKHistogramGraphView_BarViewAdded:(L3SDKHistogramBarView*)barView;
//it will be raised when the drawing operation will be completed
-(void)L3SDKHistogramGraphView_DwawingCompleted;
@end
```
<h5>enums</h5>

```objectivec
typedef enum : NSUInteger {
    L3SDKHistogramGraphOrientationVertical,
    L3SDKHistogramGraphOrientationHorizontal
} L3SDKHistogramGraphOrientation;
```

<h5>example</h5>
```objectivec

 //init the L3SDKHistogramGraphView instance and add it on the main view
    self.graph=[[L3SDKHistogramGraphView alloc]  initWithFrame:
                    CGRectMake(0,
                               100,
                               self.view.bounds.size.width,
                               self.view.bounds.size.height/3)
                ];
    
    self.graph.center=self.view.center;
    self.graph.backgroundColor=[UIColor  colorWithRed:220/255.00 green:220/255.00 blue:220/255.00 alpha:1.0];
    self.graph.delegate=self;
    [self.view addSubview:self.graph];

 //init some L3SDKHistogramBarItem and add them on the graph view
    L3SDKHistogramBarItem*bar1=[[L3SDKHistogramBarItem alloc]init];
    bar1.value=40.0f;
    bar1.color=[UIColor redColor];
    
    
    L3SDKHistogramBarItem*bar2=[[L3SDKHistogramBarItem alloc]init];
    bar2.value=60.0f;
    bar2.gadientColors.startColor=[UIColor colorWithRed:184.0/255.0 green:245.0/255.0 blue:192.0/255.0 alpha:1.0];
    bar2.gadientColors.endColor=[UIColor colorWithRed:18.0/255.0 green:114.0/255.0 blue:30.0/255.0 alpha:1.0];
    
    
    L3SDKHistogramBarItem*bar3=[[L3SDKHistogramBarItem alloc]init];
    bar3.value=10.0f;
    bar3.color=[UIColor yellowColor];
    
    L3SDKHistogramBarItem*bar4=[[L3SDKHistogramBarItem alloc]init];
    bar4.value=20.0f;
    bar4.color=[UIColor orangeColor];
    bar4.label.color=[UIColor whiteColor];
    bar4.label.font=[UIFont fontWithName:@"Verdana" size:16];
    
    L3SDKHistogramBarItem*bar5=[[L3SDKHistogramBarItem alloc]init];
    bar5.value=80.0f;
    bar5.gadientColors.startColor=[UIColor colorWithRed:166.0/255.0 green:252.0/255.0 blue:253.0/255.0 alpha:1.0];
    bar5.gadientColors.endColor=[UIColor colorWithRed:15.0/255.0 green:48.0/255.0 blue:214.0/255.0 alpha:1.0];
    
    
    L3SDKHistogramBarItem*bar6=[[L3SDKHistogramBarItem alloc]init];
    bar6.value=75.0f;
    bar6.color=[UIColor purpleColor];
    bar6.label.color=[UIColor yellowColor];
    
    L3SDKHistogramBarItem*bar7=[[L3SDKHistogramBarItem alloc]init];
    bar7.value=95.0f;
    bar7.color=[UIColor brownColor];
    bar7.label.text=[NSString stringWithFormat:@"test label\n\n %.2f",bar7.value];
    bar7.label.color=[UIColor yellowColor];

    
    [self.graph addBar:bar1];
    [self.graph addBar:bar2];
    [self.graph addBar:bar3];
    [self.graph addBar:bar4];
    [self.graph addBar:bar5];
    [self.graph addBar:bar6];
    [self.graph addBar:bar7];

```

<br/> 
![ScreenShot](https://raw.github.com/alchimya/iOS-Histogram/master/screenshots/iOS-Histogram.gif)
