//
//  ParseAlert.h
//  Instagram
//
//  Created by Isaac Oluwakuyide on 7/29/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ParseAlert : UIAlertController

-(id)init:(NSError *)error;
-(void)showAlert;
@property (nonatomic, strong) NSError *error;

@end

NS_ASSUME_NONNULL_END
