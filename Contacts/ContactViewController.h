//
//  ContactViewController.h
//  Contacts
//
//  Created by DDStudioDC on 2/16/15.
//  Copyright (c) 2015 DDStudioDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contact.h"
#import "dataSource.h"


@interface ContactViewController : UIViewController

@property (strong, nonatomic) contact *contact;
@property (strong, nonatomic) dataSource *dataSource;
@property (nonatomic) NSInteger rowIndexPath;
@property (strong, nonatomic) UILabel *firstNameLabel;
@property (strong, nonatomic) UILabel *lastNameLabel;
@property (strong, nonatomic) UILabel *emailLabel;
@property (strong, nonatomic) UILabel *phoneNumberLabel;

@property (strong, nonatomic) UIBarButtonItem *editBarButton;

@end
