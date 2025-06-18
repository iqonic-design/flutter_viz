import 'package:flutter/material.dart';

abstract class BaseLanguage {


  static BaseLanguage? of(BuildContext context) => Localizations.of<BaseLanguage>(context, BaseLanguage);

  String get appName;

  String get cancel;

  String get save;

  String get edit;

  String get delete;

  String get noDataFound;

  String get hello;

  String get weAreMissionToHelp;

  String get userName;

  String get feedBackType;

  String get description;

  String get areYouSureWantToLogout;

  String get yes;

  String get no;

  String get logout;

  String get tutorials;

  String get enterValidUrl;

  String get name;

  String get url;

  String get samsungS20;

  String get samsungS10;

  String get samsungS7Edge;

  String get samsungS20Plus;

  String get onePlus8Pro;

  String get googlePixel4XL;

  String get onePlus7TPro;

  String get appleIPhone12Mini;

  String get appleIPhone12ProMax;

  String get samsungGalaxyS7;

  String get appleIPhone8Plus;

  String get appleIPadMini;

  String get appleIPadPro12Point9;

  String get emptyScreen;

  String get dragAndDropWidget;

  String get emptyScreenTemplates;

  String get searchForWidget;

  String get pageWidget;

  String get layoutWidget;

  String get baseWidget;

  String get editScreenName;

  String get deleteScreen;

  String get areYouWantDeleteScreen;

  String get widget;

  String get autoSaveAt;

  String get defaultProperty;

  String get selectPreBuildTemplates;

  String get tapToUseTemplate;

  String get editScreen;

  String get screenName;

  String get close;

  String get layout;

  String get wrap;

  String get child;

  String get add;

  String get widgets;

  String get changePassword;

  String get password;

  String get newPassword;

  String get confirmPassword;

  String get bothPasswordShouldBeMatched;

  String get closeScreen;

  String get downloadCode;

  String get male;

  String get female;

  String get other;

  String get socialInformation;

  String get personalInformation;

  String get designation;

  String get enterDesignation;

  String get contactNumber;

  String get selectCountry;

  String get selectedCountry;

  String get selectState;

  String get selectedState;

  String get selectCity;

  String get selectedCity;

  String get dateOfBirth;

  String get selectGender;

  String get selectedGender;

  String get twitter;

  String get enterTwitterUrl;

  String get invalidUrl;

  String get faceBook;

  String get enterFaceBookUrl;

  String get instagram;

  String get enterInstagramUrl;

  String get uplabs;

  String get enterUplabsUrl;

  String get dribbble;

  String get enterDribbbleUrl;

  String get pinterest;

  String get enterPinterestUrl;

  String get gitHub;

  String get enterGithubUrl;

  String get linkdin;

  String get enterLinkdinUrl;

  String get stackOverFlow;

  String get enterStackOverFlowUrl;

  String get frequentlyAskedQuestions;

  String get pleaseProvideFeedback;

  String get youHaveQuestionNeedHelp;

  String get whatWentWrong;

  String get pleaseProvideFeedBack;

  String get submit;

  String get whatWouldYouLikeToBuild;

  String get whatsOnYourMind;

  String get checkYourMail;

  String get weHaveSentPasswordRecover;

  String get enterEmail;

  String get createPage;

  String get help;

  String get viewSourceCode;

  String get clearCurrentScreenData;

  String get areYouClearScreenData;

  String get clear;

  String get run;

  String get saveComponent;

  String get saveTemplates;

  String get saveCurrentScreenData;

  String get newScreenName;

  String get back;

  String get keyboardShortcuts;

  String get relatedFiles;

  String get appBarNotMovable;

  String get youCanNotReplaceWidgetOfAppBar;

  String get newScreen;

  String get addScreen;

  String get areYouSureDeleteScreen;

  String get addWidgets;

  String get dragAndDropWidgetIntoCenterCanvas;

  String get clickOnWidgetFromCanvas;

  String get clickOnViewCodeButton;

  String get next;

  String get finish;

  String get widgetsInfo;

  String get email;

  String get forgotPassword;

  String get signIn;

  String get dontHaveAnAccount;

  String get clickHereToSignUp;

  String get desktopOnly;

  String get youAreSignInButItSeemsInMobileDevice;

  String get createYourFlutterVizAccount;

  String get signUp;

  String get alreadyAnAccount;

  String get notAddMoreThanOneAppBar;

  String get notAddMoreThanOneDrawer;

