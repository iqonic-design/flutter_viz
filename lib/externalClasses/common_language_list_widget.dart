import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

enum WidgetType { DROPDOWN, LIST }

/// Use SELECTED_LANGUAGE_CODE Pref key to get selected language code
class CommonLanguageListWidget extends StatefulWidget {
  final WidgetType widgetType;
  final Widget? trailing;

  /// You can set scrollPhysics to NeverScrollableScrollPhysics if you have SingleChildScroll already.
  final ScrollPhysics? scrollPhysics;
  final void Function(LanguageDataModel?)? onLanguageChange;

  CommonLanguageListWidget({
    this.widgetType = WidgetType.DROPDOWN,
    this.onLanguageChange,
    this.scrollPhysics,
    this.trailing,
  });

  @override
  CommonLanguageListWidgetState createState() => CommonLanguageListWidgetState();
}

class CommonLanguageListWidgetState extends State<CommonLanguageListWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget build(BuildContext context) {
    Widget _buildImageWidget(String imagePath) {
      if (imagePath.startsWith('http')) {
        return Image.network(imagePath, width: 24);
      } else {
        return Image.asset(imagePath, width: 24);
      }
    }

    if (widget.widgetType == WidgetType.LIST) {
      return Container(
        child: ListView.builder(
          itemBuilder: (_, index) {
            LanguageDataModel data = localeLanguageList[index];
            return SettingItemWidget(
              title: data.name.validate(),
              subTitle: data.subTitle,
              leading: (data.flag != null) ? _buildImageWidget(data.flag!) : null,
              trailing: Container(
                child: widget.trailing ??
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: boxDecorationDefault(shape: BoxShape.circle),
                      child: Icon(Icons.check, size: 15, color: Colors.black),
                    ),
              ).visible(getStringAsync(SELECTED_LANGUAGE_CODE) == data.languageCode.validate()),
              onTap: () async {
                await setValue(SELECTED_LANGUAGE_CODE, data.languageCode);

                selectedLanguageDataModel = data;

                setState(() {});
                widget.onLanguageChange?.call(data);
              },
            );
          },
          shrinkWrap: true,
          physics: widget.scrollPhysics,
          itemCount: localeLanguageList.length,
        ),
      );
    } else {
      return Container(
        height: 35,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(COMMON_BUTTON_BORDER_RADIUS)),
            border: Border.all(
              color: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : COMMON_BORDER_COLOR,
              width: 1,
            ),
            color: appStore.isDarkMode ? Colors.transparent : Colors.white),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<LanguageDataModel>(
            value: selectedLanguageDataModel,
            dropdownColor: appStore.isDarkMode ? darkModeSecondaryBackgroundDark : dropDownColor,
            elevation: defaultElevation,
            isDense: true,
            onChanged: (LanguageDataModel? data) async {
              selectedLanguageDataModel = data;

              await setValue(SELECTED_LANGUAGE_CODE, data!.languageCode.validate());

              setState(() {});
              widget.onLanguageChange?.call(data);
            },
            items: localeLanguageList.map((data) {
              return DropdownMenuItem<LanguageDataModel>(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (data.flag != null) _buildImageWidget(data.flag!),
                    8.width,
                    Text(data.name.validate(), style: primaryTextStyle()),
                  ],
                ),
                value: data,
              );
            }).toList(),
          ),
        ),
      );
    }
  }
}
