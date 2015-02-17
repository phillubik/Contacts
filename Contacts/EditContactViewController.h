//
//  EditContactViewController.h
//  Contacts
//
//  Created by DDStudioDC on 2/16/15.
//  Copyright (c) 2015 DDStudioDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contact.h"
#import "dataSource.h"

@interface EditContactViewController : UIViewController

@property  (strong, nonatomic) dataSource *dataSource;
@property (strong, nonatomic) contact *contact;
@property (nonatomic) NSInteger rowIndexPath; //NOT A REFERENCE THIS IS AN INTEGER
@property (strong, nonatomic) UITextField *firstNameField;
@property (strong, nonatomic) UITextField *lastNameField;
@property (strong, nonatomic) UITextField *emailField;
@property (strong, nonatomic) UITextField *phoneNumberField;

@property (strong, nonatomic) UIButton *saveButton;
@property (strong, nonatomic) UIButton *cancleButton;

-(void)savePressed;
-(void)canclePressed;

@end
