//
//  ViewController.m
//  MVVM_Login
//
//  Created by 董良 on 2021/7/25.
//

#import "ViewController.h"
#import <ReactiveObjC.h>
#import "DLLoginViewModel.h"
#import "DLLoginViewController.h"
#import "RACLoginViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UIButton *loginButton;
@property (nonatomic, strong)UIButton *RACLoginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.orangeColor;
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.RACLoginButton];
    
}

-(UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(50, 200, 80, 30);
        _loginButton.backgroundColor = UIColor.whiteColor;
        
        [_loginButton setTitle:@"登录页面" forState:UIControlStateNormal];
        [_loginButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        @weakify(self)
        [[_loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            DLLoginViewController *vc = [[DLLoginViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    return _loginButton;
}

-(UIButton *)RACLoginButton{
    if (!_RACLoginButton) {
        _RACLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _RACLoginButton.frame = CGRectMake(50, 250, 130, 30);
        _RACLoginButton.backgroundColor = UIColor.whiteColor;
        
        [_RACLoginButton setTitle:@"RAC登录页面" forState:UIControlStateNormal];
        [_RACLoginButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        @weakify(self)
        [[_RACLoginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            RACLoginViewController *vc = [[RACLoginViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    return _RACLoginButton;
}

@end
