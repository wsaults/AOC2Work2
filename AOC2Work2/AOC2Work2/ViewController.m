//
//  ViewController.m
//  AOC2Work2
//
//  Created by Will Saults on 11/28/12.
//  Copyright (c) 2012 Fullsail. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Calculator.h"

@interface ViewController () {
    IBOutlet UIView *controlsView;
    IBOutlet UISegmentedControl *optionsSegmentControl;
    IBOutlet UISwitch *power;
    IBOutlet UILabel *calculatorScreenLabel;
}

@property (nonatomic, strong) NSMutableString *calulatorText;
@property (nonatomic) NSInteger augend;
@property (nonatomic) BOOL displayNeedsCleared;

-(IBAction)numberPressed:(id)sender;
-(IBAction)operatorPressed:(id)sender;
-(IBAction)clearDisplay:(id)sender;
-(IBAction)changeOption:(id)sender;
-(IBAction)powerSwitch:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_calulatorText = [NSMutableString new];
    _augend = -1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Number presses
-(IBAction)numberPressed:(id)sender {
    if ([power isOn]) {
        if (_displayNeedsCleared) {
            [self clearDisplay:nil];
        }
        [_calulatorText appendString:[NSString stringWithFormat:@"%i",[sender tag]]];
        [calculatorScreenLabel setText:_calulatorText];
        _displayNeedsCleared = NO;
    }
}

#pragma mark - Operation presses
-(IBAction)operatorPressed:(id)sender {
    if ([power isOn]) {
        switch ([sender tag]) {
            case EQUALS:
            {
                if (_augend >= 0) {
                    Calculator *calculatorBrain = [Calculator new];
                    [calculatorScreenLabel setText:[NSString stringWithFormat:@"%i",[calculatorBrain sumAugend:_augend Addend:[_calulatorText integerValue]]]];
                    _augend = -1;
                    _displayNeedsCleared = YES;
                }
                break;
            }
            case ADDITION:
                // If the calc label contains a number
                if (![calculatorScreenLabel.text isEqualToString:@""]) {
                    _augend = [_calulatorText integerValue];
                    [calculatorScreenLabel setText:@""];
                    [_calulatorText setString:@""];
                }
                break;
                
            default:
                break;
        }
    }
}

#pragma mark - Clear the display
-(IBAction)clearDisplay:(id)sender {
    [calculatorScreenLabel setText:@""];
    [_calulatorText setString:@""];
    _augend = -1;
}

#pragma mark - Options segmented controller
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

#pragma mark - Power switch
-(IBAction)powerSwitch:(id)sender {
    if (![power isOn]) {
        [self clearDisplay:nil];
    }
}

@end
