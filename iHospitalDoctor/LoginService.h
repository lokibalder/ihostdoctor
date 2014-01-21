//
//  LoginService.h
//  iHospitalDoctor
//
//  Created by  周 天力 on 14-1-21.
//  Copyright (c) 2014年 com.zhoutianli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

@interface LoginService : NSObject

- (void) doLoginRequest:(LoginModel *)model;

@end
