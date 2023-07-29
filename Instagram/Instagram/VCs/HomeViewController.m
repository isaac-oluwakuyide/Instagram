//
//  HomeViewController.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/29/23.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)didLogOut:(id)sender {
    [self logOut];
}

-(void)logOut   {
    [PFUser logOutInBackgroundWithBlock:^(NSError *error) {
        //PF Current user will become nil
        if (error != nil)   {
            [self showAlert:error];
        }
        else{
            [self performSegueWithIdentifier:@"LogOutSegue" sender:nil];
        }
    }];
    
}

-(void)showAlert:(NSError *) error {
    //create the UIActionAlert
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:error.localizedFailureReason message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    
    //create the try again action
    UIAlertAction *tryAgainAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //dismiss the alert controller and retry logging in
        [alertController dismissViewControllerAnimated:YES completion:^{
        }];
    }];
    
    //add the try again action to the alert controller
    [alertController addAction:tryAgainAction];
    
    //present the alert
    [self presentViewController:alertController animated:YES completion:nil];
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
