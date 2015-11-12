//
//  BNRAssetTypeViewController.m
//  HomePwnr
//
//  Created by 王珏 on 15/11/8.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import "BNRAssetTypeViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRNewTypeViewController.h"

@interface BNRAssetTypeViewController ()

@property (nonatomic, copy) NSArray *items;
@property (nonatomic) NSManagedObject *assetType;

@end

@implementation BNRAssetTypeViewController

- (instancetype)init {
    return [super initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(addNewType:)];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.item.assetType = self.assetType;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section == 0 ? @"Asset types" : @"Items";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [[[BNRItemStore sharedStore] allAssetTypes] count];
    } else {
        if (self.items)
            return [self.items count];
        else
            return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
     if (indexPath.section == 0) {
        // Configure the cell...
        NSArray *allAssets = [[BNRItemStore sharedStore] allAssetTypes];
        NSManagedObject *assetType = allAssets[indexPath.row];
        
        NSString *assetLabel = [assetType valueForKey:@"label"];
        cell.textLabel.text = assetLabel;
        
        if (assetType == self.item.assetType) {
            [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    } else {
        if (self.items) {
            BNRItem *item = self.items[indexPath.row];
            NSString *label = item.itemName;
            cell.textLabel.text = label;
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        NSArray *allAssets = [[BNRItemStore sharedStore] allAssetTypes];
        _assetType = allAssets[indexPath.row];
        
        NSString *assetLabel = [self.assetType valueForKey:@"label"];
        _items = [[BNRItemStore sharedStore] itemsWithType:assetLabel];
        
        NSIndexSet * nd = [[NSIndexSet alloc] initWithIndex:1];
        [self.tableView reloadSections:nd withRowAnimation:UITableViewRowAnimationAutomatic];
//      [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.section == 0)
        cell.accessoryType = UITableViewCellAccessoryNone;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
 */

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addNewType:(id)sender {
    BNRNewTypeViewController *ntvc = [[BNRNewTypeViewController alloc] init];    
    ntvc.dismissBlock = ^{
        [self.tableView reloadData];
    };
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:ntvc];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;    
    [self presentViewController:navController animated:YES completion:NULL];
}

@end
