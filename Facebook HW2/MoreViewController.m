//
//  MoreViewController.m
//  Facebook HW2
//
//  Created by Sophie Tang on 6/16/14.
//  Copyright (c) 2014 Sophie Tang. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
- (IBAction)OnNewsFeed:(id)sender;
- (IBAction)LogOut:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *MoreScrollView;

@end

@implementation MoreViewController

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
}

- (void)viewDidLayoutSubviews
{
    self.MoreScrollView.contentSize = CGSizeMake(320, 1500);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnNewsFeed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)LogOut:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure you want to log out?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Log Out" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

@end
