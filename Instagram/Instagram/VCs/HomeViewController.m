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
#import "DetailsViewController.h"

@interface HomeViewController()
@property (nonatomic, strong) NSArray *posts;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation HomeViewController
NSString *HeaderViewIdentifier = @"TableViewHeaderView";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self fetchPosts];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];
    
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:HeaderViewIdentifier];
    
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    [self fetchPosts];
    [refreshControl endRefreshing];
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
    [self.activityIndicator startAnimating];
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
            [self.activityIndicator stopAnimating];
        }
    }];
    [self.activityIndicator stopAnimating];
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
    
    if ([segue.identifier isEqualToString:@"DetailsSegue"]) {
        DetailsViewController *detailsVC = [segue destinationViewController];
        detailsVC.post = post;
    }
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *postCell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    //because we want a header for each section, and each section is only 1 row
    postCell.post = self.posts[indexPath.section];
    return postCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Post *post = self.posts[section];
    return post.author.username;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.posts.count;
}


@end
