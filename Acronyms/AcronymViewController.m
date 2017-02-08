//
//  AcronymViewController.m
//  Acronyms
//

#import "MBProgressHUD.h"
#import "AcronymViewController.h"

@interface AcronymViewController ()

@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (atomic, strong) NSArray<NSString *> *longForms;

@end

@implementation AcronymViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.longForms) {
        self.longForms = @[];
    }
    
    self.searchBar.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateResults:(NSArray<NSString *> *)longForms {
    self.longForms = longForms;
    [self.tableView reloadData];
}

- (void)showProgress {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideProgress {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController * alertMessage = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertMessage addAction:okButton];
    
    [self presentViewController:alertMessage animated:YES completion:nil];
}

#pragma mark UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self.delegate viewController:self didSetAcronym:searchBar.text];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    // depending on requirements could clear results on text change as well here ...
    if ([searchText length] == 0) {
        [self updateResults:@[]];
    }
}

#pragma mark table data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.longForms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AcronymCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [self.longForms objectAtIndex:indexPath.row];
    
    return cell;
}

@end
