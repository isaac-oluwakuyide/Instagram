//
//  HomeViewController.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/29/23.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>
#import "ParseAlert.h"
#import "ParseAPIManager.h"

@interface HomeViewController()
@property (nonatomic, strong) NSArray *posts;

@end

@implementation HomeViewController

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
            [self performSegueWithIdentifier:@"LogOutSegue" sender:nil];
        }
    }];
    
}

//fetches posts from Parse
-(void) fetchPosts  {
    ParseAPIManager *parseManager = [ParseAPIManager new];
    [parseManager queryPosts:^(NSArray * _Nonnull posts, NSError * _Nonnull error) {
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *postCell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    postCell.post = self.posts[indexPath.row];
    return postCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

@end
