//
//  SettingsViewController.m
//  Tipsy2.0
//
//  Created by constanceh on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultPercentageControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *themeControl;
@property (strong, nonatomic) IBOutlet UIView *settingsView;
@property (weak, nonatomic) IBOutlet UILabel *settingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)findDefault:(id)sender {
    // Load and save the user's selected default tip percentage
    double defaultPercentages[] = {0.15, 0.18, 0.2, 0.25};
    double defaultPercentage = defaultPercentages[self.defaultPercentageControl.selectedSegmentIndex];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:defaultPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
}

- (IBAction)findTheme:(id)sender {
    // Get the user's selected theme (light or dark)
    double themeIndex = self.themeControl.selectedSegmentIndex;
    
    UIColor *lightTheme = [UIColor colorWithRed:0.895 green:0.853 blue:1.000 alpha:1.0];
    UIColor *standardGray = [UIColor colorWithRed:0.840 green:0.802 blue:0.937 alpha:1.0];
    
    // Dark mode
    if (themeIndex == 1) {
        self.themeControl.selectedSegmentTintColor = UIColor.grayColor;
        self.settingsView.backgroundColor = UIColor.blackColor;
        self.defaultPercentageControl.backgroundColor = lightTheme;
        self.themeControl.backgroundColor = lightTheme;
        self.settingsLabel.textColor = lightTheme;
        self.tipLabel.textColor = lightTheme;
        self.themeLabel.textColor = lightTheme;
        
    // Light mode
    } else {
        self.settingsView.backgroundColor = lightTheme;
        self.defaultPercentageControl.backgroundColor = standardGray;
        self.themeControl.backgroundColor = standardGray;
        self.settingsLabel.textColor = UIColor.blackColor;
        self.tipLabel.textColor = UIColor.blackColor;
        self.themeLabel.textColor = UIColor.blackColor;
    }
    
    // Save the user's selected theme choice
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:themeIndex forKey:@"theme"];
    [defaults synchronize];
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
