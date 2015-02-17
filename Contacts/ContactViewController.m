//
//  ContactViewController.m
//  Contacts
//
//  Created by DDStudioDC on 2/16/15.
//  Copyright (c) 2015 DDStudioDC. All rights reserved.
//

#import "ContactViewController.h"
#import "EditContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Set objects on view
    
    NSLog(@"ContactViewController:  viewDidLoad");
    
    self.view.backgroundColor = [UIColor whiteColor];
    // create data containers
    self.firstNameLabel = [[UILabel alloc]init];
    self.firstNameLabel.frame = CGRectMake(20, 80, 280, 40);
    [self.view addSubview:self.firstNameLabel];
    
    self.lastNameLabel = [[UILabel alloc]init];
    self.lastNameLabel.frame = CGRectMake(20, 160, 280, 40);
    [self.view addSubview:self.lastNameLabel];
    
    self.emailLabel = [[UILabel alloc]init];
    self.emailLabel.frame = CGRectMake(20, 240, 280, 40);
    [self.view addSubview:self.emailLabel];
    
    self.phoneNumberLabel = [[UILabel alloc]init];
    self.phoneNumberLabel.frame = CGRectMake(20, 320, 280, 40);
    [self.view addSubview:self.phoneNumberLabel];
    
    self.editBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editContactPressed)];
    self.navigationItem.rightBarButtonItem = self.editBarButton;
}

-(void)editContactPressed{
    EditContactViewController *editContactsVC = [[EditContactViewController alloc] init];
    editContactsVC.contact = self.contact;
    editContactsVC.dataSource = self.dataSource;
    editContactsVC.rowIndexPath = self.rowIndexPath;
    [self presentViewController:editContactsVC animated:YES completion:nil];
}

-(void) viewWillAppear:(BOOL)animated{
    //set data
    self.firstNameLabel.text = [@"First Name: " stringByAppendingString:self.contact.firstName];
    self.lastNameLabel.text = [@"Last Name: " stringByAppendingString:self.contact.lastName];
    self.emailLabel.text = [@"Email: " stringByAppendingString:self.contact.email];
    self.phoneNumberLabel.text = [@"Phone Number: " stringByAppendingString:self.contact.phoneNumber];
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

@end
