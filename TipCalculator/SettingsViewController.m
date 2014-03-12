//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Sai Kante on 3/11/14.
//  Copyright (c) 2014 saiPersonal. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTip_SGC;
- (IBAction)defaultTipChanged:(id)sender;
- (void) updateDefaultTipPercentage;
- (IBAction)onBackButton:(id)sender;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(onBackButton:)];
    [self updateDefaultTipPercentage];
}

- (void)viewDidAppear:(BOOL)animated {
    [self updateDefaultTipPercentage];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)defaultTipChanged:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTip_SGC.selectedSegmentIndex forKey:@"defaultTipPercentage"];
    [defaults synchronize];
}

-(void) updateDefaultTipPercentage {
    int index=[SettingsViewController getDefaultTipPercentageIndex];
    self.defaultTip_SGC.selectedSegmentIndex=index;
}

- (IBAction)onBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

+ (int) getDefaultTipPercentageIndex {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int index = [defaults integerForKey:@"defaultTipPercentage"];
    return index;
}














@end
