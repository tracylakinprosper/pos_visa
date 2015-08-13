//
//  ApplyForLoanViewController.m
//  pos_visa
//
//  Created by Tracy Lakin on 8/12/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import "ApplyForLoanViewController.h"

@interface ApplyForLoanViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView * applyForLoan_ScrollView;

@property (weak, nonatomic)   IBOutlet UIView       * loanAmount_view;
@property (weak, nonatomic)   IBOutlet UIView       * homeImprovement_View;
@property (weak, nonatomic)   IBOutlet UIButton     * next_Button;
@property (strong, nonatomic)   IBOutlet UIImageView  * background_ImageView;
@property (weak, nonatomic) IBOutlet UITextField *loanAmount_TextField;
@property (weak, nonatomic) IBOutlet UIView *scrollViewItems_View;

@end

@implementation ApplyForLoanViewController

const CGFloat kScrollView_y = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loanAmount_TextField.delegate = self;
/***
    self.applyForLoan_ScrollView.frame         = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.applyForLoan_ScrollView.contentSize   = CGSizeMake(      self.view.frame.size.width, self.view.frame.size.height * 2);
    self.applyForLoan_ScrollView.contentOffset = CGPointZero;
    self.applyForLoan_ScrollView.userInteractionEnabled = YES;

    UIImage * backgroundImage = [UIImage imageNamed:@"v2-B1.png"];
    self.background_ImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    
    CGRect imageRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.background_ImageView.frame = imageRect;
    [self.scrollViewItems_View insertSubview:self.background_ImageView atIndex:0];

    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:self.background_ImageView
                                                                      attribute:NSLayoutAttributeLeading
                                                                      relatedBy:0
                                                                         toItem:self.applyForLoan_ScrollView
                                                                      attribute:NSLayoutAttributeLeading
                                                                     multiplier:1.0
                                                                       constant:0];
    [self.view addConstraint:constraintLeft];
    
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:self.background_ImageView
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:0
                                                                        toItem:self.applyForLoan_ScrollView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:0];
    [self.view addConstraint:constraintTop];
***/    
    
/***
    NSLayoutConstraint * constraintLeft =[NSLayoutConstraint
                                          constraintWithItem: self.background_ImageView
                                          attribute: NSLayoutAttributeLeft
                                          relatedBy: NSLayoutRelationEqual
                                          toItem: self.applyForLoan_ScrollView
                                          attribute: NSLayoutAttributeLeft
                                          multiplier: 1.0
                                          constant: 0];
    
    [self.applyForLoan_ScrollView addConstraint:constraintLeft];
    
    NSLayoutConstraint *constraintTop =[NSLayoutConstraint
                                        constraintWithItem: self.background_ImageView
                                        attribute: NSLayoutAttributeTop
                                        relatedBy: NSLayoutRelationEqual
                                        toItem: self.applyForLoan_ScrollView
                                        attribute: NSLayoutAttributeTop
                                        multiplier: 1.0
                                        constant: 0];
    
    [self.applyForLoan_ScrollView addConstraint:constraintTop];
***/
    
    
    NSLog(@"\n=== viewDidLoad ApplyForLoanViewController  \n applyForLoan_ScrollView: %@, \n applyForLoan_ScrollView.contentSize: %@", self.applyForLoan_ScrollView, NSStringFromCGSize(self.applyForLoan_ScrollView.contentSize));
    NSLog(@"\n=== viewDidLoad ApplyForLoanViewController  \n loanAmount_view: %@   \n homeImprovement_View: %@  \n next_buton: %@", self.loanAmount_view, self.homeImprovement_View, self.next_Button);


/***
    CGRect scrollRect = CGRectMake(0, kScrollView_y, self.view.frame.size.width, self.view.frame.size.height);
    self.applyForLoan_ScrollView = [[UIScrollView alloc] initWithFrame:scrollRect];
    self.applyForLoan_ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);

    UIImage * applyForLoad_backgroundTextImage = [UIImage imageNamed:@"v2-B1.png"];
    UIImageView * applyForLoad_backgroundTextImageView = [[UIImageView alloc] initWithImage:applyForLoad_backgroundTextImage];

    CGRect imageRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    applyForLoad_backgroundTextImageView.frame = imageRect;    // in case image is sized @2x for instance.
    applyForLoad_backgroundTextImageView.contentMode = UIViewContentModeScaleToFill;
    
    [self.loanAmount_view      removeFromSuperview];
    [self.homeImprovement_View removeFromSuperview];
    [self.next_Button          removeFromSuperview];
    
    [self.applyForLoan_ScrollView addSubview:applyForLoad_backgroundTextImageView];

    [self.applyForLoan_ScrollView addSubview:self.loanAmount_view];
    [self.applyForLoan_ScrollView addSubview:self.homeImprovement_View];
    [self.applyForLoan_ScrollView addSubview:self.next_Button];

    [self.view addSubview:self.applyForLoan_ScrollView];
***/

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSLog(@"prepareForSegue     ApplyForLoanViewController seque: %@", segue);
    NSLog(@"\n=== prepareForSegue ApplyForLoanViewController  \n applyForLoan_ScrollView: %@, \n applyForLoan_ScrollView.contentSize: %@", self.applyForLoan_ScrollView, NSStringFromCGSize(self.applyForLoan_ScrollView.contentSize));

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - Text

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.text = @"";       // Do on main thread? TODO
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField              // called when 'return' key pressed. return NO to ignore.
{
    [self.loanAmount_TextField resignFirstResponder];
    return YES;
}


@end
