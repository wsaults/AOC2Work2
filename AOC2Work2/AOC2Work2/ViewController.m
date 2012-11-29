//
//  ViewController.m
//  AOC2Work2
//
//  Created by Will Saults on 11/28/12.
//  Copyright (c) 2012 Fullsail. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    IBOutlet UIView *controlsView;
    IBOutlet UISegmentedControl *optionsSegmentControl;
    IBOutlet UISwitch *power;
    IBOutlet UILabel *calculatorScreenLabel;
    
}

@property (nonatomic, strong) NSMutableString *calulatorText;

-(IBAction)numberPressed:(id)sender;
-(IBAction)operatorPressed:(id)sender;
-(IBAction)clearDisplay:(id)sender;
-(IBAction)changeOption:(id)sender;
-(IBAction)powerSwitch:(id)sender;
-(IBAction)info:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_calulatorText = [NSMutableString new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)numberPressed:(id)sender {
    if ([power isOn]) {
        [_calulatorText appendString:[NSString stringWithFormat:@"%i",[sender tag]]];
        [calculatorScreenLabel setText:_calulatorText];
    }
}

-(IBAction)operatorPressed:(id)sender {
    if ([power isOn]) {
        NSLog(@"The power is on");
    }
}

-(IBAction)clearDisplay:(id)sender {
    [calculatorScreenLabel setText:@""];
    [_calulatorText setString:@""];
}

-(IBAction)changeOption:(id)sender {
    switch ([optionsSegmentControl selectedSegmentIndex]) {
        case WHITE:
            [controlsView setBackgroundColor:[UIColor whiteColor]];
            break;
            
        case BLUE:
            [controlsView setBackgroundColor:[UIColor blueColor]];
            break;
            
        case GREEN:
            [controlsView setBackgroundColor:[UIColor greenColor]];
            break;
            
        default:
            break;
    }
}

-(IBAction)powerSwitch:(id)sender {
    if (![power isOn]) {
        [self clearDisplay:nil];
    }
}

-(IBAction)info:(id)sender {
    NSLog(@"Show info view");
}

@end
