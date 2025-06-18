import 'package:flutter_dotenv/flutter_dotenv.dart';

const String appName = "FlutterViz BETA";
const font = "Inter";
final baseURl = dotenv.env['BASE_URl'];

const VERSION_NAME = '0.9.0';

const DUMMY_USER_NAME = "Rose";
const DUMMY_USER_EMAIL = "rose54321@gmail.com";

///captcha code
final CAPTACHA_SITE_KEY = dotenv.env['CAPTACHA_SITE_KEY'];
final CAPTACHA_SECRET_KEY = dotenv.env['CAPTACHA_SECRET_KEY'];

///LiveStream Keys
const LIVESTREAM_UPDATE_LAST_SYNC_TIME = "updateLastSyncTime";
const tokenStream = 'tokenStream';
const getUpdatedData = "getUpdatedData";
const updateScreenList = "updateScreenList";

///Region Config
const defaultLanguage = 'en';
const DEMO_EMAIL = "john@gmail.com";
const DEMO_PASSWORD = "12345678";
const TRY_DEMO_ROUTE = "/try-demo";
const PER_PAGE_ITEM = 10;

const commonAnimationDuration = Duration(milliseconds: 300);

const ROOT_VIEW_ID = "00000000007";

const CODE_VIEW_INDEX = 9999;
final INVITE_CODE = dotenv.env['INVITE_CODE'];

/// Screen Index
const int PRE_COMPONENTS_INDEX = -1;
const int SCREEN_LIST_INDEX = 0;
const int WIDGETS_INDEX = 1;
const int TREE_INDEX = 2;
const int PROFILE_INDEX = 3;
const int TUTORIALS_INDEX = 4;
const int WIDGETS_INFO_INDEX = 5;
const int FAQS_INDEX = 6;
const int MEDIA_INDEX = 7;
const int COMPONENT_INDEX = -1;
const int SHARE_INDEX = -1;
const int HELP_INDEX = -1;
const int SCREEN_INDEX = -1;

///Admin Screen Index
const int ADMIN_DASHBOARD_INDEX = 0;
const int ADMIN_USERS_INDEX = 1;
const int ADMIN_CATEGORIES_INDEX = 2;
const int ADMIN_TEMPLATES_INDEX = 3;
const int ADMIN_COMPONENT_INDEX = -1;
const int ADMIN_PROJECT_INDEX = 4;
const int ADMIN_FEEDBACK_INDEX = 5;
const int ADMIN_TUTORIALS_INDEX = 6;

const String DEFAULT_FILE_NAME = "PreviewScreen";
const String DEFAULT_YOUTUBE_ID = "9xwazD5SyVg";

/// Popup menu index
const int MAX_PARENT_WIDGETS = 3;
const String WRONG_INDEX = "ITEM_0";
const String WRAP_WIDGET_INDEX = "ITEM_1";
const String ADD_WIDGET_CHILD_INDEX = "ITEM_2";
const String DELETE_WIDGET_INDEX = "ITEM_3";
const String DUPLICATE_WIDGET_INDEX = "ITEM_4";
const String MOVE_UP_WIDGET_INDEX = "ITEM_5";
const String MOVE_DOWN_WIDGET_INDEX = "ITEM_6";
const String MOVE_LEFT_WIDGET_INDEX = "ITEM_7";
const String MOVE_RIGHT_WIDGET_INDEX = "ITEM_8";
const String PARENT_INDEX = "Parent_";

/// Device Width
const double DEVICE_WIDTH = 350;
const double DEVICE_HEIGHT = 650;

/// Widgets Type
/// NOTE: DO NOT CHANGE
const WidgetIconPath = "images/svgicons/";
const WidgetTypeRowLayout = "RowLayout";
const WidgetTypeCardLayout = "CardLayout";
const WidgetTypeListLayout = "ListLayout";
const WidgetTypeGridLayout = "GridLayout";
const WidgetTypeColumnLayout = "ColumnLayout";
const WidgetTypeContainerLayout = "ContainerLayout";
const WidgetTypeBottomNavigationBarLayout = "BottomNavigationBarLayout";
const WidgetTypeAppBarLayout = "AppBarLayout";
const WidgetTypeLeftDrawerLayout = "leftDrawerLayout";
const WidgetTypeStackLayout = "StackLayout";
const WidgetTypeNormal = "NormalView";
const WidgetTypeClipRRectLayout = "ClipRRectLayout";
const WidgetTypeConstrainedLayout = "ConstrainedLayout";
const WidgetTypeRotatedBoxLayout = "RotatedBoxLayout";
const WidgetTypeOpacityLayout = "OpacityLayout";
const WidgetTypeTabViewLayout = "TabViewLayout";
const WidgetTypeTabBarLayout = "TabBarLayout";
const WidgetTypeTabBarViewLayout = "TabBarViewLayout";

