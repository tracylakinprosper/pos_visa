//
//  ChooseLoanOfferViewController.m
//  pos_visa
//
//  Created by Tracy Lakin on 8/16/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import "ChooseLoanOfferViewController.h"
#import "FormTextCell.h"
#import "ButtonTableViewCell.h"
#import "ImageTableViewCell.h"
#import "Constants.h"

@interface ChooseLoanOfferViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ChooseLoanOfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


#pragma mark - Table View Delegates

const NSInteger kChooseLoan_TopImageRow      = 0;
const NSInteger kChooseLoan_LoanOfferOneRow  = 1;
const NSInteger kChooseLoan_LoanOfferTwoRow  = 2;
const NSInteger kChooseLoan_FooterRow        = 3;

const NSInteger kkChooseLoan_TotalRows       = 4;


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kkChooseLoan_TotalRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0)
        return nil;
    
    switch (indexPath.row) {
        case kChooseLoan_TopImageRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * headerImage = [UIImage imageNamed:@"CHooseYourLoan_Top.png"];
            cell.imageForCell.image = headerImage;
            return cell;
        }
            break;
            
        case kChooseLoan_LoanOfferOneRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * headerImage = [UIImage imageNamed:@"LoanOfferOne.png"];
            cell.imageForCell.image = headerImage;
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
            return cell;
        }
            break;
            
        case kChooseLoan_LoanOfferTwoRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * headerImage = [UIImage imageNamed:@"LoanOfferTwo.png"];
            cell.imageForCell.image = headerImage;
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
            return cell;
        }
            break;

        case kChooseLoan_FooterRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * footerImage = [UIImage imageNamed:@"v2_K1_footer.png"];
            cell.imageForCell.image = footerImage;
            return cell;
        }
            break;
            
        default:
            break;
    }
    
    return nil;
}




- (ButtonTableViewCell *)getButtonCell:(UITableView*)tableView
{
    ButtonTableViewCell * tableViewCell = (ButtonTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:ButtonTextCell_CELL_IDENTIFIER];
    if (nil == tableViewCell) {
        UINib * nibFile = [UINib nibWithNibName:ButtonTextCell_CELL_IDENTIFIER bundle:nil];
        [tableView registerNib:nibFile forCellReuseIdentifier:ButtonTextCell_CELL_IDENTIFIER];
        tableViewCell = [tableView dequeueReusableCellWithIdentifier:ButtonTextCell_CELL_IDENTIFIER];
    }
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableViewCell;
}

- (ImageTableViewCell *)getImageCell:(UITableView*)tableView
{
    ImageTableViewCell * tableViewCell = (ImageTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:ImageTextCell_CELL_IDENTIFIER];
    if (nil == tableViewCell) {
        UINib * nibFile = [UINib nibWithNibName:ImageTextCell_CELL_IDENTIFIER bundle:nil];
        [tableView registerNib:nibFile forCellReuseIdentifier:ImageTextCell_CELL_IDENTIFIER];
        tableViewCell = [tableView dequeueReusableCellWithIdentifier:ImageTextCell_CELL_IDENTIFIER];
    }
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableViewCell;
}



- (FormTextCell*)getFormCell:(UITableView*)tableView {
    FormTextCell *formTextCell = [tableView dequeueReusableCellWithIdentifier:FormTextCell_CELL_IDENTIFIER];
    if (nil == formTextCell) {
        UINib * nibFile = [UINib nibWithNibName:FormTextCell_XIB_NAME bundle:nil];
        [tableView registerNib:nibFile forCellReuseIdentifier:FormTextCell_CELL_IDENTIFIER];
        formTextCell = [tableView dequeueReusableCellWithIdentifier:FormTextCell_CELL_IDENTIFIER];
    }
    formTextCell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    NSLog(@"getFormCell: %@", formTextCell);
    return formTextCell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0f;
    
    switch (indexPath.row) {
        case kChooseLoan_TopImageRow:
            height = 90.0f;
            break;

        case kChooseLoan_LoanOfferOneRow:
        case kChooseLoan_LoanOfferTwoRow:
            height = 239.0f;
            break;

        case kChooseLoan_FooterRow:
            height = 600.0f;
            break;
            
        default:
            break;
    }
    return height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case kChooseLoan_TopImageRow:
        case kChooseLoan_FooterRow:
        default:
            break;
            
        case kChooseLoan_LoanOfferOneRow:
        case kChooseLoan_LoanOfferTwoRow:
            [self transitionToTruthInLendingStoryboard];
            break;
    }
}

#pragma mark - seque transitionToTruthInLendingStoryboard

NSString * const kTruthInLendingStoryboardID = @"truthInLendingStoryboardID";


- (void) transitionToTruthInLendingStoryboard
{
    UIViewController * controller = [self.storyboard instantiateViewControllerWithIdentifier:kTruthInLendingStoryboardID];
    
    [self.navigationController pushViewController:controller animated:YES];

}

@end
