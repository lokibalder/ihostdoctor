//
//  LoginModel.m
//  iHospitalDoctor
//
//  Created by  周 天力 on 14-1-21.
//  Copyright (c) 2014年 com.zhoutianli. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

@synthesize username = _username;
@synthesize password = _password;
@synthesize loginInfo = _loginInfo;

- (id) init
{
    self = [super init];
    if (self)
    {
        _username = @"";
        _password = @"";
        _loginInfo = @"";
    }
    return self;
}

@end
