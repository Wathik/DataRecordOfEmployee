//
//  DisplayViewController.m
//  DataRecordOfEmployee
//
//  Created by Wathik Almayali on 7/12/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import "DisplayViewController.h"
@interface DisplayViewController ()@end


@implementation DisplayViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.DisplayFirstname.text = [NSString stringWithFormat:@"First Name: %@",self.record.FirstName];
    self.DisplayLastName.text = [NSString stringWithFormat:@"Last Name: %@",self.record.LastName];
    self.DisplayWage.text = [NSString stringWithFormat:@"Wage: $%i/hr", self.record.Wage];
    self.DisplayPosition.text = [NSString stringWithFormat:@"Position: %@",self.record.position];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:self.record.HireDate];
    self.DisplayHierDate.text = stringFromDate;
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Optima" size:15],
      NSFontAttributeName, nil]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[EditViewController class]]){
        EditViewController *editViewController = segue.destinationViewController;
        editViewController.record = self.record;
       editViewController.delegate = self;
    }
}

- (IBAction)editEmployee:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toEdit" sender:sender];
}

@end
