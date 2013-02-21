#import "BRListControl.h"
#import "BRMenuItem.h"

@interface BRListControl () <UITableViewDataSource, UITableViewDelegate>
@property (strong) UITableView *tableView;
@end

@implementation BRListControl

- (void)dealloc;
{
  _datasource = nil;
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

- (void)reload;
{
  [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  float height = [self.datasource heightForRow:indexPath.row];
  if (height == 0) {
    height = tableView.rowHeight;
  }
  return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
  return [self.datasource itemCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  BRMenuItem *item = [self.datasource itemForRow:indexPath.row];

  // TODO this does not work as I expected...
  //if ([self.datasource rowSelectable:indexPath.row]) {
    //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
  //} else {
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
  //}

  return item;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
  [self.datasource itemSelected:indexPath.row];
}

@end
