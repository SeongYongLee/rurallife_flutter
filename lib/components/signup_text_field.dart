import 'package:flutter/material.dart';

class SignupTextField extends StatefulWidget {
  final Function model;
  final String labelText;
  final String hintText;

  const SignupTextField({
    Key? key,
    required this.model,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  @override
  _SignupTextFieldState createState() => _SignupTextFieldState();
}

class _SignupTextFieldState extends State<SignupTextField> {
  FocusNode _textFieldFocus = FocusNode();
  Color _color = Color(0xFFf7f8f9);

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      setState(() {
        _color = _textFieldFocus.hasFocus ? Colors.white : Color(0xFFf7f8f9);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: _color,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(14),
        ),
        labelText: widget.labelText,
        hintText: widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFf66e22)),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      focusNode: _textFieldFocus,
      onChanged: (text) {
        // 현재 텍스트필드의 텍스트를 출력
        widget.model(text);
      },
    );
  }
}
