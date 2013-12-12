#import "ContactsDelegateDataSource.h"
#import "Contact.h"

@interface ContactsDelegateDataSource ()
@property NSArray *contacts;
@property UILocalizedIndexedCollation *collation;
@end

@implementation ContactsDelegateDataSource {

}

- (id)initWithContacts:(NSArray *)contacts {
  self = [super init];
  if (!self)return nil;

  _contacts = contacts;
  _collation = [UILocalizedIndexedCollation currentCollation];
  return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell"];
  Contact *contact = [[self.contacts objectAtIndex:(NSUInteger) indexPath.section] objectAtIndex:(NSUInteger) indexPath.row];

  if (cell == nil) {
    cell = [[UITableViewCell alloc] init];
  }
  [[cell textLabel] setText:[contact name]];
  return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
  return [_collation sectionIndexTitles];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return (NSInteger) [[_collation sectionTitles] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return (NSInteger) [[self.contacts objectAtIndex:(NSUInteger) section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  BOOL showSection = [self tableView:tableView numberOfRowsInSection:section] != 0;
  return (showSection) ? [[_collation sectionTitles] objectAtIndex:(NSUInteger) section] : nil;
}
@end