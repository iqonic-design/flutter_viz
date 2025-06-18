import 'dart:convert';
import 'dart:ui';

import 'package:flutter_viz/adminDashboard/model/template_list_model.dart';
import 'package:flutter_viz/model/add_screen_model.dart';
import 'package:flutter_viz/model/category_template_list_model.dart';
import 'package:flutter_viz/model/screen_list_response.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/screen_json_parser_class.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class AddPageDialog extends StatefulWidget {
  static String tag = '/AddTemplateDialog';

  @override
  AddPageDialogState createState() => AddPageDialogState();
}

class AddPageDialogState extends State<AddPageDialog> with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  TabController? _tabController;
  TextEditingController pageNameController = TextEditingController();

  List<CategoryTemplateData> categoryTemplateList = [];

  @override
  void initState() {
    super.initState();
    init();
    trackScreenView(PRE_BUILD_SCREEN);
  }

  Future<void> init() async {
    await categoryTemplateListApi();
    _tabController = TabController(length: categoryTemplateList.length + 1, vsync: this);
  }

  Future<void> categoryTemplateListApi() async {
    appStore.setLoading(true);

    await getCategoryTemplateList().then((value) async {
      appStore.setLoading(false);
      categoryTemplateList.clear();
      categoryTemplateList.addAll(value.data!);
      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  /// add Screen api
  Future<void> addScreenApi({String? rootScreenData}) async {
    if (formKey.currentState!.validate()) {
      hideKeyboard(context);
      formKey.currentState!.save();
      appStore.setLoading(true);
      Map req;
      if (rootScreenData != null) {
        req = {
          'user_id': getIntAsync(USER_ID),
          'name': pageNameController.text,
          'data': rootScreenData,
          'project_id': appStore.projectId,
        };
      } else {
        req = {
          'user_id': getIntAsync(USER_ID),
          'name': pageNameController.text,
          'project_id': appStore.projectId,
        };
      }

      await addScreen(req).then((value) async {
        appStore.screenList.add(ScreenListData(
          id: value.data!.id,
          name: req['name'],
          screenJsonData: req['data'],
        ));

        /// Showing added screen data
        appStore.selectedDropdownScreen = appStore.screenList[appStore.screenList.length - 1];
        appStore.setScreenDetails(appStore.screenList[appStore.screenList.length - 1]);
        applyScreenJsonToView(appStore.screenList[appStore.screenList.length - 1].screenJsonData);
        LiveStream().emit(updateScreenList);
        if (rootScreenData != null) {
          Future.delayed(Duration(seconds: 1), () async {
            await updateScreenImageApi(value);
          });
        } else {
          appStore.setLoading(false);
          finish(context);
          getToast(value.message!);
        }
      }).catchError((e) {
        appStore.setLoading(false);
        finish(context);
        getToast(e.toString());
      });
    }
  }

  updateScreenImageApi(AddScreenModel screenModel) async {
    String? screenImage;
    screenshotController.capture(delay: Duration(milliseconds: 10)).then((capturedImage) async {
      screenImage = base64.encode(capturedImage!);
      Map req = {
        'user_id': (IS_TESTING_MODE) ? DUMMY_USER_ID : getIntAsync(USER_ID),
        'id': screenModel.data!.id,
        'screen_image': screenImage,
      };
      await addScreen(req).then((value) {
        appStore.setLoading(false);
        finish(context);
        appStore.updateScreenImage(screenImage, appStore.selectedScreenId);
        getToast(screenModel.message!);
      }).catchError((e) {
        appStore.setLoading(false);
        getToast(e.toString());
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1070,
      height: 800,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!appStore.isLoading)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(language!.createScreen, style: boldTextStyle(size: 22)),
                          CloseButton(),
                        ],
                      ),
                      8.height,
                      Text(language!.enterScreenText, style: secondaryTextStyle()),
                      16.height,
                      AppTextField(
                        controller: pageNameController,
                        textFieldType: TextFieldType.NAME,
                        decoration: commonInputDecoration(hintName: "Screen Name"),
                        textStyle: primaryTextStyle(),
                        autoFocus: false,
                        maxLines: 1,
                        maxLength: 15,
                        validator: (String? value) {
                          if (value!.isEmpty) return errorThisFieldRequired;
                          return null;
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                        ],
                      ),
                      16.height,
                      Divider(thickness: 2, color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR),
                      16.height,
                    ],
                  ),
                if (_tabController != null)
                  TabBar(
                    controller: _tabController,
                    indicatorColor: btnBackgroundColor,
                    labelColor: btnBackgroundColor,
                    unselectedLabelColor: appStore.isDarkMode ? darkModeSubTextColor : Colors.black,
                    isScrollable: true,
                    labelPadding: EdgeInsets.only(left: 30, right: 30),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: primaryTextStyle(),
                    tabs: List.generate(categoryTemplateList.length + 1, (index) {
                      if (index == 0) {
                        return Tab(text: 'Blank Page');
                      }
                      CategoryTemplateData categoryTemplateData = categoryTemplateList[index - 1];
                      return Tab(text: categoryTemplateData.name.validate());
                    }).toList(),
                  ),
                30.height,
                if (_tabController != null)
                  TabBarView(
                    controller: _tabController,
                    children: List.generate(categoryTemplateList.length + 1, (index) {
                      if (index == 0) {
                        return SingleChildScrollView(
                          child: SizedBox(
                            width: screenPreviewWidth,
                            child: Column(
                              children: [
                                Text("Blank App", style: secondaryTextStyle(size: 16)),
                                8.height,
                                SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    height: screenPreviewHeight,
                                    width: screenPreviewWidth,
                                    alignment: Alignment.center,
                                    decoration: boxDecorationWithRoundedCorners(
                                      border: Border.all(color: appStore.isDarkMode ? Colors.transparent : COMMON_BORDER_COLOR),
                                      borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                      backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Icon(Icons.add, color: context.iconColor),
                                          decoration: boxDecorationWithRoundedCorners(
                                            boxShape: BoxShape.circle,
                                            backgroundColor: context.scaffoldBackgroundColor,
                                          ),
                                          height: 50,
                                          width: 50,
                                        ),
                                        30.height,
                                        dialogPrimaryColorButton(
                                          text: language!.createNew,
                                          onTap: () async {
                                            addScreenApi();
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        CategoryTemplateData categoryTemplateData = categoryTemplateList[index - 1];
                        List<TemplateData> mTemplateList = categoryTemplateData.template!;
                        return SingleChildScrollView(
                          child: Container(
                            width: context.width(),
                            alignment: Alignment.topCenter,
                            child: Wrap(
                              spacing: 30,
                              runSpacing: 30,
                              children: mTemplateList.map((templateData) {
                                return Column(
                                  children: [
                                    Text("${templateData.name}", style: secondaryTextStyle(size: 16)),
                                    8.height,
                                    GestureDetector(
                                      child: AnimatedContainer(
                                        duration: commonAnimationDuration,
                                        child: SingleChildScrollView(
                                          child: Container(
                                            width: screenPreviewWidth,
                                            height: screenPreviewHeight,
                                            decoration: boxDecorationWithRoundedCorners(
                                              borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                              backgroundColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : centerBackgroundColor,
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: screenPreviewHeight,
                                                  width: screenPreviewWidth,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: appStore.isDarkMode ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
                                                      width: 1,
                                                    ),
                                                    borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                                  ),
                                                  child: templateData.templateImage != null
                                                      ? Image.memory(
                                                          base64Decode(templateData.templateImage!),
                                                          width: screenPreviewWidth,
                                                          height: screenPreviewHeight,
                                                          fit: BoxFit.fill,
                                                        ).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS)
                                                      : Container(
                                                          width: screenPreviewWidth,
                                                          height: screenPreviewHeight,
                                                          color: Colors.white,
                                                        ).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS),
                                                ),
                                                HoverWidget(
                                                  builder: (context, isHovering) {
                                                    return isHovering
                                                        ? BackdropFilter(
                                                            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                                                            child: Container(
                                                              alignment: Alignment.center,
                                                              color: Colors.black.withValues(alpha: 0.5),
                                                              width: screenPreviewWidth,
                                                              height: screenPreviewHeight,
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  Text(
                                                                    templateData.name.validate(),
                                                                    style: primaryTextStyle(color: Colors.white, size: 18),
                                                                  ),
                                                                  8.height,
                                                                  Container(
                                                                    height: 30,
                                                                    width: 140,
                                                                    padding: EdgeInsets.all(0),
                                                                    alignment: Alignment.center,
                                                                    decoration: boxDecorationWithRoundedCorners(
                                                                      borderRadius: radius(8),
                                                                      backgroundColor: btnBackgroundColor,
                                                                    ),
                                                                    child: Text(
                                                                      language!.tapToUseTemplate,
                                                                      style: secondaryTextStyle(color: Colors.white, size: 12),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        : Container(
                                                            width: screenPreviewWidth,
                                                            height: screenPreviewHeight,
                                                            decoration: boxDecorationWithRoundedCorners(
                                                              border: Border.all(
                                                                color: appStore.isDarkMode ? Colors.transparent : COMMON_BORDER_COLOR,
                                                              ),
                                                              borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
                                                              backgroundColor: Colors.transparent,
                                                            ),
                                                          );
                                                  },
                                                )
                                              ],
                                            ),
                                          ).cornerRadiusWithClipRRect(COMMON_CARD_BORDER_RADIUS),
                                        ),
                                      ),
                                      onTap: () {
                                        trackUserEvent("$USER_PRE_BUILD_TEMPLATES (${templateData.name})");
                                        addScreenApi(rootScreenData: templateData.screenData);
                                      },
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      }
                    }).toList(),
                  ).expand(),
              ],
            ),
          ),
          Observer(builder: (context) => loadingAnimation().visible(appStore.isLoading).center()),
        ],
      ),
    );
  }
}
