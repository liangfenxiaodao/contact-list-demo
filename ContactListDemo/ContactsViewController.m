#import "ContactsViewController.h"
#import "ContactsDelegateDataSource.h"
#import "Contact.h"
#import "ContactsPartitionHelper.h"

@interface ContactsViewController ()
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) ContactsDelegateDataSource *delegateDataSource;
@property(nonatomic, strong) ContactsPartitionHelper *collator;
@end

@implementation ContactsViewController {

}

- (id)init {
  self = [super init];
  if (!self) return nil;
  _collator = [[ContactsPartitionHelper alloc]init];
  NSArray *partitionContacts = [_collator partitionContacts:[self buildContacts]];

  _delegateDataSource = [[ContactsDelegateDataSource alloc] initWithContacts:partitionContacts];
  return self;
}

- (void)loadView {
  self.view = [[UIView alloc]init];
  //a dirty fix of the 20px problem, which is not important in this demo
  UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
  [self.view addSubview:titleLabel];
  _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 320, [UIScreen mainScreen].bounds.size.height - 20)];
  [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [_tableView setDelegate:_delegateDataSource];
  [_tableView setDataSource:_delegateDataSource];
  [_tableView reloadData];
}

- (NSArray *)buildContacts{
  NSMutableArray *contacts = [[NSMutableArray alloc] init];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Annister" firstName:@"Vincent"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Annelly" firstName:@"Li"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Ross" firstName:@"Ben"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Kelly" firstName:@"Ben"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"John" firstName:@"Matt"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"McElduff" firstName:@"Dermot"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Park" firstName:@"Dermot"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Shah" firstName:@"Hemal"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Cris" firstName:@"Appu"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Smith" firstName:@"Boddy"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Smith" firstName:@"Frank"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Smith" firstName:@"Sally"]];
  return contacts;
}

@end