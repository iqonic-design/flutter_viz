import 'dart:typed_data';

class WidgetsInformationModel {
  String? image;
  String? title;
  String? description;
  String? url;

  WidgetsInformationModel({this.image, this.title, this.description, this.url});
}

class KeyBoardShortcutsModel {
  String? title;
  String? action;
  String? description;

  KeyBoardShortcutsModel({this.title, this.action, this.description});
}

class ExpandedModel {
  bool? isExpanded;
  String? message;

  ExpandedModel({this.isExpanded, this.message});
}

class MediaRequestModel {
  String? fileName;
  Uint8List? file;

  MediaRequestModel({this.fileName, this.file});
}
