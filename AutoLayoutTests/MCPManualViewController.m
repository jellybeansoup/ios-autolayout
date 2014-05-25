#import "MCPManualViewController.h"

@implementation MCPManualViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Apply the text
    self.headerView.coverView.image = [UIImage imageNamed:@"cover"];
    self.headerView.titleLabel.text = @"Multiplex: Enjoy Your Show";
    self.headerView.subtitleLabel.text = @"July 2005—November 2006";
    self.headerView.descriptionLabel.text = @"Welcome to Multiplex 10 Cinemas! Book One collects the first 102 strips from the archives. Meet Kurt, Jason, Becky and the rest of the Multplex gang.";
    [self.headerView arrangeSubviews];

}

@end
