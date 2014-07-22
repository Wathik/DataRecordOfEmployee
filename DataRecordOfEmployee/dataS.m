//
//  dataS.m
//  DataRecordOfEmployee
//
//  Created by Wathik Almayali on 7/12/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import "dataS.h"

@implementation dataS

-(id)initWithData:(NSDictionary *)data
{

   
    self = [super init];

    
    if (self){
        self.FirstName = data[FIRSTNAME];
        self.LastName = data[LASTNAME];
        self.Wage = [data[WAGE]intValue];
        self.position = data [POSITION];
        self.HireDate = data[HIREDATE];
        self.Raise = [data [RAISE]intValue];
    }
    
    return self;
}

/* Default initializer calls the new designated initializer initWithData */
-(id)init
{
    self = [self initWithData:Nil];
    
    return self;
}

@end
