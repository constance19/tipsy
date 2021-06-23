//
//  SettingsViewController.m
//  Tipsy2.0
//
//  Created by constanceh on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultPercentageControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)findDefault:(id)sender {
    double defaultPercentages[] = {0.15, 0.18, 0.2, 0.25};
    double defaultPercentage = defaultPercentages[self.defaultPercentageControl.selectedSegmentIndex];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:defaultPercentage forKey:@"default_tip_percentage"];
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
