//
//  ViewController.m
//  iOS-Histogram
//
//  Created by Domenico Vacchiano on 29/07/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "ViewController.h"
#import "L3SDKHistogramBarItem.h"
#import "L3SDKHistogramGraphView.h"
#import "L3SDKHistogramBarView.h"
@interface ViewController ()
@property (nonatomic,strong) L3SDKHistogramGraphView*graph;
@property (nonatomic,strong)UISwitch*swOrientation;
@property (nonatomic,strong)UILabel*lblDescription;
@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated{


}

- (void)viewDidLoad {
    [super viewDidLoad];

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
    
    //add an UISwitch to test the graph orientation behavior
    self.swOrientation=[[UISwitch alloc] initWithFrame:
                        CGRectMake(
                                   self.graph.frame.origin.x,
                                   self.graph.frame.origin.y+self.graph.frame.size.height+20,
                                   0, 0)
                        ];
    [self.swOrientation addTarget:self
                           action:@selector(setState:)
                 forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.swOrientation];
    
    //add an UILabel to send some output informations
    self.lblDescription=[[UILabel alloc] initWithFrame:
                         CGRectMake(self.swOrientation.frame.origin.x+10,
                                    self.swOrientation.frame.origin.y+self.swOrientation.frame.size.height,
                                    self.view.bounds.size.width-10, 20)];
    self.lblDescription.text=@"...";
    [self.view addSubview:self.lblDescription];
    
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
    
    

    
}

-(void)setState:(id)sender {
    
    if ([sender isOn]) {
        self.graph.orientation=L3SDKHistogramGraphOrientationHorizontal;
    }else{
        self.graph.orientation=L3SDKHistogramGraphOrientationVertical;
    }
}

#pragma mark Protocol Methods
-(void)L3SDKHistogramGraphView_BarViewTouched:(L3SDKHistogramBarView*)barView{
    NSLog(@"%.2f",barView.barItem.value);
    self.lblDescription.text=[
                              NSString stringWithFormat:@"%.2f  %@",
                              barView.barItem.value,
                              (barView.barItem.label.text==nil ? @"" :barView.barItem.label.text)
                              ];
}
-(void)L3SDKHistogramGraphView_BarViewAdded:(L3SDKHistogramBarView*)barView{
    NSLog(@"%.2f",barView.barItem.value);
}
-(void)L3SDKHistogramGraphView_DwawingCompleted{
    NSLog(@"DWAWING COMPLETED");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
