import 'package:flutter/material.dart';

class FlutterVizCreditCardView extends StatefulWidget {
  final bool? obscureCardNumber;
  final bool? obscureCVV;
  final bool? filled;
  final bool? isDense;
  final Color? fillColor;
  final double? spacing;
  final EdgeInsets? contentPadding;
  final InputBorder? inputBorder;
  final TextStyle? textStyle;

  FlutterVizCreditCardView({
    this.obscureCardNumber,
    this.obscureCVV,
    this.filled,
    this.isDense,
    this.fillColor,
    this.textStyle,
    this.spacing,
    this.contentPadding,
    this.inputBorder,
  });

  @override
  FlutterVizCreditCardViewState createState() => FlutterVizCreditCardViewState();
}

class FlutterVizCreditCardViewState extends State<FlutterVizCreditCardView> {
  @override
  void initState() {
    super.initState();
  }

  InputDecoration getInputDecoration(String lblText) {
    return InputDecoration(
      labelText: lblText,
      labelStyle: widget.textStyle,
      filled: widget.filled ?? true,
      fillColor: widget.fillColor ?? Color(0xFFf2f2f3),
      isDense: widget.isDense ?? false,
      contentPadding: widget.contentPadding ?? EdgeInsets.fromLTRB(12, 8, 12, 8),
      enabledBorder: widget.inputBorder ??
          OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9E9E9E), width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
      focusedBorder: widget.inputBorder ??
          OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9E9E9E), width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: TextEditingController(text: '4111 1111 1111 2345'),
          style: widget.textStyle,
          decoration: getInputDecoration('Card number'),
          obscureText: widget.obscureCardNumber ?? true,
        ),
        SizedBox(
          height: widget.spacing ?? 16,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: TextEditingController(text: '12/34'),
                style: widget.textStyle,
                decoration: getInputDecoration('Exp. Date'),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextField(
                controller: TextEditingController(text: '123'),
                style: widget.textStyle,
                decoration: getInputDecoration('CVV'),
                obscureText: widget.obscureCVV ?? false,
              ),
            ),
          ],
        )
      ],
    );
  }
}
