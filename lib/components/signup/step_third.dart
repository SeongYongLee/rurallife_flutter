import 'package:flutter/material.dart';
import 'package:rurallife_flutter/components/common/bottom_button.dart';

class StepThird extends StatefulWidget {
  final Function next;

  const StepThird({
    Key? key,
    required this.next,
  }) : super(key: key);

  @override
  _StepThirdState createState() => _StepThirdState();
}

class _StepThirdState extends State<StepThird> {
  List _volunteerSelect = [];
  bool _disableButton = true;
  final List _volunteerType = [
    {"image": "assets/images/volunteer_prefers/0.png", "name": "교육 봉사"},
    {"image": "assets/images/volunteer_prefers/1.png", "name": "노인 배달 방문"},
    {"image": "assets/images/volunteer_prefers/2.png", "name": "요리 보조"},
    {"image": "assets/images/volunteer_prefers/3.png", "name": "농사 보조"},
    {"image": "assets/images/volunteer_prefers/4.png", "name": "행사 보조"},
    {"image": "assets/images/volunteer_prefers/5.png", "name": "다 좋아요"},
  ];

  void _setDisableButton() {
    setState(() {
      _disableButton = _volunteerSelect.length == 0;
    });
  }

  void _toggleVolunteer(int number) {
    final index = _volunteerSelect.indexOf(number);

    setState(() {
      index == -1
          ? number == _volunteerType.length - 1
              ? _volunteerSelect = [_volunteerType.length - 1]
              : _volunteerSelect.indexOf(_volunteerType.length - 1) != -1
                  ? _volunteerSelect = [number]
                  : _volunteerSelect.length == 3
                      ? null
                      : _volunteerSelect.add(number)
          : _volunteerSelect.removeAt(index);
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
                      '2',
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
              '자신있는 봉사활동을',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 5),
            Text(
              '선택해주세요',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 10),
            Text(
              '선택한 정보는 농활추천에 사용됩니다.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 27),
            Container(
              height: 350,
              child: GridView.builder(
                itemCount: _volunteerType.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 30,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _toggleVolunteer(index);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 83,
                          height: 83,
                          alignment: Alignment.center,
                          decoration: _volunteerSelect.indexOf(index) != -1
                              ? BoxDecoration(
                                  border: Border.all(color: Color(0xFFf76e22)),
                                  shape: BoxShape.circle,
                                )
                              : BoxDecoration(
                                  color: Color(0xfff7f8f9),
                                  shape: BoxShape.circle,
                                ),
                          child: Image.asset(
                            _volunteerType[index]["image"],
                            width: 38,
                            height: 38,
                          ),
                        ),
                        SizedBox(height: 13.0),
                        Text(
                          _volunteerType[index]["name"],
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                '최대3개선택',
                style: TextStyle(
                  color: Color(0xFFD0D2D4),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        BottomButton(
          label: '반반농활 시작 >>',
          click: widget.next,
          disableButton: _disableButton,
        ),
      ],
    );
  }
}
