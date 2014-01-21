//
//  LoginViewController.m
//  iHospitalDoctor
//
//  Created by  周 天力 on 14-1-21.
//  Copyright (c) 2014年 com.zhoutianli. All rights reserved.
//

#import "LoginViewController.h"
#import "MainPageViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize loginModel = _loginModel;
@synthesize loginService = _loginService;


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
    
    //init service
    _loginService = [[LoginService alloc] init];
    
    //init model
    _loginModel = [[LoginModel alloc] init];
    
    //KVO
    [_loginModel addObserver:self forKeyPath:@"loginInfo" options:NSKeyValueObservingOptionNew context:nil];
    //TODO
    //need to remove observer
    
    //set localizable string
    _welcomeLabel.text = NSLocalizedString(@"loginView.welcome.text", nil);
    _usernameLabel.text = NSLocalizedString(@"loginView.username.label.text", nil);
    _passwordLabel.text = NSLocalizedString(@"loginView.password.label.text", nil);
    _logininfoLabel.text = NSLocalizedString(@"loginView.logininfo.label.text", nil);
    [_loginButton setTitle:NSLocalizedString(@"loginView.loginbutton.text", nil) forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _loginModel && [keyPath isEqualToString:@"loginInfo"])
    {
        self.logininfoTextfield.text = _loginModel.loginInfo;
    }
    
}

- (IBAction)doLogin:(id)sender {
    NSLog(@"pushLoginButton");
    
    //set login model data
    _loginModel.username = self.usernameTextfield.text;
    _loginModel.password = self.passwordTextfield.text;
    
    [_loginService doLoginRequest:_loginModel];
    
    //if succeed
    MainPageViewController* mainPageViewController = [[MainPageViewController alloc] init];
    [self presentModalViewController:mainPageViewController animated:YES];
    
    //if failed
    //TODO
    
    
}
@end
