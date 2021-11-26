import 'package:flutter/material.dart';
import 'package:rurallife_flutter/components/signup_text_field.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          SignupTextField(labelText: '이름', hintText: '이름을 입력해주세요.'),
          SignupTextField(labelText: '생년월일', hintText: '생년월일 6자를 입력해주세요'),
          SignupTextField(labelText: '휴대폰번호', hintText: "'-'없이 입력해주세요"),
          ElevatedButton(
            onPressed: () {
              print('hi');
            },
            child: Text('완료'),
          ),
        ],
      ),
    );
  }
}
