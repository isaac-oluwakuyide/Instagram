//
//  ParseAPIManager.h
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/31/23.
//

#import <Foundation/Foundation.h>
#import "Post.h"
#import <Parse/Parse.h>
#import "ParseAlert.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface ParseAPIManager : NSObject

-(void)queryPosts:(void(^)(NSArray *posts, NSError *error))completion;
-(void)queryProfile:(void(^)(NSArray *posts, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
