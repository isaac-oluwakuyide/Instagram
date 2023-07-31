//
//  Post.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/29/23.
//

#import "Post.h"

@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void)postUserImage:(UIImage * _Nullable)image withCaption:(NSString * _Nullable)caption withCompletion:(PFBooleanResultBlock  _Nullable __strong)completion {
    
    Post *newPost = [Post new];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    
    UIImage *imageEdited = [self resizeImage:image withSize:image.size];
    newPost.image = [self getPFFileFromImage:imageEdited];
    
    [newPost saveInBackgroundWithBlock:completion];
}

+(PFFileObject *)getPFFileFromImage: (UIImage *_Nullable)image{
    //check if image is not nil
    if (!image){
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    //get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
}

//resize image
+(UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


@end
