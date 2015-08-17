//
//  LoanDoneViewController.m
//  pos_visa
//
//  Created by Tracy Lakin on 8/16/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import "LoanDoneViewController.h"
#import "FormTextCell.h"
#import "ButtonTableViewCell.h"
#import "ImageTableViewCell.h"
#import "Constants.h"

@interface LoanDoneViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LoanDoneViewController

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

const NSInteger kLoanDone_TopImageRow = 0;
const NSInteger kLoanDone_ButtonRow   = 1;
const NSInteger kLoanDone_ImageTwoRow = 2;
const NSInteger kLoanDone_FooterRow   = 3;

const NSInteger kkLoanDone_TotalRows  = 4;


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kkLoanDone_TotalRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0)
        return nil;
    
    switch (indexPath.row) {
        case kLoanDone_TopImageRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * headerImage = [UIImage imageNamed:@"LoanDone_Top.png"];
            cell.imageForCell.image = headerImage;
            return cell;
        }
            break;
            
        case kLoanDone_ButtonRow:
        {
            ButtonTableViewCell * cell = [self getButtonCell:self.tableView];
            cell.buttonView.titleLabel.text = @"Add to Passbook";
            [cell.buttonView setTitleColor:buttonGreen
                                  forState:UIControlStateNormal];
            cell.buttonView.backgroundColor = [UIColor whiteColor];
            cell.buttonView.layer.cornerRadius = 10;
            cell.buttonView.layer.borderColor = [buttonGreen CGColor];
            cell.buttonView.layer.borderWidth = 1.0f;
            [cell.buttonView addTarget:self
                                action:@selector(addToPassbook)
                      forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
            break;
            
        case kLoanDone_ImageTwoRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * headerImage = [UIImage imageNamed:@"LoanDone_Middle.png"];
            cell.imageForCell.image = headerImage;
            return cell;
        }
            break;
            
        case kLoanDone_FooterRow:
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

- (void) addToPassbook
{
    
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
        case kLoanDone_TopImageRow:
            height = 292.0f;
            break;
            
        case kLoanDone_ButtonRow:
            height = 90.0f;
            
        case kLoanDone_ImageTwoRow:
            height = 147.0f;
            break;
            
        case kLoanDone_FooterRow:
            height = 563.0f;
            break;
            
        default:
            break;
    }
    return height;
}


@end
