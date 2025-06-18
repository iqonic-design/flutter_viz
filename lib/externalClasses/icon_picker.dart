library icon_picker;

import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/utils/AppColors.dart';
import 'package:flutter_viz/utils/MaterialIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A [IconPicker] that contains a [TextField].
///
/// This is a convenience widget that wraps a [TextField] widget in a
/// [IconPicker].
///
/// A [Form] ancestor is not required. The [Form] simply makes it easier to
/// save, reset, or validate multiple fields at once. To use without a [Form],
/// pass a [GlobalKey] to the constructor and use [GlobalKey.currentState] to
/// save or reset the form field.
///
/// When a [controller] is specified, its [TextEditingController.text]
/// defines the [initialValue]. If this [FormField] is part of a scrolling
/// container that lazily constructs its children, like a [ListView] or a
/// [CustomScrollView], then a [controller] should be specified.
/// The controller's lifetime should be managed by a stateful widget ancestor
/// of the scrolling container.
///
/// If a [controller] is not specified, [initialValue] can be used to give
/// the automatically generated controller an initial value.
///
/// Remember to [dispose] of the [TextEditingController] when it is no longer needed.
/// This will ensure we discard any resources used by the object.
///
/// For a documentation about the various parameters, see [TextField].
///
/// {@tool snippet}
///
/// Creates a [IconPicker] with an [InputDecoration] and validator function.
///
/// ![If the user enters valid text, the TextField appears normally without any warnings to the user](https://flutter.github.io/assets-for-api-docs/assets/material/text_form_field.png)
///
/// ![If the user enters invalid text, the error message returned from the validator function is displayed in dark red underneath the input](https://flutter.github.io/assets-for-api-docs/assets/material/text_form_field_error.png)
///
/// ```dart
/// IconPicker(
///   decoration: const InputDecoration(
///     icon: Icon(Icons.person),
///     hintText: 'What do people call you?',
///     labelText: 'Name *',
///   ),
///   onSaved: (String value) {
///     // This optional block of code can be used to run
///     // code when the user saves the form.
///   },
///   validator: (String value) {
///     return value.contains('@') ? 'Do not use the @ char.' : null;
///   },
/// )
/// ```
/// {@end-tool}
///
/// {@tool dartpad --template=stateful_widget_material}
/// This example shows how to move the focus to the next field when the user
/// presses the ENTER key.
///
/// ```dart imports
/// import 'package:flutter/services.dart';
/// ```
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Material(
///     child: Center(
///       child: Shortcuts(
///         shortcuts: <LogicalKeySet, Intent>{
///           // Pressing enter on the field will now move to the next field.
///           LogicalKeySet(LogicalKeyboardKey.enter):
///               Intent(NextFocusAction.key),
///         },
///         child: FocusTraversalGroup(
///           child: Form(
///             autovalidate: true,
///             onChanged: () {
///               Form.of(primaryFocus.context).save();
///             },
///             child: Wrap(
///               children: List<Widget>.generate(5, (int index) {
///                 return Padding(
///                   padding: const EdgeInsets.all(8.0),
///                   child: ConstrainedBox(
///                     constraints: BoxConstraints.tight(Size(200, 50)),
///                     child: IconPicker(
///                       onSaved: (String value) {
///                         print('Value for field $index saved as "$value"');
///                       },
///                     ),
///                   ),
///                 );
///               }),
///             ),
///           ),
///         ),
///       ),
///     ),
///   );
/// }
/// ```
/// {@end-tool}
///
/// See also:
///
///  * <https://material.io/design/components/text-fields.html>
///  * [TextField], which is the underlying text field without the [Form]
///    integration.
///  * [InputDecorator], which shows the labels and other visual elements that
///    surround the actual text editing widget.
///  * Learn how to use a [TextEditingController] in one of our [cookbook recipe]s.(https://flutter.dev/docs/cookbook/forms/text-field-changes#2-use-a-texteditingcontroller)
class IconPicker extends FormField<String> {
  /// Creates a [IconPicker] that contains a [TextField].
  ///
  /// When a [controller] is specified, [initialValue] must be null (the
  /// default). If [controller] is null, then a [TextEditingController]
  /// will be constructed automatically and its `text` will be initialized
  /// to [initialValue] or the empty string.
  ///
  /// For documentation about the various parameters, see the [TextField] class
  /// and [new TextField], the constructor.
  IconPicker({
    Key? key,
    this.controller,
    this.initialValue,
    this.icon,
    this.labelText,
    this.title,
    this.cancelBtn,
    this.enableSearch = true,
    this.searchHint,
    this.iconCollection = MaterialIcons.myIconCollection,
    FocusNode? focusNode,
    InputDecoration? decoration,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    bool autovalidate = false,
    bool maxLengthEnforced = true,
    int maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    this.onChanged,
    //GestureTapCallback onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool enabled = true,
    double cursorWidth = 2.0,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
  })  : assert(initialValue == null || controller == null),
        assert(maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || minLines == null,
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(
          !obscureText || maxLines == 1,
          'Obscured fields cannot be multiline.',
        ),
        assert(maxLength == null || maxLength > 0),
        super(
          key: key,
          initialValue: controller != null ? controller.text : (initialValue ?? ''),
          onSaved: onSaved,
          validator: validator,
          //autovalidate: autovalidate,
          enabled: enabled,
          builder: (FormFieldState<String> field) {
            final _IconPickerState state = field as _IconPickerState;

            final InputDecoration effectiveDecoration = (decoration ??
                InputDecoration(
                  labelText: labelText,
                  icon: state._icon ?? icon,
                  suffixIcon: Container(
                    width: 10,
                    margin: EdgeInsets.all(0),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ));
            effectiveDecoration.applyDefaults(
              Theme.of(field.context).inputDecorationTheme,
            );

            void onChangedHandler(String value) {
              if (onChanged != null) {
                onChanged(value);
              }
              field.didChange(value);
            }

            return TextField(
              controller: state._effectiveController,
              focusNode: focusNode,
              decoration: effectiveDecoration.copyWith(
                errorText: field.errorText,
              ),
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              style: style,
              strutStyle: strutStyle,
              textAlign: textAlign,
              textAlignVertical: textAlignVertical,
              textDirection: textDirection,
              textCapitalization: textCapitalization,
              autofocus: autofocus,
              toolbarOptions: toolbarOptions,
              readOnly: true,
              showCursor: showCursor,
              obscureText: obscureText,
              autocorrect: autocorrect,
              smartDashesType: smartDashesType ?? (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
              smartQuotesType: smartQuotesType ?? (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
              enableSuggestions: enableSuggestions,
              //maxLengthEnforced: maxLengthEnforced,
              maxLines: maxLines,
              minLines: minLines,
              expands: expands,
              maxLength: maxLength,
              onChanged: onChangedHandler,
              onTap: readOnly ? null : state._showIconPickerDialog,
              onEditingComplete: onEditingComplete,
              onSubmitted: onFieldSubmitted,
              inputFormatters: inputFormatters,
              enabled: enabled,
              cursorWidth: cursorWidth,
              cursorRadius: cursorRadius,
              cursorColor: cursorColor,
              scrollPadding: scrollPadding,
              scrollPhysics: scrollPhysics,
              keyboardAppearance: keyboardAppearance,
              enableInteractiveSelection: enableInteractiveSelection,
              buildCounter: buildCounter,
            );
          },
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  /// A initial icon name to display as placeholder.
  /// If the icon name exist in collection, it will set the decoration icon
  final String? initialValue;

  /// An icon to display as decoration icon in input field.
  ///
  /// This icon will be changed when a new icon is picked.
  ///
  /// The size and color of the icon is configured automatically using an
  /// [IconTheme] and therefore does not need to be explicitly given in the
  /// icon widget.
  ///
  /// The trailing edge of the icon is padded by 16dps.
  ///
  /// The decoration's container is the area which is filled if [filled] is
  /// true and bordered per the [border]. It's the area adjacent to
  /// [decoration.icon] and above the widgets that contain [helperText],
  /// [errorText], and [counterText].
  ///
  /// See [Icon], [ImageIcon].
  final Widget? icon;

  /// Text that describes the input field.
  ///
  /// When the input field is empty and unfocused, the label is displayed on
  /// top of the input field (i.e., at the same location on the screen where
  /// text may be entered in the input field). When the input field receives
  /// focus (or if the field is non-empty), the label moves above (i.e.,
  /// vertically adjacent to) the input field.
  final String? labelText;

  /// Param to set search feature. The default value is true.
  ///
  /// If enable, an icon button will be displayed on top right of the dialog
  /// window to show a text field to type the icon name to search of.
  final bool enableSearch;

  /// If search is enable on dialog window, searchHint will be displayed
  /// as placeholder in search field.
  final String? searchHint;

  /// The title of the dialog window.
  final String? title;

  /// The label of the cancel button on dialog window.
  final String? cancelBtn;

  /// A map of an icon collection.
  ///
  /// The default value is a collection of Material Icons.
  ///
  /// You can pass your own collection using a [Map<String, IconData>] value.
  /// ```dart
  /// Map<String, IconData> mIcons = {
  ///  'threesixty': Icons.threesixty,
  ///  'threed_rotation': Icons.threed_rotation,
  ///  'four_k': Icons.four_k,
  ///  'ac_unit': Icons.ac_unit,
  ///  ...
  /// }
  /// ```
  final Map<String, IconData> iconCollection;

  final ValueChanged<String>? onChanged;

  @override
  _IconPickerState createState() => _IconPickerState();
}

class _IconPickerState extends FormFieldState<String> {
  TextEditingController? _stateController;
  Widget? _icon;

  @override
  IconPicker get widget => super.widget as IconPicker;

  TextEditingController? get _effectiveController => widget.controller ?? _stateController;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _stateController = TextEditingController(text: widget.initialValue);
    }

    if (_effectiveController?.text != null && _effectiveController?.text != '') {
      widget.iconCollection.forEach((lsName, loIcon) {
        if (lsName == _effectiveController?.text) {
          setValue('{"iconName": "$lsName", "codePoint": ${loIcon.codePoint}, "fontFamily": "${loIcon.fontFamily}"}');

          if (widget.icon != null) {
            _icon = Icon(loIcon);
          }

          return;
        }
      });
    }
  }

  @override
  void didUpdateWidget(IconPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      if (oldWidget.controller != null && widget.controller == null) {
        _stateController = TextEditingController.fromValue(
          oldWidget.controller?.value,
        );
      }

      if (widget.controller != null) {
        if (oldWidget.controller == null) {
          _stateController = null;
        }
      }
    }

    if (_effectiveController?.text != null && _effectiveController?.text != '') {
      widget.iconCollection.forEach((lsName, loIcon) {
        if (lsName == _effectiveController?.text) {
          setValue(
            '{"iconName": "$lsName", "codePoint": ${loIcon.codePoint}, "fontFamily": "${loIcon.fontFamily}"}',
          );

          if (widget.icon != null) {
            _icon = Icon(loIcon);
          }

          return;
        }
      });
    }
  }

  @override
  void reset() {
    super.reset();

    setState(() {
      _effectiveController?.text = widget.initialValue ?? '';
    });
  }

  void onChangedHandler(String value) {
    widget.onChanged?.call(value);

    didChange(value);
  }

  Future<void> _showIconPickerDialog() async {
    Map<String, dynamic>? lmIconPicked = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return IconPickerDialog(
          title: widget.title,
          cancelBtn: widget.cancelBtn,
          iconCollection: widget.iconCollection,
          enableSearch: widget.enableSearch,
          searchHint: widget.searchHint,
        );
      },
    );

    if (lmIconPicked is Map) {
      if (!mounted) return;

      int? liCodePoint = lmIconPicked!['icon'].codePoint;
      String? lsFontFamily = lmIconPicked['icon'].fontFamily;
      String lsIconName = lmIconPicked['name'];
      _effectiveController?.text = lsIconName;

      String lsValue = '{"iconName": "$lsIconName", "codePoint": $liCodePoint, "fontFamily": "$lsFontFamily"}';
      onChangedHandler(lsValue);

      if (widget.icon != null) {
        setState(() {
          _icon = Icon(lmIconPicked['icon']);
        });
      }
    }
  }
}

class IconPickerDialog extends StatefulWidget {
  final String? title;
  final String? cancelBtn;
  final bool enableSearch;
  final String? searchHint;
  final Map<String, IconData>? iconCollection;

  IconPickerDialog({Key? key, this.title, this.cancelBtn, this.iconCollection, this.enableSearch = true, this.searchHint}) : super(key: key);

  @override
  _IconPickerDialogState createState() => _IconPickerDialogState();
}

class _IconPickerDialogState extends State<IconPickerDialog> {
  TextEditingController _oCtrlSearchQuery = TextEditingController();
  Map<String, IconData> _mIconsShow = <String, IconData>{};
  int _iQtIcons = -1;

  @override
  void initState() {
    super.initState();

    _oCtrlSearchQuery.addListener(_search);
    _loadIcons();
  }

  @override
  void dispose() {
    _oCtrlSearchQuery.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _titleDialog(),
      content: _content(),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(widget.cancelBtn ?? 'CANCEL', style: TextStyle(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor)),
        ),
      ],
    );
  }

  Widget _titleDialog() {
    if (!widget.enableSearch || _iQtIcons == 0) {
      return Text(
        widget.title ?? '',
        style: TextStyle(color: appStore.isDarkMode ? darkModeSubTextColor : Colors.black),
      );
    }

    return Column(
      children: <Widget>[
        Text(widget.title ?? 'Select an icon', style: TextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black)),
        TextField(
          controller: _oCtrlSearchQuery,
          style: TextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black),
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: appStore.isDarkMode ? Colors.white : Colors.black),
            hintText: widget.searchHint ?? 'Search icon',
            hintStyle: TextStyle(color: appStore.isDarkMode ? darkModeSubTextColor : Colors.grey),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkMode ? Colors.white : Colors.black)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkMode ? darkModeHighLightColor : btnBackgroundColor)),
          ),
        ),
      ],
    );
  }

  void _loadIcons() {
    setState(() {
      _mIconsShow.clear();
      _mIconsShow.addAll(widget.iconCollection ?? <String, IconData>{});
      _iQtIcons = _mIconsShow.length;
    });
  }

  Widget _content() {
    if (_iQtIcons == -1) {
      return Center(child: CircularProgressIndicator());
    } else if (_iQtIcons == 0) {
      return _showEmpty();
    }

    return _listIcons();
  }

  Widget _listIcons() {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Wrap(
          spacing: 10,
          children: _buildIconList(),
        )
      ]),
    );
  }

  List<Widget> _buildIconList() {
    List<Widget> llIcons = <Widget>[];

    _mIconsShow.forEach((lsName, loIcon) {
      Widget loIten = IconButton(
        onPressed: () {
          Navigator.pop(context, {"name": lsName, "icon": loIcon});
        },
        icon: Icon(loIcon),
      );

      llIcons.add(loIten);
    });

    return llIcons;
  }

  Widget _showEmpty() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment(0, 0),
          child: Text(language!.noDataFound, style: TextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black, fontSize: 20)),
        ),
      ],
    );
  }

  void _search() {
    String lsQuery = _oCtrlSearchQuery.text;

    if (lsQuery.length > 1) {
      lsQuery.toLowerCase();

      setState(() {
        _mIconsShow.clear();

        widget.iconCollection?.forEach((lsName, loIcon) {
          if (lsName.contains(lsQuery)) {
            _mIconsShow[lsName] = loIcon;
          }
        });

        _iQtIcons = _mIconsShow.length;
      });
    } else {
      setState(() {
        _mIconsShow.clear();
        _mIconsShow.addAll(widget.iconCollection ?? <String, IconData>{});

        _iQtIcons = _mIconsShow.length;
      });
    }
  }
}
