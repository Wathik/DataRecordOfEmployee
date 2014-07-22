//
//  Add.m
//  DataRecordOfEmployee
//
//  Created by Wathik Almayali on 7/11/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import "Add.h"
@interface Add ()
@end

@implementation Add
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.EnterFirstName.delegate = self;
    self.EnterLastName.delegate = self;
    self.EnterEmployeewage.delegate = self;
    self.EnterPosition.delegate = self;
    self.EnteEmployeeRaise.delegate = self;
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Optima" size:15],
      NSFontAttributeName, nil]];
}

- (void)didReceiveMemoryWarning
    {
    [super didReceiveMemoryWarning];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.EnterFirstName.delegate = self;
    self.EnterLastName.delegate = self;
    self.EnterEmployeewage.delegate = self;
    self.EnterPosition.delegate = self;
    self.EnteEmployeeRaise.delegate = self;
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Optima" size:15],
      NSFontAttributeName, nil]];

}

-(dataS *)returnNewemployee
{
    dataS *employeeObject = [[dataS alloc] init];
    employeeObject.firstName = self.EnterFirstName.text;
    employeeObject.lastName = self.EnterLastName.text;
    employeeObject.Wage = [self.EnterEmployeewage.text intValue];
    employeeObject.position = self.EnterPosition.text;
    employeeObject.HireDate = self.EnterHireDate.date;

    return employeeObject;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)addEmployee:(UIBarButtonItem *)sender
{
    [self.delegate didAddEmployee:[self returnNewemployee]];
}

#pragma mark - UITextFieldDelegate



@end
