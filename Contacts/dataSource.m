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
    //Pull data from the model if exists if not init with data
    if ([dataSource getDataSource]){
        self = [dataSource getDataSource];
    } else {
        self = [self initWithData];
    }

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
    //Save Archive ERROR WHEN UNCOMMENT
    //[dataSource saveDataSource:self];
    //Send notification that data is in the model
    [[NSNotificationCenter defaultCenter] postNotificationName:@"initWithDataFinishedLoading" object:nil];
    
    return self;
    
}

-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.contactList forKey:@"contactsList"];
}

-(dataSource *) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        self.contactList = [aDecoder decodeObjectForKey:@"contactsList"];
    }
    return self;
}


+(NSString *) getPathToArchive {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];    //Assumes that there is only one directory in documents.  Should look in future for multiple
    return [docsDir stringByAppendingString:@"dataSource.model"];
}

+(void)saveDataSource:(dataSource *)aDataSource{
    //First Try
    //[NSKeyedArchiver archiveRootObject:aDataSource toFile:[dataSource getPathToArchive]];
    //Solution from:  http://stackoverflow.com/questions/3648558/save-and-restore-an-array-of-custom-objects did not solve problem
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:aDataSource] forKey:@"dataSource"];
}

+(dataSource *)getDataSource{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[dataSource getPathToArchive]];
}

     
@end
