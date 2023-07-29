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
            NSLog(@"%@", error.localizedDescription);
        }   else    {
            NSLog(@"User registered successfully");
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
