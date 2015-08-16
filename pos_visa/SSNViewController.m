//
//  SSNViewController.m
//  pos_visa
//
//  Created by Tracy Lakin on 8/14/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import "SSNViewController.h"
#import "FormTextCell.h"
#import "ButtonTableViewCell.h"
#import "ImageTableViewCell.h"
#import "Constants.h"

@interface SSNViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SSNViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Personal Info";
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

const NSInteger kSSN_TopImageRow    = 0;
const NSInteger kSSN_TopTextRow     = 1;
const NSInteger kSSN_EditSSNRow     = 2;
const NSInteger kSSN_NextButtonRow  = 3;
const NSInteger kSSN_FooterImageRow = 4;

const NSInteger kSSN_TotalRows      = 5;


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kSSN_TotalRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0)
        return nil;
    
    NSLog(@"EditPersonalInfo cellForRowAtIndexPath: %@", indexPath);
    
    switch (indexPath.row) {
        case kSSN_TopImageRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * headerImage = [UIImage imageNamed:@"threeBarsHeader.png"];
            cell.imageForCell.image = headerImage;
            return cell;
        }
            break;
            
        case kSSN_TopTextRow:
        {
//            FormTextCell * cell = [self getFormCell:self.tableView];
//            cell.titleLabel.text    = @"FIRST NAME";
//            if (self.personalData != nil) {
//                cell.editTextField.text = self.personalData.firstName;
//            }
            {
                ImageTableViewCell * cell = [self getImageCell:self.tableView];
                UIImage * headerImage = [UIImage imageNamed:@"threeBarsHeader.png"];
                cell.imageForCell.image = headerImage;
                return cell;
            }
        }
            break;
            
        case kSSN_EditSSNRow:
        {
            ImageTableViewCell * cell = [self getImageCell:self.tableView];
            UIImage * headerImage = [UIImage imageNamed:@"threeBarsHeader.png"];
            cell.imageForCell.image = headerImage;
            return cell;
        }
            break;
            
            
        case kSSN_NextButtonRow:
        {
            ButtonTableViewCell * cell = [self getButtonCell:self.tableView];
            cell.buttonView.titleLabel.text = @"Next";
//            [cell.buttonView addTarget:self
//                                action:@selector(transitionToSSN)
//                      forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
            break;
            
        case kSSN_FooterImageRow:
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
        case kSSN_TopImageRow:
            height = 84.0f;
            break;
            
        case kSSN_TopTextRow:
            height = 75.0f;
            break;

        case kSSN_EditSSNRow:
            height = 75.0f;
            break;
            
        case kSSN_NextButtonRow:
            height = 90.0f;
            break;
            
        case kSSN_FooterImageRow:
            height = 600.0f;
            break;
            
        default:
            break;
    }
    return height;
}

@end
