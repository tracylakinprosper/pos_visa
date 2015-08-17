//
//  EditPersonalInfoViewController.m
//  pos_visa
//
//  Created by Tracy Lakin on 8/14/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import "EditPersonalInfoViewController.h"
#import "EditPersonalInfoTableViewCell.h"
#import "FormTextCell.h"
#import "ButtonTableViewCell.h"
#import "ImageTableViewCell.h"
#import "SSNViewController.h"
#import "Constants.h"

@interface EditPersonalInfoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EditPersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kEditPersonalInfo_TotalRows;
}


const NSInteger kEditPersonalInfo_TopImageRow      = 0;
const NSInteger kEditPersonalInfo_FirstNameRow     = 1;
const NSInteger kEditPersonalInfo_LastNameRow      = 2;
const NSInteger kEditPersonalInfo_MiddleInitialRow = 3;
const NSInteger kEditPersonalInfo_HomeAddressRow   = 4;
const NSInteger kEditPersonalInfo_CityRow          = 5;
const NSInteger kEditPersonalInfo_StateRow         = 6;

const NSInteger kEditPersonalInfo_NextButtonRow    = 7;
const NSInteger kEditPersonalInfo_FooterImageRow   = 8;

const NSInteger kEditPersonalInfo_TotalRows        = 9;


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0)
        return nil;
    
    NSLog(@"EditPersonalInfo cellForRowAtIndexPath: %@", indexPath);
    
    switch (indexPath.row) {
        case kEditPersonalInfo_TopImageRow:
            return [self getTopImageCell];
            break;
 
        case kEditPersonalInfo_FirstNameRow:
        {
            FormTextCell * cell = [self getFormCell:self.tableView];
            cell.titleLabel.text    = @"FIRST NAME";
            if (self.personalData != nil) {
                cell.editTextField.text = self.personalData.firstName;
            }

            return cell;
        }
            break;
            
        case kEditPersonalInfo_LastNameRow:
        {
            FormTextCell * cell = [self getFormCell:self.tableView];
            cell.titleLabel.text    = @"LAST NAME";
            cell.editTextField.text = @"";
            if (self.personalData != nil) {
                cell.editTextField.text = self.personalData.lastName;
            }
            return cell;
        }
            break;
            
        case kEditPersonalInfo_MiddleInitialRow:
        {
            FormTextCell * cell = [self getFormCell:self.tableView];
            cell.titleLabel.text    = @"MIDDLE INITIAL";
            cell.editTextField.text = @"";
            
            cell.secondTitleLabel.text    = @"SUFFIX";
            cell.secondEditTextField.text = @"";
            if (self.personalData != nil) {
                cell.editTextField.text = self.personalData.middleInitial;
            }
            return cell;
       }
            break;
            
        case kEditPersonalInfo_HomeAddressRow:
        {
            FormTextCell * cell = [self getFormCell:self.tableView];
            cell.titleLabel.text    = @"HOME ADDRESS";
            cell.editTextField.text = @"";
            if (self.personalData != nil) {
                cell.editTextField.text = self.personalData.street;
            }
            return cell;
        }
            break;

        case kEditPersonalInfo_CityRow:
        {
            FormTextCell * cell = [self getFormCell:self.tableView];
            cell.titleLabel.text    = @"CITY";
            cell.editTextField.text = @"";
            if (self.personalData != nil) {
                cell.editTextField.text = self.personalData.city;
            }
            return cell;
        }
            break;
            
        case kEditPersonalInfo_StateRow:
        {
            FormTextCell * cell = [self getFormCell:self.tableView];
            cell.titleLabel.text    = @"STATE";
            cell.editTextField.text = @"";
            if (self.personalData != nil) {
                cell.editTextField.text = self.personalData.state;
            }

            cell.secondTitleLabel.text    = @"ZIP CODE";
            cell.secondEditTextField.text = @"";
            if (self.personalData != nil) {
                cell.secondEditTextField.text = self.personalData.postalCode;
            }
            return cell;
        }
            break;
            
        case kEditPersonalInfo_NextButtonRow:
        {
            ButtonTableViewCell * cell = [self getButtonCell:self.tableView];
            cell.buttonView.titleLabel.text = @"Next";
            [cell.buttonView addTarget:self
                                action:@selector(transitionToSSN)
                    forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
            break;

        case kEditPersonalInfo_FooterImageRow:
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


- (UITableViewCell *)getTopImageCell
{
    EditPersonalInfoTableViewCell * tableViewCell = (EditPersonalInfoTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:ScanDriversLicense_TableViewCell_CELL_IDENTIFIER];
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableViewCell;
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
        case kEditPersonalInfo_TopImageRow:
            height = 80.0f;
            break;

        case kEditPersonalInfo_FirstNameRow:
        case kEditPersonalInfo_LastNameRow:
        case kEditPersonalInfo_MiddleInitialRow:
        case kEditPersonalInfo_HomeAddressRow:
        case kEditPersonalInfo_CityRow:
        case kEditPersonalInfo_StateRow:
            height = 74.0f;
            break;
            
        case kEditPersonalInfo_NextButtonRow:
            height = 90.0f;
            break;
            
        case kEditPersonalInfo_FooterImageRow:
            height = 563.0f;
            break;

       default:
            break;
    }
    return height;
}


#pragma mark - segue to next storyboard

NSString * const kSSNStoryboardID = @"SSNViewControllerStoryboardID";

- (void) transitionToSSN
{
    SSNViewController * controller = [self.storyboard instantiateViewControllerWithIdentifier:kSSNStoryboardID];

    [self.navigationController pushViewController:controller animated:YES];
}



@end
