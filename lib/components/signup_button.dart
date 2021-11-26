import 'package:flutter/material.dart';

class SignupButton extends StatefulWidget {
  final bool disableButton;

  const SignupButton({
    Key? key,
    this.disableButton = false,
  }) : super(key: key);

  @override
  _SignupButtonState createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(widget.disableButton ? 0xFFd0d2d4 : 0xFFf76e22),
        minimumSize: Size.fromHeight(54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        widget.disableButton ? null : print('goto next page');
      },
      child: Text('완료'),
    );
  }
}
