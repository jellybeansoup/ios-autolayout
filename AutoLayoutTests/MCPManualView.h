#import <UIKit/UIKit.h>

@interface MCPManualView : UIView

@property (strong, nonatomic) UIImageView *coverView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subtitleLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;

- (void)arrangeSubviews;

@end