  String get language;

  String get personalInfo;

  String get country;

  String get state;

  String get city;

  String get gender;

  String get socialInfo;

  String get linkedIn;

  String get github;

  String get facebook;

  String get wrapWidgetCtrlB;

  String get duplicateWidget;

  String get moveUpKey;

  String get moveDownKey;

  String get moveLeftKey;

  String get moveRightKey;

  String get addChildWidgetCtrlA;

  String get deleteWidgetDeleteKey;

  String get titleScaffold;

  String get titleText;

  String get titleTextField;

  String get titleTextButton;

  String get titleImage;

  String get titleCheckBox;

  String get titleRadioButton;

  String get titleIcon;

  String get titleIconButton;

  String get titleAppBar;

  String get titleLeftDrawer;

  String get titleContainer;

  String get titleColumn;

  String get titleRow;

  String get titleCard;

  String get titleListView;

  String get titleGridView;

  String get titleVideoPlayer;

  String get titleListTile;

  String get titleStack;

  String get titleChip;

  String get titleGoogleMap;

  String get titleYoutubePlayer;

  String get titleSlider;

  String get titleAudioPlayer;

  String get titleSwitchListTile;

  String get titleCheckboxListTile;

  String get titleSizedBox;

  String get titleDivider;

  String get titleCalender;

  String get titleDropDown;

  String get titleWebView;

  String get titleCircleImage;

  String get titleRatingBar;

  String get titleTabView;

  String get titleTabBarView;

  String get titleTabBar;

  String get titleLimitedBox;

  String get titlePageView;

  String get titleRotatedBox;

  String get titleConstrainedBox;

  String get titleClipRRect;

  String get titleRootView;

  String get titleOpacity;

  String get titleImageIcon;

  String get titlePadding;

  String get titleMediaQuery;

  String get titleAlign;

  String get titleExpanded;

  String get titleSingleChildScrollView;

  String get lastLogin;

  String get scrollableColumnMsg;

  String get scrollableRowMsg;

  String get columnGridviewMsg;

  String get columnListviewMsg;

  String get rowListviewMsg;

  String get columnPageViewMsg;

  String get rowPageViewMsg;

  String get columnExpandedChildMsg;

  String get rowExpandedChildMsg;

  String get textFieldExpandedMsg;

  String get listTilExpandedMsg;

  String get switchListTileExpandedMsg;

  String get checkboxListTileExpandedMsg;

  String get calenderExpandedMsg;

  String get videoPlayerExpandedMsg;

  String get rowExpandedMsg;

  String get columnExpandedMsg;

  String get rowGridviewMsg;

  String get desAppBar;

  String get desContainer;

  String get desColumn;

  String get desCard;

  String get desConstrainedBox;

  String get desClipRRect;

  String get desCheckbox;

  String get desCheckboxListTile;

  String get desChip;

  String get desDivider;

  String get desDropDown;

  String get desRow;

  String get desListView;

  String get desGridView;

  String get desStack;

  String get desPageView;

  String get desRotatedBox;

  String get desOpacity;

  String get desText;

  String get desTextField;

  String get desButton;

  String get desImage;

  String get desRadioButton;

  String get desIcon;

  String get desIconButton;

  String get desListTile;

  String get desSwitchListTile;

  String get desSizedBox;

  String get desSlider;

  String get desImageIcon;

  String get desVideoPlayer;

  String get desAudioPlayer;

  String get desYoutubePlayer;

  String get desCalender;

  String get desCircleImage;

  String get desRatingBar;

  String get desPadding;

  String get desMediaQuery;

  String get desAlign;

  String get desScaffold;

  String get desExpanded;

  String get desSingleChildScrollView;

  String get getBugReport;

  String get featureRequest;

  String get generalFeedBack;

  String get passwordLengthValidation;

  String get titleColumnChild;

  String get titleRowChild;

  String get titleStackChild;

  String get titleListChild;

  String get titleGridChild;

  String get copyrightInformation;

  String get loginToStayConnected;

  String get title;

  String get backgroundColor;

  String get textProperty;

  String get fontWeight;

  String get fontSize;

  String get fontColor;

  String get fontStyle;

  String get elevation;

  String get centerTitle;

  String get showDefaultIcon;

  String get icon;

  String get iconColor;

  String get iconSize;

  String get actionIcon;

  String get color;

  String get size;

  String get padding;

  String get alignment;

  String get expandedAndFlex;

