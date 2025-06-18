import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_viz/components/change_password_dialog.dart';
import 'package:flutter_viz/components/edit_profile_dialog.dart';
import 'package:flutter_viz/externalClasses/common_language_list_widget.dart' as commonLanguage;
import 'package:flutter_viz/externalClasses/on_hover.dart';
import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/profile_info_model.dart';
import 'package:flutter_viz/model/profile_photo_model.dart';
import 'package:flutter_viz/network/network_utils.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileComponent extends StatefulWidget {
  static String tag = '/ProfileComponent';

  @override
  ProfileComponentState createState() => ProfileComponentState();
}

class ProfileComponentState extends State<ProfileComponent> {
  final ImagePicker _picker = ImagePicker();

  List<ProfileInfoModel> profileInfoList = [];
  XFile? image;
  Uint8List? profileImg;

  int? selectedIndex;
  bool isLoading = false;

  String? screenData;
  String? fileName;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  /// edit profile api call
  Future editProfileApi(String? languageCode) async {
    hideKeyboard(context);
    Map req = {
      'user_id': getIntAsync(USER_ID),
      'email': getStringAsync(USER_EMAIL),
      'language_code': languageCode,
    };
    await updateProfile(req).then((value) {
      log(value.message);
    }).catchError((e) {
      log(e.toString());
    });
  }

