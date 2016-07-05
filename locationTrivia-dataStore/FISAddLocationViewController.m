//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Sergey Nevzorov on 7/3/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocationsDataStore.h"

@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UIButton *save;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.name.accessibilityLabel = @"nameField";
    self.name.accessibilityIdentifier = @"nameField";
    self.latitude.accessibilityIdentifier = @"latitudeField";
    self.latitude.accessibilityLabel = @"latitudeField";
    self.longitude.accessibilityLabel = @"longitudeField";
    self.longitude.accessibilityIdentifier = @"longitudeField";
    
    self.save.accessibilityIdentifier = @"saveButton";
    self.save.accessibilityLabel = @"saveButton";
    self.cancel.accessibilityLabel = @"cancelButton";
    self.cancel.accessibilityIdentifier = @"cancelButton";
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)saveButton:(id)sender {
    
    FISLocationsDataStore *newLocation = [FISLocationsDataStore sharedLocationsDataStore];
    
    FISLocation *newData= [[FISLocation alloc]initWithName:self.name.text latitude:[self.latitude.text floatValue] longitude:[self.longitude.text floatValue]];
    
    [newLocation.locations addObject:newData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
