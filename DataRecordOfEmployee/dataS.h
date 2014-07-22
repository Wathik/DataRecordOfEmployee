//
//  dataS.h
//  DataRecordOfEmployee
//
//  Created by Wathik Almayali on 7/12/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FIRSTNAME @"First Name"
#define LASTNAME @"Last Name"
#define WAGE @"Emp Wage"
#define POSITION @"Position"
#define HIREDATE @"Hire Date"
#define RAISE @"Emp Elegibel Raise"

@interface dataS : NSObject
@property (strong, nonatomic) NSString *FirstName;
@property (strong, nonatomic) NSString *LastName;
@property (nonatomic) int Wage;
@property (strong, nonatomic) NSString *position;
@property (strong, nonatomic) NSDate *HireDate;
@property (nonatomic) int Raise;

-(id)initWithData:(NSDictionary *)data;

@end
