import 'package:flutter/material.dart';
import 'package:rurallife_flutter/components/common/bottom_button.dart';
import 'package:rurallife_flutter/components/common/custom_text_field.dart';

class StepFirst extends StatefulWidget {
  final Function next;

  const StepFirst({
    Key? key,
    required this.next,
  }) : super(key: key);

  @override
  _StepFirstState createState() => _StepFirstState();
}

class _StepFirstState extends State<StepFirst> {
  String _name = '';
  String _birth = '';
  String _phone = '';
  bool _disableButton = true;

  void _setDisableButton() {
    setState(() {
      _disableButton = _name == '' || _birth == '' || _phone == '';
    });
  }

  void _setName(String name) {
    setState(() {
      _name = name;
    });
    _setDisableButton();
  }

  void _setBirth(String birth) {
    setState(() {
      _birth = birth;
    });
    _setDisableButton();
  }

  void _setPhone(String phone) {
    setState(() {
      _phone = phone;
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
              '????????? ???????????????',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 5),
            Text(
              '???????????????.',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 10),
            Text(
              '????????? ??????????????? ???????????? ????????? ???????????????.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 27),
            CustomTextField(
              model: _setName,
              labelText: '??????',
              hintText: '????????? ??????????????????.',
            ),
            SizedBox(height: 13),
            CustomTextField(
              model: _setBirth,
              labelText: '????????????',
              hintText: '???????????? 6?????? ??????????????????',
            ),
            SizedBox(height: 13),
            CustomTextField(
              model: _setPhone,
              labelText: '???????????????',
              hintText: "'-'?????? ??????????????????",
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
