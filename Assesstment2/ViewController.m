//
//  ViewController.m
//  Assesstment2
//
//  Created by Efrén Reyes Torres on 7/31/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "DetailViewController.h"

@interface ViewController ()  <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	City *mc = [[City alloc] initWithName:@"Mexico City" state:@"Mexico"];
    City *gdl = [[City alloc] initWithName:@"Guadalajara" state:@"Jalisco"];
    City *mty = [[City alloc] initWithName:@"Monterrey" state:@"Nuevo Leon"];
    City *cnc = [[City alloc] initWithName:@"Cancun" state:@"Quintana Roo"];

    self.cities = [NSMutableArray arrayWithObjects:mc, gdl, mty, cnc, nil];
    self.tableView.allowsSelectionDuringEditing = YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showCitySegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        City *city = [self.cities objectAtIndex:indexPath.row];
        DetailViewController *dvc = (DetailViewController *)segue.destinationViewController;
        dvc.city = city;
        dvc.title = city.name;

    }
}

#pragma mark TableView delegate methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}
- (IBAction)onEditButtonPressed:(id)sender {
    if ([self.editButton.title isEqualToString:@"Edit"]) {
        [sender setTitle:@"Done" forState: UIControlStateNormal];
        [self.tableView setEditing:YES animated:YES];
    } else {
        [sender setTitle: @"Edit" forState: UIControlStateNormal];
        self.editing = NO;
        [self.tableView setEditing:NO animated:YES];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    City *city = [self.cities objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellID"];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.cities removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
