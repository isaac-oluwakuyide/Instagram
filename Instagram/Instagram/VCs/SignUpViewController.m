//
//  SignUpViewController.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/29/23.
//

#import "SignUpViewController.h"
#import "Parse/Parse.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordConfTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)didSignUp:(id)sender {
    [self registerUser];
}

//register a user in Parse
-(void)registerUser {
    //initialize a user object
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameTextField.text;
    newUser.email = self.emailTextField.text;
    newUser.password = self.userPasswordTextField.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error != nil)   {
            [self showAlert:error];
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
