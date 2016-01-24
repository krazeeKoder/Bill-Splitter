//
//  ViewController.m
//  TipCalculator
//
//  Created by Anthony Tulai on 2016-01-22.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (assign) float billAmount;
@property (assign) float splitAmount;

@property (strong, nonatomic) IBOutlet UISlider *numberOfSplitters;
@property (strong, nonatomic) IBOutlet UILabel *splitAmountLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberOfSplittersLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.billAmountTextField.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSplitAmountField) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)numberOfSplittersSlider:(id)sender {
    
    self.numberOfSplittersLabel.text = [NSString stringWithFormat:@"%.0f",self.numberOfSplitters.value];
    
    [self updateSplitAmountField];
}

- (IBAction)numberOfSplitters:(id)sender {
}

-(void)updateSplitAmountField {
    self.billAmount = [self.billAmountTextField.text floatValue];
    self.splitAmount = self.billAmount / lroundf(self.numberOfSplitters.value);
    self.splitAmountLabel.text = [NSString stringWithFormat:@"$%.2f", self.splitAmount];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
@end
