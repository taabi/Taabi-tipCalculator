//
//  TipViewController.m
//  Taabi-tipCalculator
//
//  Created by taabi on 6/16/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *BillTextField;
@property (weak, nonatomic) IBOutlet UILabel *TipLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *TipController;
- (IBAction)clearButton:(id)sender;

- (IBAction)onTap:(id)sender;
- (void) updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Rocking Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clearButton:(id)sender {
    self.BillTextField.text= @"";
    [self updateValues];
     }

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues{
    float billAmount = [self.BillTextField.text floatValue];
    NSArray *tipValue = @[@(0.1),@(0.2),@(0.3)];
    float tipAmount= billAmount*[tipValue[self.TipController.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    
    self.TipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.TotalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
    
}
@end
