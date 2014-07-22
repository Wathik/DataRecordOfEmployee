//
//  TabelDatarecordTableViewController.m
//  DataRecordOfEmployee
//
//  Created by Wathik Almayali on 7/11/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import "TabelDatarecordTableViewController.h"

@interface TabelDatarecordTableViewController ()

@end

@implementation TabelDatarecordTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(NSMutableArray *)employeeObject
{
    if (!_employeeObject) {
        _employeeObject = [[NSMutableArray alloc] init];
    }
    return _employeeObject;
}
- (void)viewDidLoad

{
  
    
    [super viewDidLoad];
    
      self.tableView.dataSource=self;
    self.tableView.delegate =self;
    
    NSArray *employeesAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:EMPLOYEE_OBJECTS_KEY];
    
    for (NSDictionary *dictionary in employeesAsPropertyLists){
        dataS *datas = [self employeeObjectForDictionary:dictionary];
        [self.employeeObject addObject:datas];
        
    }
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Optima" size:15],
      NSFontAttributeName, nil]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
     
}
-(void)didAddEmployee:(dataS *) record
{
    [self.employeeObject addObject:record];
    
    NSMutableArray *empObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:EMPLOYEE_OBJECTS_KEY] mutableCopy];
    if (!empObjectsAsPropertyLists) empObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    [empObjectsAsPropertyLists addObject:[self employeeObjectsDict:record]];
    [[NSUserDefaults standardUserDefaults] setObject:empObjectsAsPropertyLists forKey:EMPLOYEE_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:YES];
    [self.tableView reloadData];
                                                             
        }
-(void)didCancel
        {
            [self.navigationController popViewControllerAnimated:YES];
        }

-(NSDictionary *)employeeObjectsDict:(dataS *) empRecord
{
    NSDictionary *dictionary = @{FIRSTNAME: empRecord.FirstName, LASTNAME : empRecord.LastName, WAGE : @(empRecord.Wage), POSITION : empRecord.position, HIREDATE: empRecord.HireDate};
    return dictionary;
}

                                     
-(dataS *)employeeObjectForDictionary:(NSDictionary *)dictionary
{
  dataS *employeeObject = [[dataS alloc]initWithData:dictionary];
    return employeeObject;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
   return [self.employeeObject count];
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toDetail" sender:indexPath];
}

-(void)saveEmployees
{
    /* Create a NSMutableArray that we will NSDictionaries returned from the method taskObjectAsAPropertyList. */
    NSMutableArray *empObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    for (int x = 0; x < [self.employeeObject count]; x ++){
        [empObjectsAsPropertyLists addObject:[self employeeObjectForDictionary:self.employeeObject[x]]];
    }
    
    /* Save the updated array to NSUserDefaults. */
    [[NSUserDefaults standardUserDefaults] setObject:empObjectsAsPropertyLists forKey:EMPLOYEE_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
            dataS *record = self.employeeObject[indexPath.row ];
            cell.textLabel.text = record.FirstName;
            cell.detailTextLabel.text =record.LastName;
            return cell;
        }
                                     

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        
        [self.employeeObject removeObjectAtIndex:indexPath.row];
        
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        NSMutableArray *newemployeeData = [[NSMutableArray alloc]init];
        for (dataS *record in self.employeeObject)
        {
            [newemployeeData addObject: [self employeeObjectsDict:record]];
        }
        [[NSUserDefaults standardUserDefaults] setObject:newemployeeData forKey:EMPLOYEE_OBJECTS_KEY];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath]  withRowAnimation:UITableViewRowAnimationFade];
    }
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    dataS *employee = self.employeeObject[fromIndexPath.row];
    [self.employeeObject removeObjectAtIndex:fromIndexPath.row];
    [self.employeeObject insertObject:employee atIndex:toIndexPath.row];
    [self saveEmployees];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}

-(void)reorderCell
{
    if(self.tableView.editing == YES)[self.tableView setEditing:NO animated:YES];
    else [self.tableView setEditing:YES animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.destinationViewController isKindOfClass:[Add class]])
    {
        Add *addGoalViewController = segue.destinationViewController;
        addGoalViewController.delegate = self;
    }
    else if ([segue.destinationViewController isKindOfClass:[DisplayViewController class]]){
        DisplayViewController *detailViewController = segue.destinationViewController;
        NSIndexPath *path = sender;
        dataS *empObject = self.employeeObject[path.row];
        detailViewController.record = empObject;
        detailViewController.delegate = self;
    }
}

    
- (IBAction)Reorder:(UIBarButtonItem *)sender{
    [self reorderCell];
}
    - (IBAction)addEmp:(UIBarButtonItem *)sender
    {
        [self performSegueWithIdentifier:@"toAddEmployee" sender:sender];
        
    }

- (IBAction)DataRecord:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toAddEmployee" sender:sender];
}
    

@end
