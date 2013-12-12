#import <Foundation/Foundation.h>


@interface ContactsDelegateDataSource : NSObject<UITableViewDataSource, UITableViewDelegate>
- (id)initWithContacts:(NSArray *)contacts;
@end