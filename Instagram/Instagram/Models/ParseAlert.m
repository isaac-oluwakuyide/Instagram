//
//  ParseAlert.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/29/23.
//

#import "ParseAlert.h"

@interface ParseAlert ()

@end

@implementation ParseAlert

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showAlert];
}

-(id)init:(NSError *)error   {
    self = [super init];
    self.error = error;
    
    return self;
}

-(void)showAlert{
    self.title = self.error.localizedFailureReason;
    self.message = self.error.localizedDescription;
    
    //create the try again action
    UIAlertAction *tryAgainAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //dismiss the alert controller and retry logging in
        [self dismissViewControllerAnimated:YES completion:^{
        }];
        
    }];
    [self addAction:tryAgainAction];
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
