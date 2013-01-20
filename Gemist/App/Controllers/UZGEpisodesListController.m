#import "UZGEpisodesListController.h"
#import "UitzendingGemistAPIClient.h"

@interface UZGEpisodesListController ()
@property (retain) NSString *path;
@property (retain) NSArray *episodes;
@end

@implementation UZGEpisodesListController

- (void)dealloc;
{
  [_path release];
  [_episodes release];
  [super dealloc];
}

- (id)initWithShowTitle:(NSString *)title path:(NSString *)path;
{
  if ((self = [super init])) {
    self.listTitle = title;
    _path = [path retain];
    _episodes = [NSArray new];
    self.list.datasource = self;
    [self fetchEpisodes];
  }
  return self;
}

#pragma mark - BRMenuListItemProvider

- (float)heightForRow:(long)row;
{
  return 0;
}

- (long)itemCount;
{
  return self.episodes.count;
}

// TODO no idea what this is for
- (NSString *)titleForRow:(long)row;
{
  return self.episodes[row][@"title"];
}

- (BRMenuItem *)itemForRow:(long)row;
{
  NSLog(@"ITEM FOR ROW: %ld", row);
  BRMenuItem *item = [BRMenuItem new];
  item.text = self.episodes[row][@"title"];
  //item.text = [[[NSAttributedString alloc] initWithString:self.episodes[row][@"title"]] autorelease];
  //[menuItem setText:menuTitle withAttributes:[[BRThemeInfo sharedTheme] menuItemTextAttributes]];
  [item addAccessoryOfType:0];
  return item;
}

- (BOOL)rowSelectable:(long)selectable;
{
  return YES;
}

- (void)itemSelected:(long)selected;
{
  NSLog(@"ITEM SELECTED: %@", self.episodes[selected]);
}

- (void)fetchEpisodes;
{
  NSLog(@"FETCH EPISODES!");
  self.showSpinner = YES;

  [[UitzendingGemistAPIClient sharedClient] episodesOfShowAtPath:self.path
                                                            page:1
                                                         success:^(id _, id episodes) {
    NSLog(@"%@", episodes);
    self.episodes = episodes;
    self.showSpinner = NO;
    [self.list reload];
  }
                                                         failure:^(id _, NSError *error) {
                                                                   NSLog(@"ERROR: %@", error);
                                                                 }];
}

@end
