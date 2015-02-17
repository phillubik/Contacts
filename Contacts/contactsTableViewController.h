//
//  contactsTableViewController.h
//  Contacts
//
//  Created by DDStudioDC on 2/12/15.
//  Copyright (c) 2015 DDStudioDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataSource.h"

@interface contactsTableViewController : UITableViewController

@property (strong, nonatomic) dataSource *dataSource;
@property (strong, nonatomic) UIBarButtonItem *addContactBarButton;

@end
