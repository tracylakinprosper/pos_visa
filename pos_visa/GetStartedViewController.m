//
//  GetStartedViewController.m
//  pos_visa
//
//  Created by Tracy Lakin on 8/11/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import "GetStartedViewController.h"
#import "Constants.h"

@interface GetStartedViewController ()

@property (weak, nonatomic) IBOutlet UIButton *applyNow_Button;
@property (weak, nonatomic) IBOutlet UIButton *signIn_Button;

@end

@implementation GetStartedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.signIn_Button.layer.borderColor = [buttonGreen CGColor];
    self.signIn_Button.layer.borderWidth = 1.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
