//
//  contact.m
//  Contacts
//
//  Created by DDStudioDC on 2/12/15.
//  Copyright (c) 2015 DDStudioDC. All rights reserved.
//

#import "contact.h"

@implementation contact

-(id)init{
    self = [self initWithFirstName:@"defaultFirstName" lastName:@"defaultLastName" email:@"defaultEmail" phoneNumber:@"defaultPhoneNumber"];
    return self;
}

-(id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email phoneNumber:(NSString *)phoneNumber
{
    self = [super init];
    if(self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.email = email;
        self.phoneNumber = phoneNumber;
    }
    return self;
}

@end
