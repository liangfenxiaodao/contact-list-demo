#import "ContactsPartitionHelper.h"

@interface ContactsPartitionHelper ()
@property(nonatomic, strong) UILocalizedIndexedCollation *collation;
@end

@implementation ContactsPartitionHelper {

}
- (id)init {
  self = [super init];
  if (self) {
    _collation = [UILocalizedIndexedCollation currentCollation];
  }
  return self;
}

- (NSArray *)partitionContacts:(NSArray *)contacts {

  NSUInteger sectionCount = [[_collation sectionTitles] count];

  NSMutableArray *unsortedSections = [self createUnsortedSectionsWith:contacts collation:_collation sectionCount:sectionCount];

  NSMutableArray *sections = [NSMutableArray arrayWithCapacity:sectionCount];

  //sort each section
  for (NSMutableArray *section in unsortedSections) {
    [sections addObject:[_collation sortedArrayFromArray:section collationStringSelector:@selector(name)]];
  }

  return sections;
}

- (NSMutableArray *)createUnsortedSectionsWith:(NSArray *)contacts collation:(UILocalizedIndexedCollation *)collation sectionCount:(NSUInteger)sectionCount {
  NSMutableArray *unsortedSections = [NSMutableArray arrayWithCapacity:sectionCount];

  //create an array to hold the data for each section
  int sectionCountInt = [[NSNumber numberWithUnsignedInt:sectionCount] intValue];
  for (int i = 0; i < sectionCountInt; i++) {
    [unsortedSections addObject:[NSMutableArray array]];
  }

  //put each object into a section
  for (id object in contacts) {
    NSInteger index = [collation sectionForObject:object collationStringSelector:@selector(lastName)];
    [unsortedSections[(NSUInteger) index] addObject:object];
  }
  return unsortedSections;
}
@end