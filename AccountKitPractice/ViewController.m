//
//  ViewController.m
//  AccountKitPractice
//
//  Created by Hanyu on 2016/10/14.
//  Copyright © 2016年 Hanyu. All rights reserved.
//

#import "ViewController.h"
#import <AccountKit/AccountKit.h>

@interface ViewController ()<AKFViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labelTokenString;
@end

@implementation ViewController{
    AKFAccountKit *_accountKit;
    UIViewController<AKFViewController> *_pendingLoginViewController;
    NSString *_authorizationCode;
    AKFTheme *_theme;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initialize Account Kit
    if (_accountKit == nil) {
        // may also specify AKFResponseTypeAccessToken
        _accountKit = [[AKFAccountKit alloc] initWithResponseType:AKFResponseTypeAccessToken];
    }
    
    _theme = [AKFTheme themeWithPrimaryColor:[UIColor redColor]
                            primaryTextColor:[UIColor whiteColor]
                              secondaryColor:[UIColor colorWithRed:1.0 green:0.8 blue:0.8 alpha:1.0]
                          secondaryTextColor:[UIColor darkGrayColor]
                              statusBarStyle:UIStatusBarStyleLightContent];
}

- (IBAction)loginWithPhone:(id)sender
{
    _pendingLoginViewController = [_accountKit viewControllerForPhoneLogin];
    _pendingLoginViewController.delegate = self;
    _pendingLoginViewController.theme = _theme;
    [self presentViewController:_pendingLoginViewController animated:YES completion:nil];
}

- (IBAction)loginWithEmail:(id)sender
{
    _pendingLoginViewController = [_accountKit viewControllerForEmailLogin];
    _pendingLoginViewController.delegate = self;
    [self presentViewController:_pendingLoginViewController animated:YES completion:nil];
}

- (void)viewController:(UIViewController<AKFViewController> *)viewController didCompleteLoginWithAuthorizationCode:(NSString *)code state:(NSString *)state
{
    NSLog(@"code: %@", code);
    NSLog(@"state: %@", state);
}

- (void)viewController:(UIViewController<AKFViewController> *)viewController didCompleteLoginWithAccessToken:(id<AKFAccessToken>)accessToken state:(NSString *)state
{
    NSLog(@"accessToken: %@", accessToken.tokenString);
    NSLog(@"state: %@", state);
    self.labelTokenString.text = accessToken.tokenString;
}

- (void)viewController:(UIViewController<AKFViewController> *)viewController didFailWithError:(NSError *)error
{
    NSLog(@"FailviewController: %@", viewController);
    NSLog(@"error: %@", error);
}

- (void)viewControllerDidCancel:(UIViewController<AKFViewController> *)viewController
{
    NSLog(@"DidCancelviewController: %@", viewController);
}
@end
