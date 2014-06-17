//
//  FeedViewController.m
//  Facebook HW2
//
//  Created by Sophie Tang on 6/12/14.
//  Copyright (c) 2014 Sophie Tang. All rights reserved.
//

#import "FeedViewController.h"
#import "ComposeViewController.h"
#import "MainViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *FeedLoading;
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollFeedView;
@property (weak, nonatomic) IBOutlet UIImageView *StatusBar;
@property (weak, nonatomic) IBOutlet UIImageView *TabBar;

- (IBAction)OnStatusBar:(id)sender;

- (void)ShowFeed;

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"News Feed";
    
    UIBarButtonItem *leftbutton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"SearchIcon"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftbutton;
    
    UIBarButtonItem *rightbutton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MoreIcon"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightbutton;
    
    [self.FeedLoading startAnimating];
    
    self.ScrollFeedView.hidden = YES;
    self.ScrollFeedView.contentSize = CGSizeMake(320, 800);
    
    [self performSelector:@selector(ShowFeed) withObject:nil afterDelay:2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnStatusBar:(id)sender {
    ComposeViewController *composeview = [[ComposeViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:composeview];
    composeview.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    nvc.navigationBar.barTintColor = [UIColor colorWithRed:(59/255.0) green:(89/255.0) blue:(152/255.0) alpha:1];
    nvc.navigationBar.translucent = NO;
    nvc.navigationBar.tintColor = [UIColor whiteColor];
    nvc.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    [self presentViewController:nvc animated:YES completion:nil];

}

-(void)ShowFeed{
    self.ScrollFeedView.hidden = NO;
}

@end
