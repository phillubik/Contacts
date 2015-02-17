//
//  addContactViewController.m
//  Contacts
//
//  Created by DDStudioDC on 2/12/15.
//  Copyright (c) 2015 DDStudioDC. All rights reserved.
//

#import "addContactViewController.h"

@interface addContactViewController () <UITextFieldDelegate>

@end

@implementation addContactViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.title = @"Add";
        /*       self.tabBarItem.image = [UIImage imageNamed:@"satellite.png"];
         self.imageTitleArray = @[@"bomb",@"ios",@"RU",@"tick",@"arch"];
         self.imageFileNameArray = @[@"bomb.png",@"keep calm.png",@"Rutgers.gif",@"tick.png",@"arch_linux-wallpaper-800x600.jpg"];
         */
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    // create data containers
    self.firstNameField = [[UITextField alloc]init];
    self.firstNameField.frame = CGRectMake(20, 80, 280, 40);
    self.firstNameField.backgroundColor = [UIColor whiteColor];
    self.firstNameField.keyboardType = UIKeyboardTypeDefault;
    self.firstNameField.delegate = self;
    [self.view addSubview:self.firstNameField];
    
    self.lastNameField = [[UITextField alloc]init];
    self.lastNameField.frame = CGRectMake(20, 140, 280, 40);
    self.lastNameField.backgroundColor = [UIColor whiteColor];
    self.lastNameField.keyboardType = UIKeyboardTypeDefault;
    self.lastNameField.delegate = self;
    [self.view addSubview:self.lastNameField];
    
    self.emailField = [[UITextField alloc]init];
    self.emailField.frame = CGRectMake(20, 200, 280, 40);
    self.emailField.backgroundColor = [UIColor whiteColor];
    self.emailField.keyboardType = UIKeyboardTypeEmailAddress;
    self.emailField.delegate = self;
    [self.view addSubview:self.emailField];
    
    self.phoneNumberField = [[UITextField alloc]init];
    self.phoneNumberField.frame = CGRectMake(20, 260, 280, 40);
    self.phoneNumberField.backgroundColor = [UIColor whiteColor];
    self.phoneNumberField.keyboardType = UIKeyboardTypeDecimalPad;
    self.phoneNumberField.delegate = self;
    [self.view addSubview:self.phoneNumberField];
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.saveButton.frame = CGRectMake(20, 320, 280, 40);
    self.saveButton.backgroundColor = [UIColor whiteColor];
    [self.saveButton setTitle:@"Save Contact" forState:UIControlStateNormal];
    [self.view addSubview:self.saveButton];
    [self.saveButton addTarget:self action:@selector(savePressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.cancleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.cancleButton.frame = CGRectMake(20, 380, 280, 40);
    self.cancleButton.backgroundColor = [UIColor whiteColor];
    [self.cancleButton setTitle:@"Cancle" forState:UIControlStateNormal];
    [self.view addSubview:self.cancleButton];
    [self.cancleButton addTarget:self action:@selector(canclePressed) forControlEvents:UIControlEventTouchUpInside];
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField  {
    [textField resignFirstResponder];
    return YES;
}

-(void)savePressed{
    self.contact.firstName = self.firstNameField.text;
    self.contact.lastName = self.lastNameField.text;
    self.contact.email = self.emailField.text;
    self.contact.phoneNumber = self.phoneNumberField.text;
    
    //Save Model
}

-(void)canclePressed{
    [self dismissViewControllerAnimated:YES completion:nil];
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
