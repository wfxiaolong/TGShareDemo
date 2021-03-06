//
//  BLYoutubeUserViewController.m
//  bigolive
//
//  Created by xlong on 3/13/17.
//  Copyright © 2017 YY Inc. All rights reserved.
//

#import "BLYoutubeUserViewController.h"

@interface BLYoutubeUserViewController ()

@property (nonatomic, strong) NSString  *user;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation BLYoutubeUserViewController

+ (void)youtubeUser:(NSString *)user fromViewController:(UIViewController*)fromVC {
    BLYoutubeUserViewController *vc = [BLYoutubeUserViewController new];
    vc.user = user;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [fromVC presentViewController:nav animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"Youtube", nil);
    
    CGRect rect = self.view.frame;
    self.webView = [[UIWebView alloc] initWithFrame:rect];
    NSString *url = [NSString stringWithFormat:@"https://m.youtube.com/user/%@", self.user];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(handleNaviBarLeftBtnClick:)];
}

- (void)handleNaviBarLeftBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
