// For: BRMenuItem
typedef NS_ENUM(int, BRMenuItemAccessoryType) {
  BRNoMenuItemAccessoryType = 0,
  BRDisclosureMenuItemAccessoryType = 1,
  BRSpinnerMenuItemAccessoryType = 6,
  BRUnplayedMenuItemAccessoryType = 16,
  BRUnplayedPartialMenuItemAccessoryType = 17,
  BRCheckmarkMenuItemAccessoryType = 18
  // goes upto 26
};

typedef NS_ENUM(int, BREventButtonAction) {
  BREventMenuButtonAction      = 1,
  BREventUpButtonAction        = 3,
  BREventDownButtonAction      = 4,
  BREventOKButtonAction        = 5,
  BREventLeftButtonAction      = 6,
  BREventRightButtonAction     = 7,
  BREventPlayPauseButtonAction = 10,
  BREventOKButtonLongAction    = 22
};

typedef NS_ENUM(int, BREventValue) {
  BREventUpValue   = 0,
  BREventDownValue = 1
};
