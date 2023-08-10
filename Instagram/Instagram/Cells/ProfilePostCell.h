//
//  ProfilePostCell.h
//  Instagram
//
//  Created by Isaac Oluwakuyide on 8/9/23.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "Post.h"
#import "PostCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfilePostCell : UITableViewCell
@property (nonatomic, strong) Post *post;
@property (weak, nonatomic) IBOutlet UILabel *captionTextField;
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;


@end

NS_ASSUME_NONNULL_END
