//
//  DetailsViewController.h
//  Instagram
//
//  Created by Isaac Oluwakuyide on 8/1/23.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (nonatomic, strong) Post *post;

@end

NS_ASSUME_NONNULL_END
