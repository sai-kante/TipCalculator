//
//  TipViewController.m
//  TipCalculator
//
//  Created by Sai Kante on 3/11/14.
//  Copyright (c) 2014 saiPersonal. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *bill_TF;
@property (weak, nonatomic) IBOutlet UILabel *tip_LB;
@property (weak, nonatomic) IBOutlet UILabel *total_LB;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl_SGT;
- (IBAction)onTap:(id)sender;
- (IBAction)onSettingsButton:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton:)];
    self.tipControl_SGT.selectedSegmentIndex= [SettingsViewController getDefaultTipPercentageIndex];
    [self updateValues];
}

- (void)viewDidAppear:(BOOL)animated {
    self.tipControl_SGT.selectedSegmentIndex= [SettingsViewController getDefaultTipPercentageIndex];
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateValues {
    float billAmt = [self.bill_TF.text floatValue];
    NSArray *tipValues= @[@(0.1),@(0.15),@(0.2)];
    float tipAmt = billAmt * [tipValues[self.tipControl_SGT.selectedSegmentIndex] floatValue];
    float totalAmt = billAmt + tipAmt;
    
    self.tip_LB.text = [NSString stringWithFormat:@"$%0.2f",tipAmt];
    self.total_LB.text = [NSString stringWithFormat:@"$%0.2f",totalAmt];
    
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onSettingsButton:(id)sender {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
@end
