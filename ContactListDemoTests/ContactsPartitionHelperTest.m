#import "ContactsPartitionHelper.h"
#import "Contact.h"
#import "ContactsPartitionHelperTest.h"


@implementation ContactsPartitionHelperTest {
  ContactsPartitionHelper *contactsPartitioner;
  NSMutableArray *contacts;
}

- (void)setUp {
  contactsPartitioner = [[ContactsPartitionHelper alloc] init];
  [self buildContacts];
}

- (void)testPartitionContacts {
  NSArray *result = [contactsPartitioner partitionContacts:contacts];

  NSArray *sectionStartsWithA = result[0];
  XCTAssertEqual(1u, [sectionStartsWithA count]);
  XCTAssertEqual(@"Annister", [sectionStartsWithA[0] lastName]);

  NSArray *sectionStartsWithB = result[1];
  XCTAssertEqual(1u, [sectionStartsWithB count]);
  XCTAssertEqual(@"Barkle", [sectionStartsWithB[0] lastName]);

  NSArray *sectionStartsWithS = result[18];
  XCTAssertEqual(2u, [sectionStartsWithS count]);

  XCTAssertEqual(@"Smith", [sectionStartsWithS[0] lastName]);
  XCTAssertEqual(@"Boddy", [sectionStartsWithS[0] firstName]);
  XCTAssertEqual(@"Smith", [sectionStartsWithS[1] lastName]);
  XCTAssertEqual(@"Frank", [sectionStartsWithS[1] firstName]);
}

- (void)buildContacts {
  contacts = [[NSMutableArray alloc] init];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Annister" firstName:@"Vincent"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Barkle" firstName:@"Noemy"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Smith" firstName:@"Boddy"]];
  [contacts addObject:[[Contact alloc] initWithLastName:@"Smith" firstName:@"Frank"]];
}
@end