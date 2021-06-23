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
@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Make keyboard always visible
    [self.billField becomeFirstResponder];

    
    // Round the corners of the separator bar
    UIBezierPath *cornersPath = [UIBezierPath bezierPathWithRoundedRect:self.separatorBar.bounds  byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(20, 20)];

    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = cornersPath.CGPath;
    self.separatorBar.layer.mask = maskLayer;
    
    // Add placeholder text so user knows where to input bill amount
    self.billField.placeholder = @"enter bill amount";
}

- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    
    [self.view endEditing:true];
}

- (IBAction)updateLabels:(id)sender {
    // Access and save default tip and theme selection data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    NSInteger themeMode = [defaults integerForKey:@"theme"];
    
    // Get the selected tip percentage
    double tipPercentages[] = {doubleValue, 0.15, 0.18, 0.2};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    // Calculate tip and total
    double bill = 0.0;
    bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    // Display tip and total
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
    // Change display theme based on user selection
    UIColor *lightTheme = [UIColor colorWithRed:0.895 green:0.853 blue:1.000 alpha:1.0];
    UIColor *standardGray = [UIColor colorWithRed:0.840 green:0.802 blue:0.937 alpha:1.0];
    
    // Dark mode
    if (themeMode == 1) {
        self.backgroundView.backgroundColor = UIColor.blackColor;
        self.tipPercentageControl.backgroundColor = lightTheme;
        self.tipLabel.textColor = lightTheme;
        self.totalLabel.textColor = lightTheme;
        self.billField.textColor = lightTheme;
        
    // Light mode
    } else {
        self.backgroundView.backgroundColor = lightTheme;
        self.tipPercentageControl.backgroundColor = standardGray;
        self.tipLabel.textColor = UIColor.blackColor;
        self.totalLabel.textColor = UIColor.blackColor;
        self.billField.textColor = UIColor.blackColor;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"View will appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    NSLog(@"View will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    NSLog(@"View did disappear");
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
