import 'package:flutter_viz/model/faq_model.dart';
import 'package:flutter_viz/model/models.dart';

import '../main.dart';

/// alphabet list
List<String> alphabetList = [
  "All",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
];

///get keyboard
List<KeyBoardShortcutsModel> getKeyBoardShortCuts() {
  List<KeyBoardShortcutsModel> list = [];
  list.add(KeyBoardShortcutsModel(title: language!.deleteWidget, action: "Delete Key", description: language!.deleteWidgetDes));
  list.add(KeyBoardShortcutsModel(title: language!.addChildWidget, action: "Ctrl+A", description: language!.addChildWidgetDes));
  list.add(KeyBoardShortcutsModel(title: language!.wrapWidget, action: "Ctrl+B", description: language!.wrapWidgetDes));
  list.add(KeyBoardShortcutsModel(title: language!.moveUpWidget, action: "Arrow Up(↑) Key", description: language!.moveUpWidgetDes));
  list.add(KeyBoardShortcutsModel(title: language!.moveDownWidget, action: "Arrow Down(↓) Key", description: language!.moveDownWidgetDes));
  list.add(KeyBoardShortcutsModel(title: language!.moveLeftWidget, action: "Arrow Left(←) Key", description: language!.moveLeftWidgetDes));
  list.add(KeyBoardShortcutsModel(title: language!.moveRightWidget, action: "Arrow Right(→) Key", description: language!.moveRightWidgetDes));
  return list;
}

///get widget information
List<WidgetsInformationModel> getWidgetInfo() {
  List<WidgetsInformationModel> list = [];
  list.add(WidgetsInformationModel(
    title: language!.titleAppBar,
    description: language!.desAppBar,
    image: 'images/widgetsInformation/wi_appbar.png',
    url: 'https://api.flutter.dev/flutter/material/AppBar-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleBottomNavigationBar,
    description: language!.desBottomNavigationBar,
    image: 'images/widgetsInformation/wi_bottom-navigation-bar.png',
    url: 'https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleLinearProgressIndicator,
    description: language!.desLinearProgressIndicator,
    image: 'images/widgetsInformation/wi_linear-progress-indicator.png',
    url: 'https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleContainer,
    description: language!.desContainer,
    image: 'images/widgetsInformation/wi_container.png',
    url: 'https://api.flutter.dev/flutter/widgets/Container-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleColumn,
    description: language!.desContainer,
    image: 'images/widgetsInformation/wi_column.png',
    url: 'https://api.flutter.dev/flutter/widgets/Column-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleCard,
    description: language!.desCard,
    image: 'images/widgetsInformation/wi_card.png',
    url: 'https://api.flutter.dev/flutter/material/Card-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleConstrainedBox,
    description: language!.desConstrainedBox,
    image: 'images/widgetsInformation/wi_constainedbox.png',
    url: 'https://api.flutter.dev/flutter/widgets/ConstrainedBox-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleClipRRect,
    description: language!.desClipRRect,
    image: 'images/widgetsInformation/wi_card.png',
    url: 'https://api.flutter.dev/flutter/widgets/ClipRRect-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleCheckBox,
    description: language!.desCheckbox,
    image: 'images/widgetsInformation/wi_checkbox.png',
    url: 'https://api.flutter.dev/flutter/material/Checkbox-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleCheckboxListTile,
    description: language!.desCheckboxListTile,
    image: 'images/widgetsInformation/wi_checkbox.png',
    url: 'https://api.flutter.dev/flutter/material/CheckboxListTile-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleChip,
    description: language!.desChip,
    image: 'images/widgetsInformation/wi_chip.png',
    url: 'https://api.flutter.dev/flutter/material/Chip-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleDivider,
    description: language!.desDivider,
    image: 'images/widgetsInformation/wi_divider.png',
    url: 'https://api.flutter.dev/flutter/material/Divider-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleDropDown,
    description: language!.desDropDown,
    image: 'images/widgetsInformation/wi_dropdown.png',
    url: 'https://api.flutter.dev/flutter/material/DropdownButton-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleRow,
    description: language!.desRow,
    image: 'images/widgetsInformation/wi_row.png',
    url: 'https://api.flutter.dev/flutter/widgets/Row-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleListView,
    description: language!.desListView,
    image: 'images/widgetsInformation/wi_listview.png',
    url: 'https://api.flutter.dev/flutter/widgets/ListView-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleGridView,
    description: language!.desGridView,
    image: 'images/widgetsInformation/wi_gridview.png',
    url: 'https://api.flutter.dev/flutter/widgets/GridView-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleStack,
    description: language!.desStack,
    image: 'images/widgetsInformation/wi_stack.png',
    url: 'https://api.flutter.dev/flutter/widgets/Stack-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titlePageView,
    description: language!.desPageView,
    image: 'images/widgetsInformation/wi_pageview.png',
    url: 'https://api.flutter.dev/flutter/widgets/PageView-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleRotatedBox,
    description: language!.desRotatedBox,
    image: 'images/flutterVizlogo.png',
    url: 'https://api.flutter.dev/flutter/widgets/RotatedBox-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleOpacity,
    description: language!.desOpacity,
    image: 'images/widgetsInformation/wi_opacity.png',
    url: 'https://api.flutter.dev/flutter/widgets/Opacity-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleText,
    description: language!.desText,
    image: 'images/widgetsInformation/wi_text.png',
    url: 'https://api.flutter.dev/flutter/widgets/Text-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleTextField,
    description: language!.desTextField,
    image: 'images/widgetsInformation/wi_textfield.png',
    url: 'https://api.flutter.dev/flutter/material/TextField-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleTextButton,
    description: language!.desButton,
    image: 'images/widgetsInformation/wi_materialbutton.png',
    url: 'https://api.flutter.dev/flutter/material/MaterialButton-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleImage,
    description: language!.desImage,
    image: 'images/widgetsInformation/wi_image.png',
    url: 'https://api.flutter.dev/flutter/widgets/Image-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleRadioButton,
    description: language!.desRadioButton,
    image: 'images/widgetsInformation/wi_radiobutton.png',
    url: 'https://api.flutter.dev/flutter/material/Radio-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleIcon,
    description: language!.desIcon,
    image: 'images/widgetsInformation/wi_icon.png',
    url: 'https://api.flutter.dev/flutter/widgets/Icon-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleIconButton,
    description: language!.titleIconButton,
    image: 'images/widgetsInformation/wi_iconbutton.png',
    url: 'https://api.flutter.dev/flutter/material/IconButton-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleListTile,
    description: language!.desListTile,
    image: 'images/widgetsInformation/wi_listtile.png',
    url: 'https://api.flutter.dev/flutter/material/ListTile-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleSwitchListTile,
    description: language!.desSwitchListTile,
    image: 'images/widgetsInformation/wi_switchlisttile.png',
    url: 'https://api.flutter.dev/flutter/material/SwitchListTile-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleSizedBox,
    description: language!.desSizedBox,
    image: 'images/widgetsInformation/wi_sizedbox.png',
    url: 'https://api.flutter.dev/flutter/widgets/SizedBox-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleSlider,
    description: language!.desSlider,
    image: 'images/widgetsInformation/wi_slider.png',
    url: 'https://api.flutter.dev/flutter/material/Slider-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleImageIcon,
    description: language!.desImageIcon,
    image: 'images/flutterVizlogo.png',
    url: 'https://api.flutter.dev/flutter/widgets/ImageIcon-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleVideoPlayer,
    description: language!.desVideoPlayer,
    image: 'images/widgetsInformation/wi_videoplayer.png',
    url: 'https://pub.dev/packages/video_player',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleAudioPlayer,
    description: language!.desAudioPlayer,
    image: 'images/widgetsInformation/wi_audioplayer.png',
    url: 'https://pub.dev/packages/just_audio',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleYoutubePlayer,
    description: language!.desYoutubePlayer,
    image: 'images/widgetsInformation/wi_youtubeplayer.png',
    url: 'https://pub.dev/packages/youtube_player_iframe',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleCalender,
    description: language!.desCalender,
    image: 'images/widgetsInformation/wi_calender.png',
    url: 'https://api.flutter.dev/flutter/material/CalendarDatePicker-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleCircleImage,
    description: language!.desCircleImage,
    image: 'images/widgetsInformation/wi_circleimage.png',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleRatingBar,
    description: language!.desRatingBar,
    image: 'images/widgetsInformation/wi_ratingbar.png',
    url: 'https://pub.dev/packages/flutter_rating_bar',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titlePadding,
    description: language!.desPadding,
    image: 'images/widgetsInformation/wi_padding.png',
    url: 'https://api.flutter.dev/flutter/widgets/Padding-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleMediaQuery,
    description: language!.desMediaQuery,
    image: 'images/widgetsInformation/wi_mediaquery.png',
    url: 'https://api.flutter.dev/flutter/widgets/MediaQuery-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleAlign,
    description: language!.desAlign,
    image: 'images/widgetsInformation/wi_align.png',
    url: 'https://api.flutter.dev/flutter/widgets/Align-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleScaffold,
    description: language!.desScaffold,
    image: 'images/widgetsInformation/wi_scaffold.png',
    url: 'https://api.flutter.dev/flutter/material/Scaffold-class.html',
  ));
  list.add(WidgetsInformationModel(
    title: language!.titleExpanded,
    description: language!.desExpanded,
    image: 'images/widgetsInformation/wi_expanded.png',
    url: 'https://api.flutter.dev/flutter/widgets/Expanded-class.html',
  ));
  list.add(WidgetsInformationModel(
    description: language!.desSingleChildScrollView,
    title: language!.titleSingleChildScrollView,
    image: 'images/flutterVizlogo.png',
    url: 'https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html',
  ));
  return list;
}

