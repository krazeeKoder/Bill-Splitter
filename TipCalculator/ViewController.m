//
//  ViewController.m
//  TipCalculator
//
//  Created by Anthony Tulai on 2016-01-22.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (assign) float billAmount;
@property (assign) float tipAmount;
@property (strong, nonatomic) IBOutlet UISlider *tipPercentage;
@property (strong, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (strong, nonatomic) IBOutlet UILabel *tipPercentLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTipAmountField) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)billAmountTextFieldUsed:(id)sender {
    

    
}
- (IBAction)sliderAction:(id)sender {
    float valueAsPercentage = self.tipPercentage.value * 100;
    
    self.tipPercentLabel.text = [NSString stringWithFormat:@"%.0f%%",valueAsPercentage];
    
    [self updateTipAmountField];
}

-(void)updateTipAmountField {
    self.billAmount = [self.billAmountTextField.text floatValue];
    self.tipAmount = self.tipPercentage.value * self.billAmount;
    self.tipAmountLabel.text = [NSString stringWithFormat:@"%.2f", self.tipAmount];
}

@end
