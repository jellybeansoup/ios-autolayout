#import "MCPManualView.h"

@implementation MCPManualView

#pragma mark - Life cycle

- (id)initWithCoder:(NSCoder *)coder {
    if ((self = [super initWithCoder:coder])) {

        // Super view
        self.backgroundColor = [UIColor lightGrayColor];
        self.clipsToBounds = NO;

		// Book Cover
		self.coverView = [[UIImageView alloc] initWithFrame:CGRectZero];
		self.coverView.backgroundColor = [UIColor greenColor];
		[self addSubview:self.coverView];

		// Title
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		self.titleLabel.backgroundColor = [UIColor yellowColor];
		self.titleLabel.contentMode = UIViewContentModeTopLeft;
		self.titleLabel.font = [UIFont systemFontOfSize:16];
		self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
		self.titleLabel.numberOfLines = 3;
		[self addSubview:self.titleLabel];

		// Subtitle
		self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		self.subtitleLabel.backgroundColor = [UIColor yellowColor];
		self.subtitleLabel.font = [UIFont italicSystemFontOfSize:12];
		self.subtitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
		self.subtitleLabel.numberOfLines = 2;
		[self addSubview:self.subtitleLabel];

		// Description
		self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		self.descriptionLabel.backgroundColor = [UIColor yellowColor];
		self.descriptionLabel.font = [UIFont systemFontOfSize:12];
		self.descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
		self.descriptionLabel.numberOfLines = 15;
		[self addSubview:self.descriptionLabel];

    }
    return self;
}

#pragma mark - Manage the frame

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self arrangeSubviews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self arrangeSubviews];
}

- (void)arrangeSubviews {

    // Cover image frame
    self.coverView.frame = CGRectMake( 15.0, 20.0, 100.0, 131.0 );

	// Determine the size for the labels
    CGFloat maxWidth = ( CGRectGetWidth( self.frame ) - 40.0 ) - CGRectGetWidth( self.coverView.frame );
	CGSize titleSize = [self.titleLabel sizeThatFits:CGSizeMake( maxWidth, 100.0 )];
	CGSize subtitleSize = [self.subtitleLabel sizeThatFits:CGSizeMake( maxWidth, 100.0 )];
	CGSize descriptionSize = [self.descriptionLabel sizeThatFits:CGSizeMake( maxWidth, 100.0 )];

    // We break after the colon if the title exceeds one line.
	if( titleSize.height > 20 ) {
		self.titleLabel.text = [self.titleLabel.text stringByReplacingOccurrencesOfString:@": " withString:@":\n"];
		titleSize = [self.titleLabel sizeThatFits:CGSizeMake( maxWidth, 100.0 )];
	}

    // Update the label frames
    CGFloat left = CGRectGetMaxX( self.coverView.frame ) + 10.0;
    CGFloat spacing = 3.0;
    self.titleLabel.frame = CGRectMake( left, 20.0, titleSize.width, titleSize.height );
    self.subtitleLabel.frame = CGRectMake( left, CGRectGetMaxY( self.titleLabel.frame ) + spacing, subtitleSize.width, subtitleSize.height );
    self.descriptionLabel.frame = CGRectMake( left, CGRectGetMaxY( self.subtitleLabel.frame ) + spacing, descriptionSize.width, descriptionSize.height );

    // Figure out the total height
    CGRect frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, self.frame.size.width, MAX( CGRectGetMaxY( self.coverView.frame ), CGRectGetMaxY( self.descriptionLabel.frame ) ) );
	[super setFrame:frame];

}

@end
