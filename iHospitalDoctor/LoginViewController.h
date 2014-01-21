//
//  LoginViewController.h
//  iHospitalDoctor
//
//  Created by  周 天力 on 14-1-21.
//  Copyright (c) 2014年 com.zhoutianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginModel.h"
#import "LoginService.h"

@interface LoginViewController : UIViewController

//model
@property LoginModel* loginModel;

//service
@property LoginService* loginService;

//UI
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *logininfoLabel;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UITextField *logininfoTextfield;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

//action
- (IBAction)doLogin:(id)sender;

@end
