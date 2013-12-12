#import <Foundation/Foundation.h>


@interface Contact : NSObject
@property(strong, nonatomic) NSString *lastName;
@property(strong, nonatomic) NSString *firstName;

- (instancetype)initWithLastName:(NSString *)lastName firstName:(NSString *)firstName;

- (NSString *)name;
@end