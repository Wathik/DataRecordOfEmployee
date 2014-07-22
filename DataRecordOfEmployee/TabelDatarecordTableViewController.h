//
//  TabelDatarecordTableViewController.h
//  DataRecordOfEmployee
//
//  Created by Wathik Almayali on 7/11/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditViewController.h"
#import "DisplayViewController.h"
#import "Add.h"
#define EMPLOYEE_OBJECTS_KEY @"Employee Objects Key"

@interface TabelDatarecordTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,AddDelegate,DisplayViewControllerDelegate>
@property (strong,nonatomic) NSMutableArray *employeeObject;
@property (strong, nonatomic) IBOutlet UINavigationItem *Add;

- (IBAction)DataRecord:(UIBarButtonItem *)sender;
- (IBAction)Reorder:(UIBarButtonItem *)sender;
@end
