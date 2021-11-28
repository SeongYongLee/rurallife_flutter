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
              '문자로 전송된',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 5),
            Text(
              '인증번호 6자리를 입력해주세요',
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
              labelText: '인증번호',
              hintText: '6자리 숫자',
            ),
          ],
        ),
        BottomButton(
          label: '완료',
          click: widget.next,
          disableButton: _disableButton,
        ),
      ],
    );
  }
}
