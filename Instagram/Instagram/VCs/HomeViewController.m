//
//  HomeViewController.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/29/23.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>
#import "ParseAlert.h"

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
            ParseAlert *parseAlert = [[ParseAlert new] init:error];
            [self presentViewController:parseAlert animated:YES completion:nil];
        }
        else{
            [self performSegueWithIdentifier:@"LogOutSegue" sender:nil];
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
