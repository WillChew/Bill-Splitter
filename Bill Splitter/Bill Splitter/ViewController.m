//
//  ViewController.m
//  Bill Splitter
//
//  Created by Will Chew on 2018-06-17.
//  Copyright © 2018 Will Chew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
    [self setupTextField];
    [self displayText:@""];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(screenTapped:)];
    [self.view addGestureRecognizer:tapGesture];
    

}
- (void)screenTapped:(UITapGestureRecognizer*)sender {
    [self.textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculateSplitAmount:(UIButton *)sender {
    [self.textField resignFirstResponder];
    
}
- (IBAction)sliderValueChanged:(id)sender {
    [self displayText:@""];
}


-(void)setupTextField {
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
}

-(void)displayText:(NSString*)text {

    float splitTotal = self.textField.text.floatValue / self.slider.value;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyAccountingStyle];
    
    NSString *sliderAsStr = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:splitTotal]];
    
    self.label.text = sliderAsStr;

    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self displayText:@""];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    [self displayText:self.textField.text];
}

-(BOOL)textFieldShouldClear:(UITextField *)textField {
    [self displayText:@""];
    return YES;
}



@end
