import 'package:flutter/material.dart';

class BottomButton extends StatefulWidget {
  final bool disableButton;
  final Function click;
  final String label;

  const BottomButton({
    Key? key,
    required this.click,
    required this.label,
    this.disableButton = false,
  }) : super(key: key);

  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
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
        widget.disableButton ? null : widget.click();
      },
      child: Text(widget.label),
    );
  }
}
