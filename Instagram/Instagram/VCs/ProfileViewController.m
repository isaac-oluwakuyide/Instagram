//
//  ProfileViewController.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 8/7/23.
//

#import "ProfileViewController.h"
#import "Post.h"
#import <Parse/Parse.h>
#import "ParseAlert.h"
#import "ParseAPIManager.h"
#import "PostCell.h"
#import "ProfilePostCell.h"
#import "DetailsViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *posts;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self fetchPosts];
}
- (IBAction)didLogOut:(id)sender {
    [self logOut];
}

//performs the log out action
-(void)logOut   {
    [PFUser logOutInBackgroundWithBlock:^(NSError *error) {
        //PF Current user will become nil
        if (error != nil)   {
            ParseAlert *parseAlert = [[ParseAlert new] init:error];
            [self presentViewController:parseAlert animated:YES completion:nil];
        }
        else{
            [self performSegueWithIdentifier:@"LogOutProfileSegue" sender:nil];
        }
    }];
}

//fetches posts from Parse
-(void) fetchPosts  {
    ParseAPIManager *parseManager = [ParseAPIManager new];
    [parseManager queryProfile:^(NSArray * _Nonnull posts, NSError * _Nonnull error) {
        if (posts){
            self.posts = posts;
            [self.tableView reloadData];
        }
        //handle errors if there are any
        if (error != nil)   {
            ParseAlert *parseAlert = [[ParseAlert new] init:error];
            [parseAlert showAlert];
        }
    }];
    [self.tableView reloadData];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UITableViewCell *tappedCell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
    
    Post *post = self.posts[indexPath.section];
    
    if ([segue.identifier isEqualToString:@"DetailsProfileSegue"]) {
        DetailsViewController *detailsVC = [segue destinationViewController];
        detailsVC.post = post;
    }
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ProfilePostCell *postCell = [tableView dequeueReusableCellWithIdentifier:@"ProfilePostCell"];
    //because we want a header for each section, and each section is only 1 row
    postCell.post = self.posts[indexPath.row];
    return postCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

@end