/// Widgets Sub Type
/// NOTE: DO NOT CHANGE
const WidgetTypeRootView = "Scaffold";
const WidgetTypeContainer = "Container";
const WidgetTypeDummyWrapWidget = "DummyWrapWidget";
const WidgetTypeDummyAddWidget = "DummyAddWidget";
const WidgetIconType = "Icon";
const WidgetTypeIconButton = "IconButton";
const WidgetTypeListTile = "ListTile";
const WidgetTypeChipView = "ChipView";
const WidgetTypeVideoPlayer = "VideoPlayer";
const WidgetTypeAudioPlayer = "AudioPlayer";
const WidgetTypeSwitchListTile = "SwitchListTile";
const WidgetTypeCheckboxListTile = "CheckboxListTile";
const WidgetTypeSizedBox = "SizedBox";
const WidgetTypeAppBar = "Appbar";
const WidgetTypeBottomNavigationBar = "BottomNavigationBar";
const WidgetTypeDivider = "Divider";
const WidgetTypeLeftDrawer = "leftDrawer";
const WidgetTypeFAB = "Fab";
const WidgetTypeText = "Text";
const WidgetTypeTextField = "TextField";
const WidgetTypeRow = "Row";
const WidgetTypeCard = "Card";
const WidgetTypeList = "List";
const WidgetTypeGrid = "Grid";
const WidgetTypeStack = "Stack";
const WidgetTypePageView = "PageView";
const WidgetTypeColumn = "Column";
const WidgetTypeImage = "Image";
const WidgetTypeCheckBox = "CheckBox";
const WidgetTypeTextButton = "TextButton";
const WidgetTypeRadio = "Radio";
const WidgetTypeCalender = "Calendar";
const WidgetTypeDropDown = "DropDown";
const WidgetTypeWebView = "WebView";
const WidgetTypeCircleImage = "CircleImage";
const WidgetTypeGoogleMap = "GoogleMap";
const WidgetTypeYoutubePlayer = "YoutubePlayer";
const WidgetTypeSlider = "Slider";
const WidgetTypeRatingBar = "RatingBar";
const WidgetTypeRotatedBox = "RotatedBox";
const WidgetTypeConstrainedBox = "ConstrainedBox";
const WidgetTypeClipRRect = "ClipRRect";
const WidgetTypeOpacity = "Opacity";
const WidgetTypeImageIcon = "ImageIcon";
const WidgetTypeSwitch = "Switch";
const WidgetTypeOTPTextField = "OTPTextField";
const WidgetTypeLinearProgressIndicator = "LinearProgressIndicator";

const WidgetTypeTabView = "TabView";
const WidgetTypeTabBarView = "TabBarView";
const WidgetTypeTabBar = "TabBar";
const WidgetTypeTab = "Tab";

const WidgetTypeLottieAnimation = "LottieAnimation";
const WidgetTypeCreditCardView = "CreditCardView";

/// Json Data
/// NOTE: DO NOT CHANGE
const JSON_WIDGET_DATA = "widgetsData";
const JSON_SCAFFOLD_DATA = "scaffoldData";
const JSON_APPBAR_DATA = "appBarData";
const JSON_BOTTOM_BAR_NAVIGATION_DATA = "bottomBarNavigationData";
const JSON_DRAWER_DATA = "drawerData";
const JSON_WIDGET_ID = "widgetId";
const JSON_TYPE = "type";
const JSON_SUB_TYPE = "subType";
const JSON_PROPERTY = "property";
const JSON_CHILD_DATA = "childData";

