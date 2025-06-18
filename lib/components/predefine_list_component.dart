import 'package:flutter_viz/model/pre_define_component_model.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class PredefineListComponent extends StatefulWidget {
  @override
  _PredefineListComponentState createState() => _PredefineListComponentState();
}

class _PredefineListComponentState extends State<PredefineListComponent> {
  List<PreDefineComponentModel> _preDefineSingInButtonWidget = [];
  List<PreDefineComponentModel> _stylizedLayoutWidget = [];
  List<PreDefineComponentModel> _formWidget = [];

  bool isClick = false;

  String selectedText = "";

  int selectedIndex = 0;
  int _crossAxisCount = 2;

  double _crossAxisSpacing = 4;
  double _mainAxisSpacing = 4;
  double _childAspectRatio = 0.9;

  @override
  void initState() {
    super.initState();
    _preDefineSingInButtonWidget.add(PreDefineComponentModel(title: "Google Sign In"));
    _preDefineSingInButtonWidget.add(PreDefineComponentModel(title: "FaceBook Sign In"));
    _preDefineSingInButtonWidget.add(PreDefineComponentModel(title: "Apple Sign In"));

    _stylizedLayoutWidget.add(PreDefineComponentModel(title: "Stylized Card1"));
    _stylizedLayoutWidget.add(PreDefineComponentModel(title: "Vertical List1"));
    _stylizedLayoutWidget.add(PreDefineComponentModel(title: "Horizantal List1"));
    _stylizedLayoutWidget.add(PreDefineComponentModel(title: "Profile Card"));

    _formWidget.add(PreDefineComponentModel(title: "Login"));
    _formWidget.add(PreDefineComponentModel(title: "Forgot Password"));
    _formWidget.add(PreDefineComponentModel(title: "Change Password"));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: boxDecorationWithShadow(
          spreadRadius: 0,
          blurRadius: 0,
          backgroundColor: Colors.white,
        ),
        child: Column(
          children: [
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sign In Buttons', style: boldTextStyle(size: 18)).paddingLeft(20),
              ],
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              itemCount: _preDefineSingInButtonWidget.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          _preDefineSingInButtonWidget[index].image!,
                          fit: BoxFit.fill,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Text(
                          _preDefineSingInButtonWidget[index].title!,
                          style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                crossAxisSpacing: _crossAxisSpacing,
                mainAxisSpacing: _mainAxisSpacing,
                childAspectRatio: _childAspectRatio,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Stylized Layouts', style: boldTextStyle(size: 18)).paddingLeft(20),
              ],
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              itemCount: _stylizedLayoutWidget.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          _stylizedLayoutWidget[index].image!,
                          fit: BoxFit.fill,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                        ),
                        4.height,
                        Text(
                          _stylizedLayoutWidget[index].title!,
                          style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                crossAxisSpacing: _crossAxisSpacing,
                mainAxisSpacing: _mainAxisSpacing,
                childAspectRatio: _childAspectRatio,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Form', style: boldTextStyle(size: 18)).paddingLeft(20),
              ],
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              itemCount: _formWidget.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          _formWidget[index].image!,
                          fit: BoxFit.fill,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                        ),
                        4.height,
                        Text(
                          _formWidget[index].title!,
                          style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                crossAxisSpacing: _crossAxisSpacing,
                mainAxisSpacing: _mainAxisSpacing,
                childAspectRatio: _childAspectRatio,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
