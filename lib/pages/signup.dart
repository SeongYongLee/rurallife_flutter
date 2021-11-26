import 'package:flutter/material.dart';
import 'package:rurallife_flutter/components/signup_button.dart';
import 'package:rurallife_flutter/components/signup_text_field.dart';
import 'package:rurallife_flutter/router/index.dart';

class Signup extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.signup,
      key: ValueKey(Routes.signup),
      child: const Signup(),
    );
  }

  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _name = '';
  String _birth = '';
  String _phone = '';
  bool _disableButton = true;

  void _setDisableButton() {
    setState(() {
      _disableButton = _name == '' || _birth == '' || _phone == '';
    });
    print(_disableButton);
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
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
                  child: Text('건너뛰기'),
                )
              ],
            ),
            Text(
              '이름과 생년월일을',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '알려주세요.',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '이름과 생년월일은 봉사시간 발급에 사용됩니다.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SignupTextField(
                model: _setName, labelText: '이름', hintText: '이름을 입력해주세요.'),
            SignupTextField(
                model: _setBirth,
                labelText: '생년월일',
                hintText: '생년월일 6자를 입력해주세요'),
            SignupTextField(
                model: _setPhone, labelText: '휴대폰번호', hintText: "'-'없이 입력해주세요"),
            SignupButton(
              disableButton: _disableButton,
            ),
          ],
        ),
      ),
    );
  }
}
