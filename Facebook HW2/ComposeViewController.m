//
//  ComposeViewController.m
//  Facebook HW2
//
//  Created by Sophie Tang on 6/13/14.
//  Copyright (c) 2014 Sophie Tang. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *ComposeStatus;
- (IBAction)EditChangeStatus:(id)sender;

-(void)CancelCompose;
-(void)EnablePost;

@end

@implementation ComposeViewController

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
    
    self.navigationItem.title = @"Update Status";
    
    UIBarButtonItem *postbutton = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = postbutton;
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    UIBarButtonItem *cancelbutton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(CancelCompose)];
    self.navigationItem.leftBarButtonItem = cancelbutton;
    
    [self.ComposeStatus becomeFirstResponder];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)EditChangeStatus:(id)sender {
    [self performSelector:@selector(EnablePost) withObject:nil afterDelay:0];
}

-(void)CancelCompose{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)EnablePost{
    if ([self.ComposeStatus.text isEqualToString:@""]) {
            self.navigationItem.rightBarButtonItem.enabled = NO;
    } else {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
}

@end
