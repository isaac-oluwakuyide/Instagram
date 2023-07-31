//
//  HomeViewController.h
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/29/23.
//

#import <UIKit/UIKit.h>
#import "ParseAPIManager.h"
#import "PostCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
