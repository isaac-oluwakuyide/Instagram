//
//  DetailsViewController.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 8/1/23.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userTextField;
@property (weak, nonatomic) IBOutlet UILabel *timeStampTextLabel;
@property (weak, nonatomic) IBOutlet PFImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionTextLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeVC];
}


//intiialize the views in the view controller
-(void)initializeVC{
    self.userTextField.text = self.post.author.username;
    NSDateFormatter *postDateFormatter = [[NSDateFormatter alloc] init];
    [postDateFormatter setDateFormat:@"HH:mm MM-dd-yyyy"];
    self.timeStampTextLabel.text = [postDateFormatter stringFromDate:self.post.createdAt];
    self.postImageView.file = self.post[@"image"];
    [self.postImageView loadInBackground];
    self.captionTextLabel.text = self.post.caption;
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
