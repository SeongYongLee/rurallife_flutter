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
                Text(
                  '1/2',
                  style: Theme.of(context).textTheme.headline5,
                ),
                OutlinedButton(
                  onPressed: () {
                    print('건너뛰기');
                  },
                  child: Text(
                    '건너뛰기',
                  ),
                )
              ],
            ),
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
              '02:59',
              style: Theme.of(context).textTheme.subtitle1,
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
