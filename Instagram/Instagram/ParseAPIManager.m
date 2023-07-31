//
//  ParseAPIManager.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/31/23.
//

#import "ParseAPIManager.h"

@implementation ParseAPIManager

//pulls the last 20 posts from Parse
- (void)queryPosts:(void(^)(NSArray *posts, NSError *error))completion {
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;
    
    //fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable postArray, NSError * _Nullable parseError) {
        if (postArray)  {
            completion(postArray, nil);
        }
        else{
            completion(nil, parseError);
        }
    }];
}

@end
