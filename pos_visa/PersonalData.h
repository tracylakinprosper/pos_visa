//
//  PersonalData.h
//  pos_visa
//
//  Created by Tracy Lakin on 8/14/15.
//  Copyright (c) 2015 Prosper Marketplace, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonalData : NSObject


@property (strong, nonatomic) NSString * firstName;
@property (strong, nonatomic) NSString * lastName;
@property (strong, nonatomic) NSString * middleInitial;
@property (strong, nonatomic) NSString * suffix;
@property (strong, nonatomic) NSString * homeAddress;
@property (strong, nonatomic) NSString * apt;
@property (strong, nonatomic) NSString * street;
@property (strong, nonatomic) NSString * city;
@property (strong, nonatomic) NSString * state;
@property (strong, nonatomic) NSString * postalCode;

@end
