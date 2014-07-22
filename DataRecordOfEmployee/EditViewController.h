//
//  EditViewController.h
//  DataRecordOfEmployee
//
//  Created by Wathik Almayali on 7/12/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

//#import "<UIKit/UIKit.h"

#import "dataS.h"
@protocol editViewControllerDelegate <NSObject>
-(void)didUpdateEmployee;
@end


@interface EditViewController: UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *FirstName;
@property (strong, nonatomic) IBOutlet UITextField *LastName;
@property (strong, nonatomic) IBOutlet UITextField *Wage;
@property (strong, nonatomic) IBOutlet UITextField *Position;
@property (strong, nonatomic) IBOutlet UIDatePicker *HireDate;
@property (strong, nonatomic) IBOutlet UITextField *Raise;
@property (strong, nonatomic)dataS *Record;
@property (weak, nonatomic) id <editViewControllerDelegate> delegate;

- (IBAction)saveEditedEmployee:(id)sender;

@end
