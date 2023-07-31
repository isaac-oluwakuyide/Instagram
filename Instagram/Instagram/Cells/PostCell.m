//
//  PostCell.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/31/23.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    [self initializeCell:self.post];
}

//puts Post info into the Cell
-(void)initializeCell:(Post *)post{
    self.userTextField.text = post.author.username;
    self.captionTextField.text = post.caption;
    
    //fetch the picture in PFFile format from Parse
    self.photoImageView.file = post[@"image"];
    
    [self.photoImageView loadInBackground];
    
    //set the frame of the imageView for the image
    CGRect imageFrame = self.photoImageView.frame;
    imageFrame.size.width = self.photoImageView.image.size.width;
    imageFrame.size.height = self.photoImageView.image.size.height;
    
    self.photoImageView.frame = imageFrame;
}


@end
