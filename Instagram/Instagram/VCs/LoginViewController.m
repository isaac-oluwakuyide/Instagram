//
//  LoginViewController.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/29/23.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "Parse/Parse.h"
#import "ParseAlert.h"

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
            ParseAlert *parseAlert = [[ParseAlert new] init:error];
            [self presentViewController:parseAlert animated:YES completion:nil];
//            [self showAlert:error];
        }   else    {
            [self performSegueWithIdentifier:@"LoginSegue" sender:nil];
        }
    }];
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
