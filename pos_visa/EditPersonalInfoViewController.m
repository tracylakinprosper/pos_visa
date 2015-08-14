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
    return kTotalRows;
}


const NSInteger kTopImageRow      = 0;
const NSInteger kFirstNameRow     = 1;
const NSInteger kLastNameRow      = 2;
const NSInteger kMiddleInitialRow = 3;
const NSInteger kHomeAddressRow   = 4;
const NSInteger kCityRow          = 5;
const NSInteger kStateRow         = 6;

const NSInteger kNextButtonRow    = 7;
const NSInteger kFooterImageRow   = 8;

const NSInteger kTotalRows        = 9;


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0)
        return nil;
    
    NSLog(@"EditPersonalInfo cellForRowAtIndexPath: %@", indexPath);
    
    switch (indexPath.row) {
        case kTopImageRow:
            return [self getTopImageCell];
            break;
 
        case kFirstNameRow:
        {
            FormTextCell * cell = [self getFormCell:self.tableView];
            cell.titleLabel.text    = @"FIRST NAME";
            if (self.personalData != nil) {
                cell.editTextField.text = self.personalData.firstName;
            }

            return cell;
        }
            break;
            
        case kLastNameRow:
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
            
        case kMiddleInitialRow:
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
            
        case kHomeAddressRow:
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

        case kCityRow:
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
            
        case kStateRow:
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
            
        case kNextButtonRow:
        {
            ButtonTableViewCell * cell = [self getButtonCell:self.tableView];
            cell.buttonView.titleLabel.text = @"Next";
            return cell;
        }
            break;

        case kFooterImageRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * footerImage = [UIImage imageNamed:@"v2_K1_footer.png"];
            cell.imageForCell = [[UIImageView alloc] initWithImage:footerImage];
            return cell;
        }
            break;

        default:
            break;
    }
    
    return nil;
}

NSString * const ScanDriversLicense_TableViewCell_CELL_IDENTIFIER = @"ScanDriversLicense_TableViewCell";

NSString * const FormTextCell_CELL_IDENTIFIER = @"FormTextCell";
NSString * const FormTextCell_XIB_NAME        = @"FormTextCell";

NSString * const ButtonTextCell_CELL_IDENTIFIER = @"ButtonTableViewCell";

NSString * const ImageTextCell_CELL_IDENTIFIER = @"ImageTableViewCell";

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
    return tableViewCell;
}



- (FormTextCell*)getFormCell:(UITableView*)tableView {
    FormTextCell *formTextCell = [tableView dequeueReusableCellWithIdentifier:FormTextCell_CELL_IDENTIFIER];
    if (nil == formTextCell) {
        UINib * nibFile = [UINib nibWithNibName:FormTextCell_XIB_NAME bundle:nil];
        [tableView registerNib:nibFile forCellReuseIdentifier:FormTextCell_CELL_IDENTIFIER];
        formTextCell = [tableView dequeueReusableCellWithIdentifier:FormTextCell_CELL_IDENTIFIER];
    }
//    formTextCell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSLog(@"getFormCell: %@", formTextCell);
    return formTextCell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0f;
    
    switch (indexPath.row) {
        case kTopImageRow:
            height = 80.0f;
            break;

        case kFirstNameRow:
        case kLastNameRow:
        case kMiddleInitialRow:
        case kHomeAddressRow:
        case kCityRow:
        case kStateRow:
            height = 75.0f;
            break;
            
        case kNextButtonRow:
            height = 90.0f;
            break;
            
        case kFooterImageRow:
            height = 600.0f;
            break;

       default:
            break;
    }
    return height;
    
    
}


@end
