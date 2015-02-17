//
//  contactsTableViewController.m
//  Contacts
//
//  Created by DDStudioDC on 2/12/15.
//  Copyright (c) 2015 DDStudioDC. All rights reserved.
//

#import "contactsTableViewController.h"
#import "dataSource.h"
#import "ContactViewController.h"
#import "addContactViewController.h"


@interface contactsTableViewController ()

@end

@implementation contactsTableViewController

//magic implementation code

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.title = @"Contacts";
 /*       self.tabBarItem.image = [UIImage imageNamed:@"satellite.png"];
        self.imageTitleArray = @[@"bomb",@"ios",@"RU",@"tick",@"arch"];
        self.imageFileNameArray = @[@"bomb.png",@"keep calm.png",@"Rutgers.gif",@"tick.png",@"arch_linux-wallpaper-800x600.jpg"];
  */
        self.addContactBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContactPressed)];
        self.navigationItem.rightBarButtonItem = self.addContactBarButton;
  }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"contactsTableViewController called");
    
    self.dataSource = [[dataSource alloc] initWithData];
    
    //Pick up notification that data is in the model (breaks race condition)
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(dataRetrieved) name:@"initWithDataFinishedLoading" object:nil];
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    //created this to call data model??
}

-(void)dataRetrieved{
    NSLog(@"Data retrieved: %@",self.dataSource);
}

-(void)addContactPressed{
    //modal view
    addContactViewController *addContactsVC = [[addContactViewController alloc] init];
    [self presentViewController:addContactsVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //NSLog(@"Number of rows should = 3:  %lu",(unsigned long)self.dataSource.contactList.count);
    return self.dataSource.contactList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pCell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"pCell"];
    }
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row]   /*[self.dataSource.contactList[indexPath.row] name]*/;
    cell.textLabel.text = [[[self.dataSource.contactList[indexPath.row] firstName] stringByAppendingString:@" "] stringByAppendingString:[self.dataSource.contactList[indexPath.row] lastName]];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ContactViewController *contactVC = [[ContactViewController alloc]init];
    contactVC.contact = self.dataSource.contactList[indexPath.row];
    
    [self.navigationController pushViewController:contactVC animated:YES];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
