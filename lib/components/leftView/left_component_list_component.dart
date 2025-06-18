import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/category_component_list_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_viz/utils/CustomExpansion.dart' as custom;

class LeftComponentListComponent extends StatefulWidget {
  static String tag = '/LeftComponentListComponent';

  @override
  LeftComponentListComponentState createState() => LeftComponentListComponentState();
}

class LeftComponentListComponentState extends State<LeftComponentListComponent> {
  List<CategoryComponentData> categoryComponentList = [];

  int _crossAxisCount = 3;
  double _crossAxisSpacing = 10;
  double _mainAxisSpacing = 10;
  double _childAspectRatio = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await categoryComponentListApi();
  }

  Future<void> categoryComponentListApi() async {
    appStore.setLoading(true);

    await getCategoryComponentList().then((value) async {
      appStore.setLoading(false);
      categoryComponentList.clear();
      categoryComponentList.addAll(value.data!);
      setState(() {});
    }).catchError((e) {
      getToast(e.toString());
      appStore.setLoading(false);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationWithShadow(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withValues(alpha: 0.1),
        spreadRadius: 1,
        blurRadius: 6,
        offset: Offset(6, 6), // changes position of shadow
      ),
      child: Observer(
        builder: (_) {
          return Stack(
            children: [
              categoryComponentList.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: categoryComponentList.map((CategoryComponentData categoryComponentItem) {
                          return categoryComponentItem.component!.isNotEmpty
                              ? custom.ExpansionTile(
                                  title: Text(
                                    categoryComponentItem.name!,
                                    style: TextStyle(color: btnBackgroundColor, fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  iconColor: btnBackgroundColor,
                                  initiallyExpanded: true,
                                  headerBackgroundColor: leftExpansionTileBackgroundColor,
                                  children: <Widget>[
                                    GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.all(10),
                                      itemCount: categoryComponentItem.component!.length,
                                      itemBuilder: (context, index) {
                                        ComponentData item = categoryComponentItem.component![index];
                                        return getDisplayWidget(getWidgetsIcon('widgets.svg'), item.name, isDragging: false);
                                      },
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: _crossAxisCount,
                                        crossAxisSpacing: _crossAxisSpacing,
                                        mainAxisSpacing: _mainAxisSpacing,
                                        childAspectRatio: _childAspectRatio,
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox();
                        }).toList(),
                      ),
                    )
                  : Text(language!.noDataFound, style: boldTextStyle()).visible(!appStore.isLoading).center(),
              Observer(builder: (_) => loadingAnimation().visible(appStore.isLoading)).center(),
            ],
          );
        },
      ),
    );
  }
}