  String get activeTrackColor;

  String get inactiveTrackColor;

  String get thumbColor;

  String get text;

  String get fillColor;

  String get contentPadding;

  String get borderProperties;

  String get width;

  String get heightAndMinWidth;

  String get minWidth;

  String get height;

  String get expanded;

  String get radius;

  String get fontProperties;

  String get margin;

  String get shadowColor;

  String get value;

  String get tileColor;

  String get activeColor;

  String get checkColor;

  String get dense;

  String get controlAffinity;

  String get textAlign;

  String get textColor;

  String get subTitle;

  String get autoFocus;

  String get focusColor;

  String get hoverColor;

  String get splashRadius;

  String get selected;

  String get selectedTileColor;

  String get imageType;

  String get path;

  String get boxFit;

  String get borderRadius;

  String get horizontalAlignment;

  String get verticalAlignment;

  String get mainAxisSize;

  String get mainAxisAlignment;

  String get crossAxisAlignment;

  String get scrollable;

  String get pickColor;

  String get apply;

  String get basicPropertyView;

  String get selectValueBetweenMinusOneToOne;

  String get selectAnIcon;

  String get searchIcon;

  String get maxHeightAndMaxWidth;

  String get heightAndWidth;

  String get alignmentChild;

  String get boxShape;

  String get thickness;

  String get indent;

  String get endIndent;

  String get items;

  String get addOptions;

  String get dropdownValue;

  String get dropDownTextStyle;

  String get border;

  String get latitude;

  String get longitude;

  String get zoom;

  String get disableDefaultUI;

  String get axis;

  String get crossAxisCount;

  String get crossAxisSpacing;

  String get mainAxisSpacing;

  String get childAspectRatio;

  String get shrinkWrap;

  String get scrollPhysics;

  String get leadingIcon;

  String get trailingIcon;

  String get opacity;

  String get opacityValueMsg;

  String get count;

  String get imageProperties;

  String get indicatorProperties;

  String get indicatorPadding;

  String get dotEffect;

  String get dotHeight;

  String get dotWidth;

  String get spacing;

  String get expansionFactor;

  String get expansionFactorMsg;

  String get scale;

  String get groupValue;

  String get rating;

  String get itemCount;

  String get ratingSize;

  String get ratedColor;

  String get unRatedColor;

  String get safeArea;

  String get quarterTurns;

  String get sliderInitialValue;

  String get minAndMax;

  String get minimum;

  String get minimumValueMsg;

  String get maximum;

  String get maximumValueMsg;

  String get stepSize;

  String get sliderActiveColor;

  String get sliderInactiveColor;

  String get showValue;

  String get inactiveThumbColor;

  String get labelColor;

  String get labelPadding;

  String get indicatorColor;

  String get notWithinRange;

  String get switchInitialValue;

  String get borderWidth;

  String get borderColor;

  String get leading;

  String get tabIcon;

  String get initialIndex;

  String get hintText;

  String get filled;

  String get hintTextStyle;

  String get labelTextStyle;

  String get inputBorderType;

  String get maxLine;

  String get textFieldType;

  String get passwordFiled;

  String get prefixIcon;

  String get suffixIcon;

  String get fontWeightAndSize;

  String get overflow;

  String get initialValue;

  String get labelText;

  String get textStyle;

  String get autoPlay;

  String get looping;

  String get mute;

  String get showControls;

  String get showFullScreen;

  String get treeView;

  String get profile;

  String get faq;

  String get adjustVolume;

  String get adjustSpeed;

  String get playbackSpeed;

  String get theMostRecentAction;

  String get titleCreditCardView;

  String get titleLottieAnimation;

  String get animate;

  String get repeat;

  String get reloadPageMsgForLanguage;

  String get ok;

  String get selectLayoutForScaffold;

  String get addColumn;

  String get addContainer;

  String get titleDefault;

  String get addRow;

  String get replaceWidgetInsideOfScaffold;

  String get replace;

  String get replaceWidgetAlreadyContainSingleChildWidget;

  String get obsureText;

  String get obscureCardNumber;

  String get obscureCVV;

  String get inputDecorationProperties;

  String get creditCardViewExpandedMsg;

  String get pubspecYaml;

  String get skip;

  String get howToMoveWidgets;

  String get moveUpAndDownDescription;

  String get howToAddWidgets;

  String get addWidgetDescription;

  String get howToCopyWidget;

  String get copyWidgetDescription;