List<FAQModel> getFAQInfoList() {
  List<FAQModel> list = [];
  list.add(FAQModel(title: language!.howToMoveWidgets, description: language!.moveUpAndDownDescription));
  list.add(FAQModel(title: language!.howToAddWidgets, description: language!.addWidgetDescription));
  list.add(FAQModel(title: language!.howToDeleteWidget, description: language!.deleteWidgetDescription));
  list.add(FAQModel(title: language!.howToWrapWidget, description: language!.wrapWidgetDescription));
  list.add(FAQModel(title: language!.howToAddNewScreen, description: language!.addNewScreenDescription));
  list.add(FAQModel(title: language!.howToViewCodeAndDownloadCode, description: language!.viewCodeAndDownloadCodeDescription));
  list.add(FAQModel(title: language!.howToUsePreExistingScreen, description: language!.preDefineScreenDescription));
  list.add(FAQModel(title: language!.howToClearScreenData, description: language!.clearScreenDataDescription));
  list.add(FAQModel(title: language!.howToChangeMyLanguage, description: language!.changeLanguageDescription));
  list.add(FAQModel(title: language!.howIGetWidgetInformation, description: language!.getWidgetInformationDescription));
  list.add(FAQModel(title: language!.differenceBetweenLayout, description: language!.differenceBetweenLayoutDescription));
  list.add(FAQModel(title: language!.howToChangeWidgetProperties, description: language!.changeWidgetPropertiesDescription));
  return list;
}
