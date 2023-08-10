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

//pulls the posts that are yours from Parse
- (void)queryProfile:(void(^)(NSArray *posts, NSError *error))completion{
    PFQuery *postQuery = [Post query];
    [postQuery whereKey:@"author" equalTo:PFUser.currentUser];
    [postQuery orderByDescending:@"createdAt"];
    
    //fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable postArray, NSError * _Nullable parseError) {
        if (postArray)  {
            completion(postArray, nil);
        }
        else{
            completion(nil, parseError);
        }
    }];
    
    
//    PFQuery *profileQuery = [Post query];
//    [profileQuery whereKey:@"author" equalTo: [PFUser currentUser]];
//    [profileQuery orderByDescending:@"createdAt"];
//    [profileQuery includeKey:@"author"];
//
//    [profileQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable postArray, NSError * _Nullable parseError) {
//        if (postArray)  {
//            completion(postArray, nil);
//        }
//        else{
//            completion(nil, parseError);
//        }
//    }];
}

@end
