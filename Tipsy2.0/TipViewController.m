//
//  TipViewController.m
//  Tipsy2.0
//
//  Created by constanceh on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *separatorBar;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Round the corners of the separator bar
    UIBezierPath *cornersPath = [UIBezierPath bezierPathWithRoundedRect:self.separatorBar.bounds  byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(10, 10)];

    // New layer for the mask
    CAShapeLayer *maskLayer = [CAShapeLayer layer];

    // Set the layer's path
    maskLayer.path = cornersPath.CGPath;
    self.separatorBar.layer.mask = maskLayer;
}

- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    
    [self.view endEditing:true];
}

- (IBAction)updateLabels:(id)sender {
    double tipPercentages[] = {0.15, 0.18, 0.2};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
