#import "BRListControl.h"
#import "BRMenuItem.h"

@interface BRListControl () <UITableViewDataSource, UITableViewDelegate>
@property (retain) UITableView *tableView;
@end

@implementation BRListControl

- (void)dealloc;
{
  _datasource = nil;
  [_tableView release];
  [super dealloc];
}

- (id)initWithFrame:(CGRect)frame;
{
  if ((self = [super initWithFrame:frame])) {
    _tableView = [[UITableView alloc] initWithFrame:self.bounds];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self addSubview:_tableView];
  }
  return self;
}

- (void)setDatasource:(id<BRMenuListItemProvider>)datasource;
{
  if (_datasource != datasource) {
    _datasource = datasource;
    [self.tableView reloadData];
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  if (self.datasource && [self.datasource respondsToSelector:@selector(heightForRow:)]) {
    return [self.datasource heightForRow:indexPath.row];
  } else {
    return tableView.rowHeight;
  }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
  if (self.datasource && [self.datasource respondsToSelector:@selector(itemCount)]) {
    return [self.datasource itemCount];
  }
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  static NSString *identifier = @"BRListItemCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
  }
  if (self.datasource) {
    if ([self.datasource respondsToSelector:@selector(titleForRow:)]) {
      NSString *title = [self.datasource titleForRow:indexPath.row];
      cell.textLabel.text = title;
    }
    if ([self.datasource respondsToSelector:@selector(rowSelectable:)] &&
          [self.datasource rowSelectable:indexPath.row]) {
      cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    } else {
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
  }
  return cell;
}

// TODO is this how it works?
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
  if (self.datasource && [self.datasource respondsToSelector:@selector(itemForRow:)]) {
    BRMenuItem *item = [self.datasource itemForRow:indexPath.row];
    NSLog(@"Selected menu item: %@", item.text);
  }
}

@end
