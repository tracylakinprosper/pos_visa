//
//  FormTextCell.h
//  pos_visa
//
//  Created by Tracy Lakin on 8/14/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormTextCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *editTextField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *secondEditTextField;
@property (weak, nonatomic) IBOutlet UILabel *secondTitleLabel;

@end
