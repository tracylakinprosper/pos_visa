//
//  TruthInLendingViewController.m
//  pos_visa
//
//  Created by Tracy Lakin on 8/16/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import "TruthInLendingViewController.h"
#import "FormTextCell.h"
#import "ButtonTableViewCell.h"
#import "ImageTableViewCell.h"
#import "Constants.h"

@interface TruthInLendingViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TruthInLendingViewController

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

const NSInteger kTruthInLending_TopImageRow = 0;
const NSInteger kTruthInLending_ButtonRow   = 1;
const NSInteger kTruthInLending_MiddleImageRow     = 2;
const NSInteger kTruthInLending_FooterRow   = 3;

const NSInteger kkTruthInLending_TotalRows  = 4;


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kkTruthInLending_TotalRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0)
        return nil;
    
    switch (indexPath.row) {
        case kTruthInLending_TopImageRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * headerImage = [UIImage imageNamed:@"v2-H1.png"];
            cell.imageForCell.image = headerImage;
            return cell;
        }
            break;
            
        case kTruthInLending_ButtonRow:
        {
            ButtonTableViewCell * cell = [self getButtonCell:self.tableView];
            cell.buttonView.titleLabel.text = @"Next";
            [cell.buttonView addTarget:self
                                action:@selector(transitionToLoanDoneStoryboard)
                      forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
            break;
            
        case kTruthInLending_MiddleImageRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * headerImage = [UIImage imageNamed:@"v2-H2.png"];
            cell.imageForCell.image = headerImage;
            return cell;
        }
            break;
            
        case kTruthInLending_FooterRow:
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
        case kTruthInLending_TopImageRow:
            height = 2774.0f;
            break;
            
        case kTruthInLending_ButtonRow:
            height = 90.0f;
            
        case kTruthInLending_MiddleImageRow:
            height = 82.0f;
            break;

        case kTruthInLending_FooterRow:
            height = 563.0f;
            break;
            
        default:
            break;
    }
    return height;
}



#pragma mark - seque transitionToTruthInLendingStoryboard

NSString * const kLoanDoneStoryboardID = @"loanDoneStoryboardID";


- (void) transitionToLoanDoneStoryboard
{
    UIViewController * controller = [self.storyboard instantiateViewControllerWithIdentifier:kLoanDoneStoryboardID];
    
    [self.navigationController pushViewController:controller animated:YES];
    
}

@end
