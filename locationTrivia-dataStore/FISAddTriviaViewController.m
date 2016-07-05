//
//  FISAddTriviaViewController.m
//  locationTrivia-dataStore
//
//  Created by Sergey Nevzorov on 7/3/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaViewController.h"
#import "FISLocationsDataStore.h"
#import "FISLocationsTableViewController.h"

@interface FISAddTriviaViewController ()
@property (weak, nonatomic) IBOutlet UITextField *triviumField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (strong, nonatomic) FISLocationsTableViewController *locationSelected;

@end

@implementation FISAddTriviaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.triviumField.accessibilityLabel = @"Trivium TextField";
    self.triviumField.accessibilityIdentifier = @"Trivium TextField";
    
    self.cancelButton.accessibilityLabel = @"Cancel Button";
    self.cancelButton.accessibilityIdentifier = @"Cancel Button";
    
    self.saveButton.accessibilityLabel = @"Save Button";
    self.saveButton.accessibilityIdentifier = @"Save Button";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveButton:(id)sender {
    
    FISLocationsDataStore *dataStore = [FISLocationsDataStore sharedLocationsDataStore];
    
    NSIndexPath *indexPath = [self.locationSelected.tableView indexPathForSelectedRow];
    
    FISTrivium *newTrivia = [[FISTrivium alloc]initWithContent:self.triviumField.text likes:0];
    FISLocation *location = dataStore.locations[indexPath.row];

    [location.trivia addObject:newTrivia];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
    
}
- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
