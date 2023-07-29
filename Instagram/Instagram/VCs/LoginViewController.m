//
//  LoginViewController.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/29/23.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)didLogin:(id)sender {
    [self loginUser];
}

//attempt to log the user in with Parse
-(void)loginUser    {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
        if (error != nil)   {
            [self showAlert:error];
        }   else    {
            
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
