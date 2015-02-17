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

-(id) init{
    self = [self initWithData];//placeholder for temporary data
    return self;
}

-(id) initWithData {
    
    self = [super init];
    if (self){
        NSMutableArray *tempDictionaryArray = [[NSMutableArray alloc] init];
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        
        //Dummy Data to put in a temporary Dictionary similar to JSON output
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
        
        //Fast enumerate through tempDictionaryArray to create contacts and add to tempArray (mutable)
        
        for (NSDictionary *oneDictionary in tempDictionaryArray){
            contact *newContact = [[contact alloc] initWithFirstName:oneDictionary[@"firstName"] lastName:oneDictionary[@"lastName"] email:oneDictionary[@"email"] phoneNumber:oneDictionary[@"phoneNumber"]];
            [tempArray addObject:newContact];
        }
        //Use mutable temporary array to set immuable property
        self.contactList=[[NSArray alloc] initWithArray:tempArray];
    }
    NSLog(@"dataSource initialized");
    
    //Send notification that data is in the model
    [[NSNotificationCenter defaultCenter] postNotificationName:@"initWithDataFinishedLoading" object:nil];
    
    return self;
    
}
     
@end
