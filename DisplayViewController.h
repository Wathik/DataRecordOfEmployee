//
//  DisplayViewController.h
//  DataRecordOfEmployee
//
//  Created by Wathik Almayali on 7/12/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EditViewController.h"
#import "dataS.h"

@protocol DisplayViewControllerDelegate <NSObject>

-(void)updateEmployee;

@end

@class EditViewController;
@interface DisplayViewController : UIViewController<editViewControllerDelegate>


@property (strong, nonatomic) IBOutlet UILabel *DisplayFirstname;
@property (strong, nonatomic) IBOutlet UILabel *DisplayLastName;
@property (strong, nonatomic) IBOutlet UILabel *DisplayWage;
@property (strong, nonatomic) IBOutlet UILabel *DisplayPosition;
@property (strong, nonatomic) IBOutlet UILabel *DisplayHierDate;
@property (weak, nonatomic) id <DisplayViewControllerDelegate> delegate;
@property (strong,nonatomic) dataS *record;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *edit;
- (IBAction)edit:(UIBarButtonItem *)sender;



@end
