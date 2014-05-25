#import "MCPAutoLayoutViewController.h"

@implementation MCPAutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Apply the text
    self.coverView.image = [UIImage imageNamed:@"cover"];
    self.headingLabel.text = @"Multiplex: Enjoy Your Show";
    self.subheadingLabel.text = @"July 2005—November 2006";
    self.descriptionLabel.text = @"Welcome to Multiplex 10 Cinemas! Book One collects the first 102 strips from the archives. Meet Kurt, Jason, Becky and the rest of the Multplex gang.";

}

@end
