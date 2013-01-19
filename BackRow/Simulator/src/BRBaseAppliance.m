#import "BRBaseAppliance.h"
#import "BRApplianceCategory.h"

@interface BRBaseAppliance ()

@end

@implementation BRBaseAppliance

#pragma mark - BRAppliance

- (NSArray *)applianceCategories;
{
  return nil;
}

- (id)applianceInfo;
{
  return nil;
}

- (id)controllerForIdentifier:(id)identifier args:(id)args;
{
  return nil;
}

- (BOOL)handleObjectSelection:(id)selection userInfo:(id)info;
{
  return NO;
}

- (BOOL)handlePlay:(id)play userInfo:(id)info;
{
  return NO;
}

- (id)identifierForContentAlias:(id)contentAlias;
{
  return nil;
}

- (id)topShelfController;
{
  return nil;
}

//- (id)localizedSearchTitle { return @"Hello World"; }
- (id)applianceName { return nil; }
//- (id)moduleName { return @"Hello World"; }
//- (id)applianceKey { return @"Hello World"; }

#pragma mark - Implementation

- (id)init;
{
  if ((self = [self initWithStyle:UITableViewStylePlain])) {
    self.title = self.applianceName;
  }
  return self;
}

- (void)viewDidLoad;
{
  [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section;
{
  return [self.applianceCategories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  static NSString *identifier = @"ApplianceCategoryCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
  }
  BRApplianceCategory *category = self.applianceCategories[indexPath.row];
  cell.textLabel.text = category.name;
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
  BRApplianceCategory *category = self.applianceCategories[indexPath.row];
  id controller = [self controllerForIdentifier:category.identifier args:nil];
  NSLog(@"SELECTED CONTROLLER: %@", controller);
}

@end