  Future uploadPhoto(BuildContext context) async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImg = await image!.readAsBytes();
      fileName = image!.name;
    }
    appStore.setLoading(true);
    await updateProfileApi(context, profileImg, fileName);
  }

  ///add media url
  Future<void> updateProfileApi(BuildContext context, Uint8List? profileImg, String? fileName) async {
    hideKeyboard(context);
    MultipartRequest multiPartRequest = await getMultiPartRequest('update-profile-image');

    multiPartRequest.fields['id'] = getIntAsync(USER_ID).toString();
    multiPartRequest.files.add(MultipartFile.fromBytes('profile_image', profileImg!, filename: fileName));

    multiPartRequest.headers.addAll(buildHeaderTokens());

    await sendMultiPartRequest(
      multiPartRequest,
      onSuccess: (data) async {
        appStore.setLoading(false);
        if (data != null) {
          ProfilePhotoModel res = ProfilePhotoModel.fromJson(jsonDecode(data));
          getToast(res.message.toString());
          await setValue(USER_PHOTO, res.data!.profileImage ?? 'images/user_place_holder.png');
          appStore.setProfileImage(res.data!.profileImage ?? 'images/user_place_holder.png');
          setState(() {});
        }
      },
      onError: (error) {
        appStore.setLoading(false);
        getToast(error.toString());
      },
    ).catchError((e) {
      appStore.setLoading(false);
      getToast(e.toString());
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'images/flutterviz_bg.jpg',
                      height: 200,
                      width: context.width(),
                      fit: BoxFit.cover,
                    ).cornerRadiusWithClipRRectOnly(bottomLeft: COMMON_CARD_BORDER_RADIUS.toInt(), bottomRight: COMMON_CARD_BORDER_RADIUS.toInt()),
                    Positioned(
                      top: 32,
                      left: 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${language!.hello} ${getStringAsync(USER_NAME)} !',
                            style: primaryTextStyle(color: Colors.white, size: 30),
                          ),
                          8.height,
                          Text(
                            language!.weAreMissionToHelp,
                            style: secondaryTextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: context.width(),
                  margin: EdgeInsets.only(right: 100, left: 100, top: 120, bottom: 30),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: context.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                    boxShadow: [
                      appStore.isDarkMode ? commonCardBoxShadowDarkMode() : commonCardBoxShadow(),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  ClipRRect(
                                    child: profileImage(60),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(color: btnBackgroundColor, shape: BoxShape.circle),
                                    child: Icon(Icons.edit, size: 15, color: context.iconColor),
                                  ),
                                ],
                              ).onTap(() {
                                uploadPhoto(context);
                              }),
                              16.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(getStringAsync(USER_NAME), style: primaryTextStyle(size: 24), maxLines: 1),
                                  Row(
                                    children: [
                                      Text('${language!.lastLogin}:', style: primaryTextStyle(size: 12)),
                                      8.width,
                                      Text(
                                        getLastLogin(updateTimeString: getStringAsync(LAST_LOGIN)),
                                        style: boldTextStyle(size: 12),
                                      ),
                                    ],
                                  ),
                                  8.height,
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: Image.asset('images/linkedin.png', fit: BoxFit.cover).onTap(() {
                                          launchUrl(Uri.parse(getStringAsync(LINKDIN_URL)));
                                        }),
                                      ).paddingOnly(right: 8).visible(getStringAsync(LINKDIN_URL).isNotEmpty),
                                      ClipOval(
                                        child: Image.asset('images/github.png', fit: BoxFit.cover).onTap(() {
                                          launchUrl(Uri.parse(getStringAsync(GITHUB_URL)));
                                        }),
                                      ).paddingOnly(right: 8).visible(getStringAsync(GITHUB_URL).isNotEmpty),
                                      ClipOval(
                                        child: Image.asset('images/twitter.png', fit: BoxFit.cover).onTap(() {
                                          launchUrl(Uri.parse(getStringAsync(TWITTER_URL)));
                                        }),
                                      ).paddingOnly(right: 8).visible(getStringAsync(TWITTER_URL).isNotEmpty),
                                      ClipOval(
                                        child: Image.asset('images/facebook.png', fit: BoxFit.cover).onTap(() {
                                          launchUrl(Uri.parse(getStringAsync(FACEBOOK_URL)));
                                        }),
                                      ).paddingOnly(right: 8).visible(getStringAsync(FACEBOOK_URL).isNotEmpty),
                                      ClipOval(
                                        child: Image.asset('images/pinterest.png', fit: BoxFit.cover).onTap(() {
                                          launchUrl(Uri.parse(getStringAsync(PINTEREST_URL)));
                                        }),
                                      ).paddingOnly(right: 8).visible(getStringAsync(PINTEREST_URL).isNotEmpty),
                                      ClipOval(
                                        child: Image.asset('images/dribbble.png', fit: BoxFit.cover).paddingOnly(right: 16).onTap(() {
                                          launchUrl(Uri.parse(getStringAsync(DRIBBBLE_URL)));
                                        }),
                                      ).paddingOnly(right: 8).visible(getStringAsync(DRIBBBLE_URL).isNotEmpty),
                                      ClipOval(
                                        child: Image.asset('images/uplabs.jpeg', height: 32, width: 32, fit: BoxFit.cover).onTap(() {
                                          launchUrl(Uri.parse(getStringAsync(UPLABS_URL)));
                                        }),
                                      ).paddingOnly(right: 8).visible(getStringAsync(UPLABS_URL).isNotEmpty),
                                      ClipOval(
                                        child: Image.asset('images/instagram.png', fit: BoxFit.cover).onTap(() {
                                          launchUrl(Uri.parse(getStringAsync(INSTAGRAM_URL)));
                                        }),
                                      ).paddingOnly(right: 8).visible(getStringAsync(INSTAGRAM_URL).isNotEmpty),
                                      ClipOval(
                                        child: Image.asset('images/stackoverflow.png', fit: BoxFit.cover).onTap(() {
                                          launchUrl(Uri.parse(getStringAsync(STACK_OVERFLOW_URL)));
                                        }),
                                      ).paddingOnly(right: 8).visible(getStringAsync(STACK_OVERFLOW_URL).isNotEmpty),
                                    ],
                                  ),
                                  8.height,
                                ],
                              )
                            ],
                          ).expand(),
                          commonLanguage.CommonLanguageListWidget(
                            onLanguageChange: (LanguageDataModel? v) async {
                              appStore.setLoading(true);
                              await appStore.setLanguage(v!.languageCode);
                              appStore.setIsLanguageChanged(true);
                              Future.delayed(Duration(seconds: 3), () {
                                appStore.setLoading(false);
                                setState(() {});
                              });
                              editProfileApi(v.languageCode);
                            },
                          ),
                          16.width,
                          OnHover(builder: (isHovered) {
                            return elevationButtonWithIcon(
                              isHovered: isHovered,
                              toolTipMessage: language!.changePassword,
                              icon: Icons.vpn_key,
                              title: language!.changePassword,
                              onPressed: () async {
                                ifNotTester(() async {
                                  await showInDialog(
                                    context,
                                    builder: (context) => ChangePasswordDialog(),
                                  );
                                });
                              },
                            );
                          }).paddingAll(30),
                        ],
                      ).paddingAll(30),
                      Divider(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR, thickness: 2),
                      16.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(language!.personalInformation, style: boldTextStyle()).expand(),
                              OnHover(builder: (isHovered) {
                                return elevationButtonWithIcon(
                                  isHovered: isHovered,
                                  toolTipMessage: language!.personalInfo,
                                  icon: Icons.edit,
                                  title: language!.personalInfo,
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        content: EditProfileDialog(),
                                      ),
                                    );
                                    setState(() {});
                                  },
                                );
                              }),
                            ],
                          ),
                          16.height,
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR, width: 2),
                                borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        profilePersonalInfoWidget(icon: Icons.work_outline, title: language!.designation, titleValue: getStringAsync(USER_DESIGNATION)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(icon: Icons.mail, title: language!.email, titleValue: getStringAsync(USER_EMAIL)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(icon: Icons.call, title: language!.contactNumber, titleValue: getStringAsync(USER_PHONE_NUMBER)).expand(),
                                      ],
                                    ),
                                  ),
                                  Divider(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR, thickness: 2, height: 0),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        profilePersonalInfoWidget(icon: Icons.location_on, title: language!.country, titleValue: getStringAsync(USER_COUNTRY_NAME)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(icon: Icons.location_on, title: language!.state, titleValue: getStringAsync(USER_STATE_NAME)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(icon: Icons.location_on, title: language!.city, titleValue: getStringAsync(USER_CITY_NAME)).expand(),
                                      ],
                                    ),
                                  ),
                                  Divider(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR, thickness: 2, height: 0),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        profilePersonalInfoWidget(icon: Icons.date_range, title: language!.dateOfBirth, titleValue: getStringAsync(USER_DATE_OF_BIRTH)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(icon: Icons.person, title: language!.gender, titleValue: getStringAsync(USER_GENDER)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(icon: Icons.notes, title: language!.description, titleValue: getStringAsync(USER_DETAILS)).expand(),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ).paddingOnly(left: 30, right: 30),
                      30.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(language!.socialInformation, style: boldTextStyle()).expand(),
                              OnHover(builder: (isHovered) {
                                return elevationButtonWithIcon(
                                  isHovered: isHovered,
                                  toolTipMessage: language!.socialInfo,
                                  icon: Icons.edit,
                                  title: language!.socialInfo,
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        content: EditProfileDialog(isSocial: true),
                                      ),
                                    );
                                    setState(() {});
                                  },
                                );
                              }),
                            ],
                          ),
                          16.height,
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR, width: 2),
                                borderRadius: BorderRadius.circular(COMMON_BUTTON_BORDER_RADIUS),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        profilePersonalInfoWidget(isSocial: true, imageUrl: 'images/linkedin.png', title: language!.linkedIn, titleValue: getStringAsync(LINKDIN_URL)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(isSocial: true, imageUrl: 'images/github.png', title: language!.github, titleValue: getStringAsync(GITHUB_URL)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(isSocial: true, imageUrl: 'images/twitter.png', title: language!.twitter, titleValue: getStringAsync(TWITTER_URL)).expand(),
                                      ],
                                    ),
                                  ),
                                  Divider(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR, thickness: 2, height: 0),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        profilePersonalInfoWidget(isSocial: true, imageUrl: 'images/facebook.png', title: language!.faceBook, titleValue: getStringAsync(FACEBOOK_URL)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(isSocial: true, imageUrl: 'images/pinterest.png', title: language!.pinterest, titleValue: getStringAsync(PINTEREST_URL)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(isSocial: true, imageUrl: 'images/dribbble.png', title: language!.dribbble, titleValue: getStringAsync(DRIBBBLE_URL)).expand(),
                                      ],
                                    ),
                                  ),
                                  Divider(color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR, thickness: 2, height: 0),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        profilePersonalInfoWidget(isSocial: true, imageUrl: 'images/uplabs.jpeg', title: language!.uplabs, titleValue: getStringAsync(UPLABS_URL)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(isSocial: true, imageUrl: 'images/instagram.png', title: language!.instagram, titleValue: getStringAsync(INSTAGRAM_URL)).expand(),
                                        VerticalDivider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                                        profilePersonalInfoWidget(isSocial: true, imageUrl: 'images/stackoverflow.png', title: language!.stackOverFlow, titleValue: getStringAsync(STACK_OVERFLOW_URL)).expand(),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ).paddingOnly(left: 30, right: 30),
                      30.height,
                    ],
                  ),
                )
              ],
            ),
          ),
          Observer(builder: (context) => loadingAnimation().visible(appStore.isLoading)).center(),
        ],
      ),
    );
  }
}
