import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rurallife_flutter/components/common/bottom_button.dart';
import 'package:rurallife_flutter/components/common/custom_text_field.dart';

class StepSecond extends StatefulWidget {
  final Function next;

  const StepSecond({
    Key? key,
    required this.next,
  }) : super(key: key);

  @override
  _StepSecondState createState() => _StepSecondState();
}

class _StepSecondState extends State<StepSecond> {
  String _number = '';
  bool _disableButton = true;
  late Timer _timer;
  int time = 59;

  void _setDisableButton() {
    setState(() {
      _disableButton = _number.length != 6;
    });
  }

  void _setNumber(String number) {
    setState(() {
      _number = number;
    });
    _setDisableButton();
  }

  @override
  void initState() {
    super.initState();
    _timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        time--;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    Text(
                      '/2',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 13),
            Text(
              '????????? ?????????',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 5),
            Text(
              '???????????? 6????????? ??????????????????',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 10),
            Text(
              '02:${time}',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF67B3FA),
              ),
            ),
            SizedBox(height: 27),
            CustomTextField(
              model: _setNumber,
              labelText: '????????????',
              hintText: '6?????? ??????',
            ),
          ],
        ),
        BottomButton(
          label: '??????',
          click: widget.next,
          disableButton: _disableButton,
        ),
      ],
    );
  }
}
