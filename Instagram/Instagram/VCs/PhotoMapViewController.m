//
//  PhotoMapViewController.m
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/30/23.
//

#import "PhotoMapViewController.h"
#import "Post.h"
#import "ParseAlert.h"

@interface PhotoMapViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UITextField *captionTextField;

@end

@implementation PhotoMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//take action when the imageView gets tapped
- (IBAction)didTapPost:(id)sender {
    [self presentImagePickerController];
}

- (IBAction)didCancelPost:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//modally present an Image Picker Controller screen
-(void)presentImagePickerController{
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    //check that the camera is supported or use the photo library
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])    {
//        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
//    }
//    else{
//        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    }
    
    //xcode simulator does not support a camera, so I use the photo library instead
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    
    //present the VC
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info    {
    
    //get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    //set the VC imageView picture to the edited image
    self.postImageView.image = editedImage;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didSharePost:(id)sender {
    [Post postUserImage:self.postImageView.image withCaption:self.captionTextField.text withCompletion:^(BOOL succeeded, NSError *error) {
        if (error != nil)   {
            ParseAlert *parseAlert = [[ParseAlert new] init:error];
            [parseAlert showAlert];
        }
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
