//
//  PostCell.h
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/31/23.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "Post.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userTextField;
@property (weak, nonatomic) IBOutlet UILabel *captionTextField;
@property (nonatomic, strong) Post *post;
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;



@end

NS_ASSUME_NONNULL_END
