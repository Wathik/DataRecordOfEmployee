//
//  Add.h
//  DataRecordOfEmployee
//
//  Created by Wathik Almayali on 7/11/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "dataS.h"
@protocol AddDelegate <NSObject>

-(void)didCancel;
-(void)didAddEmployee:(dataS *)record;

@end

@interface Add : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *EnterFirstName;
@property (strong, nonatomic) IBOutlet UITextField *EnterLastName;
@property (strong, nonatomic) IBOutlet UITextField *EnterEmployeewage;
@property (strong, nonatomic) IBOutlet UITextField *EnterPosition;
@property (strong, nonatomic) IBOutlet UIDatePicker *EnterHireDate;
@property (strong, nonatomic) IBOutlet UITextField *EnteEmployeeRaise;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *Add;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *add;
@property (strong, nonatomic) IBOutlet UINavigationItem *addemployee;
@property (strong, nonatomic) dataS *record;
@property (weak, nonatomic) id <AddDelegate> delegate;

- (IBAction)addEmployee:(UIBarButtonItem *)sender;
- (IBAction)cancelAdd:(UIButton *)sender;

@end