/// axisAlignment
const AxisAlignmentStart = 'Start';
const AxisAlignmentCenter = 'Center';
const AxisAlignmentEnd = 'End';
const AxisAlignmentSpaceEvenly = 'Space Evenly';
const AxisAlignmentSpaceAround = 'Space Around';
const AxisAlignmentSpaceBetween = 'Space Between';
const AxisAlignmentStretch = 'Stretch';

//axis
const AxisVertical = 'Vertical';
const AxisHorizontal = 'Horizontal';

//axisSize
const AxisMax = 'Max';
const AxisMin = 'Min';

const AlignmentTypeTopLeft = "TopLeft";
const AlignmentTypeTopCenter = "TopCenter";
const AlignmentTypeTopRight = "TopRight";
const AlignmentTypeCenterLeft = "CenterLeft";
const AlignmentTypeCenter = "Center";
const AlignmentTypeCenterRight = "CenterRight";
const AlignmentTypeBottomLeft = "BottomLeft";
const AlignmentTypeBottomCenter = "BottomCenter";
const AlignmentTypeBottomRight = "BottomRight";
const AlignmentTypeNone = "None";

const TextAlignTypeLeft = "Left";
const TextAlignTypeCenter = "Center";
const TextAlignTypeRight = "Right";
const TextAlignTypeJustify = "Justify";

const FontStyleNormal = "Normal";
const FontStyleItalic = "Italic";

const FontWeightTypeThin = '100 - Thin';
const FontWeightTypeExtraLight = '200 - Extra Light';
const FontWeightTypeLight = '300 - Light';
const FontWeightTypeNormal = '400 - Normal';
const FontWeightTypeMedium = '500 - Medium';
const FontWeightTypeSemiBold = '600 - Semi Bold';
const FontWeightTypeBold = '700 - Bold';
const FontWeightTypeExtraBold = '800 - Extra Bold';
const FontWeightTypeBlack = '900 - Black';

const BoxShapeTypeRectangle = 'Rectangle';
const BoxShapeTypeCircle = 'Circle';

const ListTileControlAffinityPlatform = 'platform';
const ListTileControlAffinityLeading = 'leading';
const ListTileControlAffinityTrailing = 'trailing';
const ListTileControlAffinityValue = 'values';

/// BoxFit value
const boxFitFill = 'Fill';
const boxFitContain = 'Contain';
const boxFitCover = 'Cover';
const boxFitWidth = 'Fit Width';
const boxFitHeight = 'Fit Height';
const boxFitNone = 'None';
const boxFitScaleDown = 'Scale Down';

///Image Type
const ImageTypeNetwork = 'Network';
const ImageTypeAsset = 'Asset';

/// overflow typedef
const OverflowTypeClip = 'Clip';
const OverflowTypeEllipsis = 'Ellipsis';
const OverflowTypeFade = 'Fade';
const OverflowTypeVisible = 'Visible';

///ScrollPhysics
const ScrollPhysicsAlwaysScroll = 'AlwaysScrollableScrollPhysics';
const ScrollScrollPhysics = 'ScrollPhysics';
const ScrollNeverScrollableScrollPhysics = 'NeverScrollableScrollPhysics';
const ScrollBouncingScrollPhysics = 'BouncingScrollPhysics';
const ScrollClampingScrollPhysics = 'ClampingScrollPhysics';

///InputBorderType
const InoutBorderTypeUnderLine = 'Underline';
const InputBorderTypeOutLine = 'Outline';
const InputBorderTypeNone = 'none';

///Indicator Effect
const IndicatorWormEffect = "WormEffect";
const IndicatorExpandingDotsEffect = "ExpandingDotsEffect";
const IndicatorJumpingDotsEffect = "JumpingDotEffect";
const IndicatorScrollingDotsEffect = "ScrollingDotsEffect";
const IndicatorScaleEffect = "ScaleEffect";
const IndicatorSlideEffect = "SlideEffect";

/// Width and Height type
const TypePX = 'TypePX';
const TypePercentage = 'TypePercentage';

