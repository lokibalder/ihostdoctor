//
//  MainPageViewController.h
//  iHospitalDoctor
//
//  Created by  周 天力 on 14-1-21.
//  Copyright (c) 2014年 com.zhoutianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainPageModel.h"

@interface MainPageViewController : UIViewController

//model
@property MainPageModel* mainPageModel;

//ui
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

@end
