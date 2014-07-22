//
//  EditViewController.m
//  DataRecordOfEmployee
//
//  Created by Wathik Almayali on 7/12/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//
#
#import "EditViewController.h"
@interface dataS()
@end
@implementation EditViewController
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibNameOrNil];
    if (self) {
        
    }
    
    return  self;
}
-(void)viewDidLoad {
    [super viewDidLoad];
    self.FirstName.delegate =self;
    self.LastName.delegate = self;
    self.Wage.delegate = self;
    self.Position.delegate = self;
    //self.HireDate.delegate = self;
    self.Raise.delegate = self;
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName :@"Optima" size:15], NSFontAttributeName,Nil]];
    self.FirstName.text = self.Record.FirstName;
    self.LastName.text = self.Record.LastName;
    self.Wage.text = [NSString stringWithFormat:@"%i", self.Record.Wage];
    self.Position.text = self.Record.position;
    self.HireDate.date = self.Record.HireDate;
    self.Raise.text = [NSString stringWithFormat:@"%i", self.Record.Raise];
    
    
}

-(void)updateEmpolyee
{
    self.Record.FirstName = self.FirstName.text;
    self.Record.LastName = self.LastName.text;
    self.Record.wage = [self.Wage.text intValue];
    self.Record.position = self.Position.text;
    //self.Record.HireDate = self.HireDate.text;
    self.Record.Raise = [self.Raise.text intValue];

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveEditedEmployee:(id)sender {
    [self updateEmpolyee];
    [self.delegate didUpdateEmployee];
}

@end