/// Firebase Event
const String VIEW_CODE = 'View Code';
const String SCREEN_CLONE = 'Screen Clone';
const String PROJECT_CLONE = 'Project Clone';
const String DELETE_PROJECT = 'Delete Project';
const String LOGIN = 'LogIn';
const String LOGIN_GOOGLE = 'Log in with google';
const String REGISTER = 'Register New User';
const String VIEW_TEMPLATES = 'View Templates';
const String CLEAR_DATA = 'Clear Screen Data';
const String RUN_CODE = 'Run Code';
const String LOGOUT = 'Log out';
const String DELETE_SCREEN = 'Delete Screen';
const String SAVE_SCREEN = 'Save Screen';
const String DOWNLOAD_CODE = 'Download File Code';
const String DOWNLOAD_PROJECT_CODE = 'Download Project Code';
const String USER_PRE_BUILD_TEMPLATES = 'Use Templates';

/// Screen Name
const String TUTORIAL_SCREEN = 'Tutorial View Screen';
const String HOME_SCREEN = 'Home Screen';
const String TREE_VIEW_SCREEN = 'Tree View Screen';
const String PRE_BUILD_SCREEN = 'Pre-build Templates Screen';
const String PREVIEW_SCREEN = 'Preview Screen';
const String REGISTER_SCREEN = 'Register Screen';
const String VIEW_CODE_SCREEN = 'Code Screen';
const String PROPERTY_VIEW_SCREEN = 'Property View Screen';
const String PROFILE_SCREEN = 'Profile Screen';

///Shared Preferences
const IS_LOGGED_IN = 'IS_LOGGED_IN';
const USER_NAME = "USER_NAME";
const USER_EMAIL = "USER_EMAIL";
const USER_PHOTO = "USER_PHOTO";
const USER_ID = "USER_ID";
const TOKEN = 'TOKEN';
const USER_TYPE = 'USER_TYPE';
const ADMIN = 'admin';
const USER = 'USER';
const IS_FIRST_TIME_LOGIN = 'IS_FIRST_TIME_LOGIN';
const USER_CITY_NAME = 'USER_CITY_NAME';
const USER_STATE_NAME = 'USER_STATE_NAME';
const USER_COUNTRY_NAME = 'USER_COUNTRY_NAME';
const USER_COUNTRY_ID = 'USER_COUNTRY_ID';
const USER_CITY_ID = 'USER_CITY_ID';
const USER_STATE_ID = 'USER_STATE_ID';
const USER_GENDER = 'USER_GENDER';
const USER_PHONE_NUMBER = 'USER_PHONE_NUMBER';
const USER_DETAILS = 'USER_DETAILS';
const USER_DATE_OF_BIRTH = 'USER_DATE_OF_BIRTH';
const USER_DESIGNATION = 'USER_DESIGNATION';
const FACEBOOK_URL = 'FACEBOOK_URL';
const TWITTER_URL = 'TWITTER_URL';
const GITHUB_URL = 'GITHUB_URL';
const LINKDIN_URL = 'LINKDIN_URL';
const STACK_OVERFLOW_URL = 'STACK_OVERFLOW_URL';
const DRIBBBLE_URL = 'DRIBBBLE_URL';
const PINTEREST_URL = 'PINTEREST_URL';
const UPLABS_URL = 'UPLABS_URL';
const INSTAGRAM_URL = 'INSTAGRAM_URL';
const LAST_LOGIN = 'LAST_LOGIN';
const NO_OF_PROJECT = 'NO_OF_PROJECT';
const PER_PAGE_ITEM_KEY = 'PER_PAGE_ITEM_KEY';

///FeedBack Type
const FEEDBACK_TYPE_BUG_REPORT = 'Bug Report';
const FEEDBACK_TYPE_FEAUTURE_REQUEST = 'Feature Request';
const FEEDBACK_TYPE_GENERAL_FEEDBACK = 'General FeedBack';

/// Theme Mode Type ///
const ThemeModeLight = 1;
const ThemeModeDark = 0;

///Default Project Value
const DEFAULT_PROJECT_NO = 3;

const DATE_FORMAT_1 = 'd MMM, yyyy hh:mm a';
const DATE_FORMAT_2 = 'd MMM, yyyy';
const DATE_FORMAT_3 = 'hh:mm:ss a';
const DATE_FORMAT_4 = 'yyyy-MM-dd';

///Feedback status
const FEEDBACK_COMPLETE = 1;
const FEEDBACK_INCOMPLETE = 0;
const COMPLETE = "Completed";
const INCOMPLETE = "Not Completed";
