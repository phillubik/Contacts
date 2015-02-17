//
//  dataSource.m
//  Contacts
//
//  Created by DDStudioDC on 2/12/15.
//  Copyright (c) 2015 DDStudioDC. All rights reserved.
//

#import "dataSource.h"
#import "contact.h"

@implementation dataSource

/*-(void)addContact:(contact *) aContact{//json object to be
    [self.contactList addObject:aContact];
    NSLog(@"Added contact to list: %@", aContact);
}

-(NSMutableArray *)getContact:(NSString *) searchItem{
    NSMutableArray *returnContact = [[NSMutableArray alloc] init];
    for (int i = 1; i < self.contactList.count; i++) {
        if (self.contactList) { //here
            [returnContact addObject:self.contactList[i]];
        }
    }
    return returnContact;
}

-(dataSource *)initWithData{
    dataSource *newDataSource = [[dataSource alloc] init];
    contact *newContact = [[contact alloc] initWithInformation:@"Phil" :@"Lubik" :@"Phil.Lubik@gmail.com" :@"8606050757"];
    //create a contact using dummy data
    //add contact to list
    [newDataSource addContact:newContact];
    NSLog(@"Created New DataSource");
    return newDataSource;
}
 */

-(id) init{
    self = [self initWithData];//placeholder for temporary data
    return self;
}

-(id) initWithData {
    
    self = [super init];
    if (self){
        NSMutableArray *tempDictionaryArray = [[NSMutableArray alloc] init];
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        //refactor this code to take in JSON
        
        NSDictionary *aContactDictionary = @{@"firstName": @"Phil",
                                   @"lastName":@"Lubik",
                                   @"email":@"Phil.lubik@gmail.com",
                                   @"phoneNumber":@"8606050757"
                                 };
        NSDictionary *bContactDictionary = @{@"firstName": @"Emily",
                                   @"lastName":@"Angstadt",
                                   @"email":@"Emily.E.Angstadt@gmail.com",
                                   @"phoneNumber":@"7322331139"
                                   };
        NSDictionary *cContactDictionary = @{@"firstName": @"John",
                                   @"lastName":@"Smith",
                                   @"email":@"Jsmith@gmail.com",
                                   @"phoneNumber":@"1234567890"
                                   };
        
        [tempDictionaryArray addObject:aContactDictionary];
        [tempDictionaryArray addObject:bContactDictionary];
        [tempDictionaryArray addObject:cContactDictionary];
        
        //Normally I would run a request for an array of dictionaries (JSON) but here I had to create
        
        for (NSDictionary *oneDictionary in tempDictionaryArray){
            contact *newContact = [[contact alloc] initWithFirstName:oneDictionary[@"firstName"] lastName:oneDictionary[@"lastName"] email:oneDictionary[@"email"] phoneNumber:oneDictionary[@"phoneNumber"]];
            [tempArray addObject:newContact];
        }
        
        self.contactList=[[NSArray alloc] initWithArray:tempArray];
    }
    NSLog(@"dataSource initialized");
    
    //Send notification that data is in the model
    [[NSNotificationCenter defaultCenter] postNotificationName:@"initWithDataFinishedLoading" object:nil];
    
    return self;
    
}
     
@end
