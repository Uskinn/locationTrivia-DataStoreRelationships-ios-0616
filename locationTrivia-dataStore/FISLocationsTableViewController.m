//
//  FISLocationsTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Sergey Nevzorov on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStore.h"
#import "FISTriviaTableViewController.h"


@interface FISLocationsTableViewController ()



@property (strong, nonatomic) FISLocationsDataStore *store;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *add;



@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
    
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
   
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"addButton";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.store.locations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
    
    
    FISLocation *location = self.store.locations[indexPath.row];
    cell.textLabel.text = location.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", location.trivia.count];
    
    // Configure the cell.
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"push"]) {
    
    FISTriviaTableViewController *trancferVC = ((FISTriviaTableViewController *)segue.destinationViewController);
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    FISLocation *selectedLocation = self.store.locations[selectedIndexPath.row];
    
    trancferVC.location = selectedLocation;
    
    }
    
}



@end
































