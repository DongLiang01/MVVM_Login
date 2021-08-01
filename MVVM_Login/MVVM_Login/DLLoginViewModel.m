//
//  DLLoginViewModel.m
//  rac_test
//
//  Created by 海外网 on 2021/5/24.
//  Copyright © 2021 董良. All rights reserved.
//

#import "DLLoginViewModel.h"

@implementation DLLoginViewModel

-(instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    
}


///登录方法
- (void)loginSuccess:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure{
    if (self.userName.length <= 0) {
        NSLog(@"请输入用户名");
    }
    if (self.passWord.length <= 0) {
        NSLog(@"请输入密码");
    }
    success(@{@"username":_userName,@"password":_passWord});
}

-(void)setLoginButtonValid{
    if (_userName.length > 0 && _passWord.length > 0) {
        self.validLogin = YES;
    }else{
        self.validLogin = NO;
    }
}

-(void)setUserName:(NSString *)userName{
    _userName = userName;
    [self setLoginButtonValid];
}

-(void)setPassWord:(NSString *)passWord{
    _passWord = passWord;
    [self setLoginButtonValid];
}

@end
