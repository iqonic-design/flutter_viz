import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/widget_model.dart';
import 'package:flutter_viz/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

class WrapWidgetDialog extends StatefulWidget {
  @override
  _WrapWidgetDialogState createState() => _WrapWidgetDialogState();
}

class _WrapWidgetDialogState extends State<WrapWidgetDialog> {
  List<WidgetModel> allWidgets = [];

  int _crossAxisCount = 4;
  double _crossAxisSpacing = 8;
  double _mainAxisSpacing = 8;
  double _childAspectRatio = 1;

  @override
  void initState() {
    super.initState();
    allWidgets.addAll(wrapLayoutWidgetsList);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        itemCount: allWidgets.length,
        itemBuilder: (context, index) {
          WidgetModel item = getWidgets(allWidgets[index].widgetSubType);
          return GestureDetector(
            child: item.displayWidget,
            onTap: () {
              finish(context);
              appStore.wrapWidget(item);
            },
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount,
          crossAxisSpacing: _crossAxisSpacing,
          mainAxisSpacing: _mainAxisSpacing,
          childAspectRatio: _childAspectRatio,
        ),
      ),
    );
  }
}
