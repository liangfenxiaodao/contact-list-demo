#import "Contact.h"


@implementation Contact {

}
- (id)initWithLastName:(NSString *)lastName firstName:(NSString *)firstName {
  self = [super init];
  if (self) {
    _lastName = lastName;
    _firstName = firstName;
  }

  return self;
}

- (NSString *)name {
  return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}
@end