  String get howToDeleteWidget;

  String get deleteWidgetDescription;

  String get howToWrapWidget;

  String get wrapWidgetDescription;

  String get howToAddNewScreen;

  String get addNewScreenDescription;

  String get howToViewCodeAndDownloadCode;

  String get viewCodeAndDownloadCodeDescription;

  String get howToUsePreExistingScreen;

  String get preDefineScreenDescription;

  String get howToClearScreenData;

  String get clearScreenDataDescription;

  String get howToChangeMyLanguage;

  String get changeLanguageDescription;

  String get howIGetWidgetInformation;

  String get getWidgetInformationDescription;

  String get differenceBetweenLayout;

  String get differenceBetweenLayoutDescription;

  String get howToChangeWidgetProperties;

  String get changeWidgetPropertiesDescription;

  String get darkMode;

  String get moveDownAndRight;

  String get moveUpAndLeft;

  String get selectWidget;

  String get oneWeekAgo;

  String get oneDayAgo;

  String get oneHourAgo;

  String get oneMinuteAgo;

  String get justNow;

  String get daysAgo;

  String get hoursAgo;

  String get minutesAgo;

  String get secondsAgo;

  String get italic;

  String get checkBoxInitialValue;

  String get signInWithOtherAccount;

  String get screenNameValidationMsg;

  String get areYouWantToBack;

  String get welcomeToFlutterViz;

  String get lastEdited;

  String get copyOperationNotPerform;

  String get deleteWidget;

  String get addChildWidget;

  String get wrapWidget;

  String get moveUpWidget;

  String get moveDownWidget;

  String get moveLeftWidget;

  String get moveRightWidget;

  String get copyWidget;

  String get deleteWidgetDes;

  String get addChildWidgetDes;

  String get wrapWidgetDes;

  String get moveUpWidgetDes;

  String get moveDownWidgetDes;

  String get moveLeftWidgetDes;

  String get moveRightWidgetDes;

  String get copyWidgetDes;

  String get currentSelectedWidget;

  String get wrapWithWidget;

  String get selectWidgetToAdd;

  String get createNewProject;

  String get createProject;

  String get enterProjectText;

  String get createNew;

  String get tapToUseProject;

  String get screens;

  String get saveTemplateAsProject;

  String get removeUnderLine;

  String get downloadProject;

  String get clone;

  String get areYouSureWantToDeleteProject;

  String get secondary;

  String get selectedItemColor;

  String get unSelectedItemColor;

  String get maximumIconSizeFifty;

  String get selectedFontSize;

  String get maximumFontSizeThirty;

  String get unSelectedFontSize;

  String get newProjectName;

  String get projectName;

  String get noProjectFound;

  String get createNewProjectToGetStarted;

  String get downloadingInProgress;

  String get alreadyHaveBottomNavigationBar;

  String get editProjectName;

  String get preview;

  String get screenList;

  String get uploadImage;

  String get projectNameValidationMsg;

  String get uploadMedia;

  String get length;

  String get filedStyle;

  String get showFieldAsBox;

  String get searchForScreen;

  String get linearProgressIndicatorExpandedMsg;

  String get titleBottomNavigationBar;

  String get titleSwitch;

  String get titleOTPTextField;

  String get titleLinearProgressIndicator;

  String get progressbarValueMsg;

  String get progressbarHeightMsg;

  String get valueColor;

  String get enableBorderColor;

  String get focusBorderColor;

  String get fieldWidth;

  String get areYouSureWantToDeleteWidget;

  String get unlock;

  String get lock;

  String get screenPreview;

  String get animationSourceType;

  String get previewAll;

  String get youCanCreateMax;

  String get projectForBetaRelease;

  String get currentIndex;

  String get currentIndexValidation;

  String get showSelectedLabels;

  String get showUnSelectedLabels;

  String get allowHalfRating;

  String get doYouWantToReplace;

  String get lblWith;

  String get insideThe;

  String get orAddRowOrColumn;

  String get desBottomNavigationBar;

  String get desLinearProgressIndicator;

  String get setProperties;

  String get icon1;

  String get icon2;

  String get headerColor;

  String get addItems;

  String get itemStyle;

  String get createScreen;

  String get enterScreenText;

  String get youCanNotPerformAction;

  String get feedBack;

  String get autoSavedAt;

  String get feedbackType;

  String get inviteCode;

  String get enterYourRegisteredEmail;

  String get uploadProjectFile;
}
