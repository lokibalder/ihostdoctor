//
//  LoginService.m
//  iHospitalDoctor
//
//  Created by  周 天力 on 14-1-21.
//  Copyright (c) 2014年 com.zhoutianli. All rights reserved.
//

#import "LoginService.h"
#import "MKNetworkKit.h"

@implementation LoginService

- (void) doLoginRequest:(LoginModel *)model
{
    //init the http engine, supply the web host
    //and also a dictionary with http headers you want to send
    //test url http://192.168.0.104:8848/minions_mock/file/ad/read.json
    //
    MKNetworkEngine* engine = [[MKNetworkEngine alloc] initWithHostName:@"192.168.0.104:8848" customHeaderFields:nil];
    
    //request parameters
    //these would be your GET or POST variables
    // NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"fundraising",@"status",nil];
    
    //create operation with the host relative path, the params
    //also method (GET,POST,HEAD,etc) and whether you want SSL or not
    MKNetworkOperation* op = [engine operationWithPath:@"minions_mock/file/ad/login.json" params: nil httpMethod:@"GET" ssl:NO];
    
    //set completion and error blocks
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSLog(@"responseString: %@", [op responseString]);
        id jsonResult = [completedOperation responseJSON];
        NSDictionary *jsonDict = (NSDictionary *)jsonResult;
        NSString *successValue = [jsonDict objectForKey:@"type"];
        NSLog(@"key:%@ value:%@",@"type",successValue);//?
    } onError:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    //add to the http queue and the request is sent
    [engine enqueueOperation: op];
    
    model.loginInfo = NSLocalizedString(@"loginView.logininfo.succeed", nil);
    
    [self saveUserNameAndPwd:model.username andPwd:model.password];
    
}

-(void)saveUserNameAndPwd:(NSString *)userName andPwd:(NSString *)pwd
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings removeObjectForKey:@"UserName"];
    [settings removeObjectForKey:@"Password"];
    [settings setObject:userName forKey:@"UserName"];
    
    //TODO
    //pwd = [AESCrypt encrypt:pwd password:@"pwd"];
    
    [settings setObject:pwd forKey:@"Password"];
    [settings synchronize];
}

@end
