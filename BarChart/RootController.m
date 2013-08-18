//
//  RootController.m
//  BarChart
//
//  Created by Kirill Mezrin on 15.02.12. Updated by iRare Media on August 12, 2013
//  Copyright (c) 2012 Kirill Mezrin. All rights reserved.
//

#import "RootController.h"

@implementation RootController
@synthesize barChart;

//------------------------------------------------------//
//--- View lifecycle -----------------------------------//
//------------------------------------------------------//
#pragma mark - View lifecycle

- (void)viewDidLoad {
    //Setup the View Controller
	[super viewDidLoad];
    
    //Load the Bar Chart - you can either load it using an NSArray or an XML File
    [self loadBarChartUsingArray];
}

- (void)viewDidUnload {
	[super viewDidUnload];
}

//------------------------------------------------------//
//--- Bar Chart Setup ----------------------------------//
//------------------------------------------------------//
#pragma mark - Bar Chart Setup

- (void)loadBarChartUsingArray {
    //Generate properly formatted data to give to the bar chart
    NSArray *array = [barChart createChartDataWithTitles:[NSArray arrayWithObjects:@"Title 1", @"Title 2", @"Title 3", @"Title 4", @"Title 5", @"Title 6", @"Title 7", nil]
                                                  values:[NSArray arrayWithObjects:@"47", @"31",  @"83", @"17", @"54", @"196", @"18", nil]
                                                  colors:[NSArray arrayWithObjects:@"87E317", @"87E317", @"17A9E3", @"E32F17", @"FFE53D", @"7D26CD", @"7D26CD", nil]
                                             labelColors:[NSArray arrayWithObjects:@"575757", @"575757", @"575757", @"575757", @"575757", @"575757", @"575757", nil]];
    
    //Set the Shape of the Bars (Rounded or Squared) - Rounded is default
    [barChart setupBarViewShape:BarShapeRounded];
    
    //Set the Style of the Bars (Glossy, Matte, or Flat) - Glossy is default
    [barChart setupBarViewStyle:BarStyleMatte];
    
    //Set the Drop Shadow of the Bars (Light, Heavy, or None) - Light is default
    [barChart setupBarViewShadow:BarShadowLight];
    
    //Set the Initial Animation of the Bars (Rise, Float, Fade, or None) - Rise is default
    [barChart setupBarViewAnimation:BarAnimationRise];
    
    //Generate the bar chart using the formatted data
    [barChart setDataWithArray:array
                      showAxis:DisplayBothAxes
                     withColor:[UIColor darkGrayColor]
                      withFont:[UIFont systemFontOfSize:11]
       shouldPlotVerticalLines:YES];
}

- (void)loadBarChartUsingXML {
    //Set the Shape of the Bars (Rounded or Squared) - Rounded is default
    [barChart setupBarViewShape:BarShapeRounded];
    
    //Set the Style of the Bars (Glossy, Matte, or Flat) - Glossy is default
    [barChart setupBarViewStyle:BarStyleMatte];
    
    //Set the Drop Shadow of the Bars (Light, Heavy, or None) - Light is default
    [barChart setupBarViewShadow:BarShadowLight];
    
    //Set the Initial Animation of the Bars (Rise, Fade, or None) - Rise is default
    [barChart setupBarViewAnimation:BarAnimationRise];
    
    //Load the bar chart with a premade XML file in your app's bundle
    [barChart setXmlData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"barChart" ofType:@"xml"]]
                showAxis:DisplayBothAxes
               withColor:[UIColor darkGrayColor]
                withFont:[UIFont systemFontOfSize:11]
 shouldPlotVerticalLines:YES];
}

//------------------------------------------------------//
//--- Info View Actions --------------------------------//
//------------------------------------------------------//
#pragma mark - Info View Actions

- (IBAction)dismissController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)viewDocumentation:(id)sender {
    NSString *url = [NSString stringWithFormat:@"https://github.com/iRareMedia/BarChart/blob/master/README.md"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end