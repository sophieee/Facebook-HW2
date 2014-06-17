//
//  MainViewController.m
//  Facebook HW2
//
//  Created by Sophie Tang on 6/6/14.
//  Copyright (c) 2014 Sophie Tang. All rights reserved.
//

#import "MainViewController.h"
#import "FeedViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITextField *Email;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (weak, nonatomic) IBOutlet UIButton *LogIn;
@property (weak, nonatomic) IBOutlet UIView *LogInView;
@property (weak, nonatomic) IBOutlet UILabel *SignUp;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *LogInLoading;


- (IBAction)LogIn:(id)sender;
- (IBAction)EditEmail:(id)sender;
- (IBAction)EditPassword:(id)sender;
- (IBAction)OnTap:(id)sender;
- (IBAction)EditChangeEmail:(id)sender;
- (IBAction)EditChangePassword:(id)sender;

- (void)EnableLogIn;
- (void)CheckPassword;

@end

@implementation MainViewController

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
    
    self.LogIn.enabled = NO;
    
    CGRect loginframe = self.LogInView.frame;
    loginframe.origin.y = 100;
    self.LogInView.frame = loginframe;
    
    CGRect signupframe = self.SignUp.frame;
    signupframe.origin.y = 450;
    self.SignUp.frame = signupframe;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)LogIn:(id)sender {
    if (self.LogIn.enabled) {
        [self.LogInLoading startAnimating];
        
        self.LogIn.selected = YES;
        
        [self performSelector:@selector(CheckPassword) withObject:nil afterDelay:2];
    }
}


- (IBAction)EditEmail:(id)sender {
    CGRect loginframe = self.LogInView.frame;
    loginframe.origin.y = 30;
    self.LogInView.frame = loginframe;
    
    CGRect signupframe = self.SignUp.frame;
    signupframe.origin.y = 310;
    self.SignUp.frame = signupframe;

}

- (IBAction)EditPassword:(id)sender {
    CGRect loginframe = self.LogInView.frame;
    loginframe.origin.y = 30;
    self.LogInView.frame = loginframe;
    
    CGRect signupframe = self.SignUp.frame;
    signupframe.origin.y = 310;
    self.SignUp.frame = signupframe;
    
    
}

- (IBAction)OnTap:(id)sender {
    [self.view endEditing:YES];
    
    CGRect loginframe = self.LogInView.frame;
    loginframe.origin.y = 100;
    self.LogInView.frame = loginframe;
    
    CGRect signupframe = self.SignUp.frame;
    signupframe.origin.y = 450;
    self.SignUp.frame = signupframe;

}

- (IBAction)EditChangeEmail:(id)sender {
    [self performSelector:@selector(EnableLogIn) withObject:nil afterDelay:0];
}

- (IBAction)EditChangePassword:(id)sender {
        [self performSelector:@selector(EnableLogIn) withObject:nil afterDelay:0];
}


- (void)CheckPassword{
    if ([self.Password.text isEqualToString:@"password"]) {
        FeedViewController *feedview = [[FeedViewController alloc] init];
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:feedview];
        feedview.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        nvc.navigationBar.barTintColor = [UIColor colorWithRed:(59/255.0) green:(89/255.0) blue:(152/255.0) alpha:1];
        nvc.navigationBar.translucent = NO;
        nvc.navigationBar.tintColor = [UIColor whiteColor];
        nvc.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
        [self presentViewController:nvc animated:YES completion:nil];
    } else {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
        
        [self.LogInLoading stopAnimating];
    }
}

- (void)EnableLogIn{
    if ([self.Email.text isEqualToString:@""] && [self.Password.text isEqualToString:@""]) {
        self.LogIn.enabled = NO;
    } else {
        self.LogIn.enabled = YES;
    }
}

@end
