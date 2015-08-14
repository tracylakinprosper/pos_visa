//
//  PersonalInfoViewController.m
//  pos_visa
//
//  Created by Tracy Lakin on 8/12/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "PersonalInfoFooter_TableViewCell.h"
#import "PersonalInfoTop_TableViewCell.h"

@interface PersonalInfoViewController ()  <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Personal Info";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"prepareForSegue  PersonalInfoViewController seque: %@", segue);
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


#pragma mark - Table View Delegates


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0)
        return nil;

    
    switch (indexPath.row) {
        case 0:
            return [self getTopImage];
            break;
        case 1:
            return [self getFooter];
            break;
        default:
            break;
    }
    
    return nil;
  
}

NSString *const PersonalInfoTop_TableViewCell_CELL_IDENTIFIER = @"PersonalInfoTop_TableViewCell";
NSString *const PersonalInfoFooter_TableViewCell_CELL_IDENTIFIER = @"PersonalInfoFooter_TableViewCell";


- (UITableViewCell *)getTopImage
{
    PersonalInfoTop_TableViewCell * tableViewCell = (PersonalInfoTop_TableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:PersonalInfoTop_TableViewCell_CELL_IDENTIFIER];
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableViewCell;
}

- (UITableViewCell *)getFooter
{
    PersonalInfoFooter_TableViewCell * tableViewCell = (PersonalInfoFooter_TableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:PersonalInfoFooter_TableViewCell_CELL_IDENTIFIER];
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableViewCell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0f;
    
    
    switch (indexPath.row) {
        case 0:
            height= 300.0f;
            break;
        case 1:
            height= 563.0f;
            break;
        default:
            break;
    }
    return height;

    
}




@end
