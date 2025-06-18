import 'package:flutter_viz/model/city_model.dart';
import 'package:flutter_viz/model/country_model.dart';
import 'package:flutter_viz/model/state_model.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:flutter_viz/utils/AppFunctions.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class EditProfileDialog extends StatefulWidget {
  static String tag = '/EditProfileDialog';

  final bool isSocial;

  EditProfileDialog({this.isSocial = false});

  @override
  EditProfileDialogState createState() => EditProfileDialogState();
}

class EditProfileDialogState extends State<EditProfileDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  TextEditingController twitterController = TextEditingController();
  TextEditingController linkdinController = TextEditingController();
  TextEditingController stackOverFlowController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController githubController = TextEditingController();
  TextEditingController uplabsController = TextEditingController();
  TextEditingController dribbbleController = TextEditingController();
  TextEditingController pintrestController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  List<CountryModel> countryList = [];
  List<StateModel> stateList = [];
  List<CityModel> cityList = [];
  List<String> genderList = [language!.male, language!.female, language!.other];

  CountryModel? selectedCountry;
  StateModel? selectedState;
  CityModel? selectedCity;

  int? countryId = 0;
  int? stateId = 0;
  int? cityId = 0;

  String? _selectedGender;
  DateTime date = DateTime.now();

  pickDate() async {
    DateTime? time = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: btnBackgroundColor,
              onPrimary: Colors.white,
              surface: btnBackgroundColor,
              onSurface: appStore.isDarkMode ? darkModeSubTextColor : Colors.black,
            ),
            dialogTheme: DialogThemeData(backgroundColor: context.cardColor),
          ),
          child: child!,
        );
      },
    );

    if (time != null) {
      setState(() {
        date = time;
        dobController.text = DateFormat("yyyy-MM-dd").format(date);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _selectedGender = getStringAsync(USER_GENDER).isEmpty ? genderList[0] : getStringAsync(USER_GENDER);
    countryId = getIntAsync(USER_COUNTRY_ID).validate();
    stateId = getIntAsync(USER_STATE_ID).validate();
    cityId = getIntAsync(USER_CITY_ID).validate();

    emailController.text = getStringAsync(USER_EMAIL);
    nameController.text = getStringAsync(USER_NAME);

    phoneNumberController.text = getStringAsync(USER_PHONE_NUMBER).validate();
    designationController.text = getStringAsync(USER_DESIGNATION).validate();
    dobController.text = getStringAsync(USER_DATE_OF_BIRTH).validate();
    descriptionController.text = getStringAsync(USER_DETAILS).validate();
    designationController.text = getStringAsync(USER_DESIGNATION).validate();
    twitterController.text = getStringAsync(TWITTER_URL).validate();
    facebookController.text = getStringAsync(FACEBOOK_URL).validate();
    instagramController.text = getStringAsync(INSTAGRAM_URL).validate();
    linkdinController.text = getStringAsync(LINKDIN_URL).validate();
    uplabsController.text = getStringAsync(UPLABS_URL).validate();
    dribbbleController.text = getStringAsync(DRIBBBLE_URL).validate();
    stackOverFlowController.text = getStringAsync(STACK_OVERFLOW_URL).validate();
    pintrestController.text = getStringAsync(PINTEREST_URL).validate();
    githubController.text = getStringAsync(GITHUB_URL).validate();

    if (!widget.isSocial) {
      if (getIntAsync(USER_COUNTRY_ID) != 0) {
        await getCountry();
        await getStates(getIntAsync(USER_COUNTRY_ID));
        if (getIntAsync(USER_STATE_ID) != 0) {
          await getCity(getIntAsync(USER_STATE_ID));
        }
        setState(() {});
      } else {
        await getCountry();
      }
    }
  }

  /// edit profile api call
  Future save() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      appStore.setLoading(true);
      Map req = {
        'email': emailController.text,
        'name': nameController.text,
        'user_id': getIntAsync(USER_ID),
        'description': descriptionController.text,
        'dob': dobController.text,
        'gender': _selectedGender,
        'country_id': countryId,
        'state_id': stateId,
        'city_id': cityId,
        'contact_number': phoneNumberController.text,
        'designation': designationController.text,
        'linkdin_url': linkdinController.text,
        'twitter_url': twitterController.text,
        'stackoverflow_url': stackOverFlowController.text,
        'facebook_url': facebookController.text,
        'dribbble_url': dribbbleController.text,
        'pinterest_url': pintrestController.text,
        'github_url': githubController.text,
        'uplabs_url': uplabsController.text,
        'instagram_url': instagramController.text,
      };
      await updateProfile(req).then((value) {
        appStore.setLoading(false);

        setValue(USER_NAME, value.data!.name.validate());
        setValue(USER_COUNTRY_ID, value.data!.countryId.validate());
        setValue(USER_COUNTRY_NAME, value.data!.countryName.validate());
        setValue(USER_STATE_ID, value.data!.stateId.validate());
        setValue(USER_STATE_NAME, value.data!.stateName.validate());
        setValue(USER_CITY_NAME, value.data!.cityName.validate());
        setValue(USER_CITY_ID, value.data!.cityId.validate());
        setValue(USER_GENDER, value.data!.gender.validate());
        setValue(USER_DATE_OF_BIRTH, value.data!.dob.validate());
        setValue(USER_DETAILS, value.data!.description.validate());
        setValue(USER_DESIGNATION, value.data!.designation.validate());
        setValue(USER_PHONE_NUMBER, value.data!.contactNumber.validate());
        setValue(FACEBOOK_URL, value.data!.facebookUrl.validate());
        setValue(TWITTER_URL, value.data!.twitterUrl.validate());
        setValue(GITHUB_URL, value.data!.githubUrl.validate());
        setValue(LINKDIN_URL, value.data!.linkdinUrl.validate());
        setValue(STACK_OVERFLOW_URL, value.data!.stackoverflowUrl.validate());
        setValue(DRIBBBLE_URL, value.data!.dribbbleUrl.validate());
        setValue(PINTEREST_URL, value.data!.pinterestUrl.validate());
        setValue(UPLABS_URL, value.data!.uplabsUrl.validate());
        setValue(INSTAGRAM_URL, value.data!.instagramUrl.validate());

        getToast(value.message!);
        finish(context);
      }).catchError((e) {
        appStore.setLoading(false);
        getToast(e.toString());
      });
    }
  }

  ///get Country Api call
  Future<void> getCountry() async {
    await getCountryList().then((value) async {
      countryList.clear();
      countryList.addAll(value);
      setState(() {});
      value.forEach((e) {
        if (e.id == getIntAsync(USER_COUNTRY_ID)) {
          selectedCountry = e;
        }
      });
    }).catchError((e) {
      printLogData('$e');
    });
    appStore.setLoading(false);
  }

  ///get State Api call
  Future<void> getStates(int? countryId) async {
    appStore.setLoading(true);
    await getStateList({'country_id': countryId}).then((value) async {
      stateList.clear();
      stateList.addAll(value);

      value.forEach((e) {
        if (e.id == getIntAsync(USER_STATE_ID)) {
          selectedState = e;
        }
      });
      setState(() {});
    }).catchError((e) {
      printLogData('$e');
    });
    appStore.setLoading(false);
  }

  ///get City Api call
  Future<void> getCity(int? stateId) async {
    appStore.setLoading(true);

    await getCityList({'state_id': stateId}).then((value) async {
      cityList.clear();
      cityList.addAll(value);
      value.forEach((e) {
        if (e.id == getIntAsync(USER_CITY_ID)) {
          selectedCity = e;
        }
      });
    }).catchError((e) {
      printLogData('$e');
    });
    appStore.setLoading(false);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        width: context.width() * 0.6,
        child: Listener(
          onPointerDown: (_) => FocusScope.of(context).requestFocus(FocusNode()),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.isSocial ? language!.socialInformation : language!.personalInformation}',
                          style: boldTextStyle(size: 20),
                        ),
                        Align(alignment: Alignment.topRight, child: CloseButton()),
                      ],
                    ),
                    16.height,
                    Column(
                      children: [
                        Row(
                          spacing: 16,
                          children: [
                            editProfileComponentWidget(
                              title: language!.name,
                              controller: nameController,
                              textFieldType: TextFieldType.NAME,
                              textInputType: TextInputType.name,
                              onValidate: (value) {
                                return null;
                              },
                            ).expand(),
                            editProfileComponentWidget(
                              title: language!.designation,
                              controller: designationController,
                              textFieldType: TextFieldType.NAME,
                              textInputType: TextInputType.text,
                              onValidate: (value) {
                                return null;
                              },
                            ).expand(),
                            editProfileComponentWidget(
                              title: language!.contactNumber,
                              controller: phoneNumberController,
                              textFieldType: TextFieldType.PHONE,
                              textInputType: TextInputType.phone,
                              onValidate: (value) {
                                return null;
                              },
                            ).expand(),
                          ],
                        ),
                        16.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language!.selectCountry, style: primaryTextStyle(size: 12)),
                                8.height,
                                DropdownButtonFormField<CountryModel>(
                                  decoration: commonInputDecoration(),
                                  hint: Text(language!.selectedCountry, style: primaryTextStyle()),
                                  isExpanded: true,
                                  value: selectedCountry,
                                  dropdownColor: context.cardColor,
                                  items: countryList.map((CountryModel e) {
                                    return DropdownMenuItem<CountryModel>(
                                      value: e,
                                      child: Text(e.name!, style: primaryTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                                    );
                                  }).toList(),
                                  onChanged: (CountryModel? value) async {
                                    selectedCountry = value;
                                    selectedState = null;
                                    selectedCity = null;
                                    cityId = 0;
                                    stateId = 0;
                                    countryId = value!.id;
                                    getStates(value.id);
                                    setState(() {});
                                  },
                                )
                              ],
                            ).expand(),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language!.selectState, style: primaryTextStyle(size: 12)),
                                8.height,
                                DropdownButtonFormField<StateModel>(
                                  decoration: commonInputDecoration(),
                                  hint: Text(language!.selectedState, style: primaryTextStyle()),
                                  isExpanded: true,
                                  value: selectedState,
                                  dropdownColor: context.cardColor,
                                  items: stateList.map((StateModel e) {
                                    return DropdownMenuItem<StateModel>(
                                      value: e,
                                      child: Text(
                                        e.name!,
                                        style: primaryTextStyle(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (StateModel? value) async {
                                    selectedCity = null;
                                    cityId = 0;
                                    selectedState = value;
                                    stateId = value!.id;
                                    await getCity(value.id);
                                    setState(() {});
                                  },
                                ),
                              ],
                            ).expand(),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language!.selectCity, style: primaryTextStyle(size: 12)),
                                8.height,
                                DropdownButtonFormField<CityModel>(
                                  decoration: commonInputDecoration(),
                                  hint: Text(language!.selectedCity, style: primaryTextStyle()),
                                  isExpanded: true,
                                  value: selectedCity,
                                  dropdownColor: context.cardColor,
                                  items: cityList.map((CityModel e) {
                                    return DropdownMenuItem<CityModel>(
                                      value: e,
                                      child: Text(
                                        e.name!,
                                        style: primaryTextStyle(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (CityModel? value) async {
                                    selectedCity = value;
                                    cityId = value!.id;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ).expand(),
                          ],
                        ),
                        16.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            editProfileComponentWidget(
                              textFieldType: TextFieldType.OTHER,
                              title: language!.dateOfBirth,
                              controller: dobController,
                              suffixIcon: Icons.calendar_today,
                              readOnly: true,
                              onTap: (() {
                                pickDate();
                              }),
                            ).expand(),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language!.selectGender, style: primaryTextStyle(size: 12)),
                                8.height,
                                DropdownButtonFormField<String>(
                                  decoration: commonInputDecoration(),
                                  hint: Text(language!.selectedGender, style: primaryTextStyle()),
                                  isExpanded: true,
                                  value: _selectedGender,
                                  dropdownColor: context.cardColor,
                                  items: genderList.map((String e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: primaryTextStyle(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) async {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                              ],
                            ).expand(),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language!.description, style: primaryTextStyle(size: 12)),
                                8.height,
                                TextField(
                                  maxLines: 3,
                                  style: primaryTextStyle(),
                                  controller: descriptionController,
                                  decoration: commonInputDecoration(),
                                  keyboardType: TextInputType.multiline,
                                ),
                              ],
                            ).expand(),
                          ],
                        ),
                      ],
                    ).visible(!widget.isSocial),
                    Column(
                      children: [
                        Row(
                          children: [
                            editProfileComponentWidget(
                              title: language!.twitter,
                              controller: twitterController,
                              textFieldType: TextFieldType.OTHER,
                              textInputType: TextInputType.text,
                              onValidate: (value) {
                                if (!getValidUrl(value!)) {
                                  return language!.invalidUrl;
                                } else {
                                  return null;
                                }
                              },
                            ).expand(),
                            16.width,
                            editProfileComponentWidget(
                              title: language!.faceBook,
                              controller: facebookController,
                              textFieldType: TextFieldType.OTHER,
                              textInputType: TextInputType.text,
                              onValidate: (value) {
                                if (!getValidUrl(value!)) {
                                  return language!.invalidUrl;
                                } else {
                                  return null;
                                }
                              },
                            ).expand(),
                            16.width,
                            editProfileComponentWidget(
                              title: language!.instagram,
                              controller: instagramController,
                              textFieldType: TextFieldType.OTHER,
                              textInputType: TextInputType.text,
                              onValidate: (value) {
                                if (!getValidUrl(value!)) {
                                  return language!.invalidUrl;
                                } else {
                                  return null;
                                }
                              },
                            ).expand(),
                          ],
                        ),
                        16.height,
                        Row(
                          children: [
                            editProfileComponentWidget(
                              title: language!.uplabs,
                              controller: uplabsController,
                              textFieldType: TextFieldType.OTHER,
                              textInputType: TextInputType.text,
                              onValidate: (value) {
                                if (!getValidUrl(value!)) {
                                  return language!.invalidUrl;
                                } else {
                                  return null;
                                }
                              },
                            ).expand(),
                            16.width,
                            editProfileComponentWidget(
                              title: language!.dribbble,
                              controller: dribbbleController,
                              textFieldType: TextFieldType.OTHER,
                              textInputType: TextInputType.text,
                              onValidate: (value) {
                                if (!getValidUrl(value!)) {
                                  return language!.invalidUrl;
                                } else {
                                  return null;
                                }
                              },
                            ).expand(),
                            16.width,
                            editProfileComponentWidget(
                              title: language!.pinterest,
                              controller: pintrestController,
                              textFieldType: TextFieldType.OTHER,
                              textInputType: TextInputType.text,
                              onValidate: (value) {
                                if (!getValidUrl(value!)) {
                                  return language!.invalidUrl;
                                } else {
                                  return null;
                                }
                              },
                            ).expand(),
                          ],
                        ),
                        16.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            editProfileComponentWidget(
                              title: language!.gitHub,
                              controller: githubController,
                              textFieldType: TextFieldType.OTHER,
                              textInputType: TextInputType.text,
                              onValidate: (value) {
                                if (!getValidUrl(value!)) {
                                  return language!.invalidUrl;
                                } else {
                                  return null;
                                }
                              },
                            ).expand(),
                            16.width,
                            editProfileComponentWidget(
                              title: language!.linkdin,
                              controller: linkdinController,
                              textFieldType: TextFieldType.OTHER,
                              textInputType: TextInputType.text,
                              onValidate: (value) {
                                if (!getValidUrl(value!)) {
                                  return language!.invalidUrl;
                                } else {
                                  return null;
                                }
                              },
                            ).expand(),
                            16.width,
                            editProfileComponentWidget(
                              title: language!.stackOverFlow,
                              controller: stackOverFlowController,
                              textFieldType: TextFieldType.OTHER,
                              textInputType: TextInputType.text,
                              onValidate: (value) {
                                if (!getValidUrl(value!)) {
                                  return language!.invalidUrl;
                                } else {
                                  return null;
                                }
                              },
                            ).expand(),
                          ],
                        ),
                      ],
                    ).visible(widget.isSocial),
                    30.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        dialogGrayBorderButton(
                            text: language!.cancel,
                            onTap: () {
                              finish(context);
                            }),
                        16.width,
                        dialogPrimaryColorButton(
                            text: language!.save,
                            onTap: () {
                              save();
                            })
                      ],
                    ),
                  ],
                ),
              ),
              Observer(builder: (context) => loadingAnimation().visible(appStore.isLoading)).center(),
            ],
          ),
        ),
      ),
    );
  }
}
