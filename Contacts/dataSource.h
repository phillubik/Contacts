//
//  dataSource.h
//  Contacts
//
//  Created by DDStudioDC on 2/12/15.
//  Copyright (c) 2015 DDStudioDC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "contact.h"

@interface dataSource : NSObject <NSCoding>

@property (strong, nonatomic) NSArray *contactList; //desirable?

-(id)initWithData;
-(id)init;
-(void)encodeWithCoder:(NSCoder *)aCoder;
-(dataSource *)initWithCoder:(NSCoder *)aDecoder;

+(NSString *)getPathToArchive;
+(void)saveDataSource:(dataSource *)aDataSource;
+(dataSource *)getDataSource;

@end
