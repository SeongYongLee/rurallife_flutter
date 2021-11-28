import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rurallife_flutter/components/common/bottom_button.dart';
import 'package:rurallife_flutter/models/index.dart';
import 'package:rurallife_flutter/state/app.dart';
import 'package:share/share.dart';

class TownDetailListView extends StatefulWidget {
  final Town town;

  const TownDetailListView({
    Key? key,
    required this.town,
  }) : super(key: key);

  @override
  _TownDetailListViewState createState() => _TownDetailListViewState();
}

class _TownDetailListViewState extends State<TownDetailListView> {
  int _person = 1;
  List _selectActivityInfos = [];
  final _roomOptionList = {
    "internet": {
      'label': '인터넷',
      'image': 'assets/images/category/internet.png'
    },
    "parking": {'label': '주차가능', 'image': 'assets/images/category/parking.png'},
    "convenience": {
      'label': '편의점',
      'image': 'assets/images/category/convenience.png'
    },
    "pet": {'label': '강아지', 'image': 'assets/images/category/pet.png'},
  };

  void _minusPerson() {
    setState(() {
      if (_person > 1) _person--;
    });
  }

  void _plusPerson() {
    setState(() {
      _person++;
    });
  }

  void _checkActivityInfos(int index) {
    setState(() {
      _selectActivityInfos[index] = !_selectActivityInfos[index];
    });
  }

  @override
  void initState() {
    super.initState();
    _selectActivityInfos = List.filled(widget.town.activityInfos.length, false);
  }

  @override
  Widget build(BuildContext context) {
    void _backToHome() async {
      Provider.of<AppStateManager>(context, listen: false).backToHome();
    }

    void _goToReserve() async {
      Provider.of<AppStateManager>(context, listen: false).goToReserve();
    }

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.town.image_detail_url),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 41.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _backToHome();
                        },
                        child: Image.asset(
                          'assets/images/common/back_arrow_white.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Share.share(
                            '반반농활의 ${widget.town.name}을 확인해보세요!',
                          );
                        },
                        child: Image.asset(
                          'assets/images/common/share.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Wrap(
                              children: [
                                Text(
                                  widget.town.name,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tightFor(width: 88, height: 33),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(5),
                                primary: Color(0xFF67B3FA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/common/location.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '남원시',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 290,
                        child: Wrap(
                          children: [
                            Text(widget.town.description),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Opacity(
                            opacity: 0.4,
                            child: Text(
                              '필요 농활시간',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '1박',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '4시간',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFF7F8F9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/detail/person.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '인원',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _minusPerson();
                                    },
                                    child: Image.asset(
                                      'assets/images/detail/minus.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    _person.toString(),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _plusPerson();
                                    },
                                    child: Image.asset(
                                      'assets/images/detail/plus.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFF7F8F9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/detail/calendar.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '여행 일정',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('02.30 - 02.31'),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/detail/right_arrow.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        '농활목록',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '희망 봉사활동을 선택하지 않으면 랜덤 배정 됩니다.',
                        style: TextStyle(
                          color: Color(0xFF888E93),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: List.generate(
                          widget.town.activityInfos.length,
                          (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _checkActivityInfos(index);
                                    },
                                    child: Image.asset(
                                      _selectActivityInfos[index]
                                          ? 'assets/images/common/check_active.png'
                                          : 'assets/images/common/check.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    widget.town.activityInfos[index]["name"],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        '숙소위치',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Image.asset('assets/mock/town/0_map.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/detail/location_color.png',
                            height: 27,
                            width: 27,
                          ),
                          SizedBox(width: 9),
                          Text(
                            widget.town.address,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 27,
                            width: 27,
                            child: Center(
                              child: Image.asset(
                                'assets/images/detail/phone.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 9),
                          Text(
                            widget.town.contact,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        '숙소정보',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 120,
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          itemCount: widget.town.roomOptions.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 0.3,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  width: 180,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFF7F8F9),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        _roomOptionList[widget.town
                                            .roomOptions[index]]!["image"]!,
                                        width: 22,
                                        height: 22,
                                      ),
                                      SizedBox(width: 13.0),
                                      Text(
                                        _roomOptionList[widget.town
                                            .roomOptions[index]]!["label"]!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '주변 여행지',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 150,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 150,
                              child: Column(
                                children: [
                                  Image.asset(
                                      'assets/mock/town/0_travel_0.png'),
                                  SizedBox(height: 12),
                                  Text("<신생마을>'핑크뮬리'군락지 관광 명소"),
                                ],
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
                              width: 150,
                              child: Column(
                                children: [
                                  Image.asset(
                                      'assets/mock/town/0_travel_1.png'),
                                  SizedBox(height: 12),
                                  Text("<광한루원> 우리나라의 대표적인 전통누원"),
                                ],
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
                              width: 150,
                              child: Column(
                                children: [
                                  Image.asset(
                                      'assets/mock/town/0_travel_2.png'),
                                  SizedBox(height: 12),
                                  Text("향전이 주제인 광한루원 건너편 남원관광지"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            24.0,
            0.0,
            24.0,
            60.0,
          ),
          child: BottomButton(
            label: '예약하기',
            click: _goToReserve,
          ),
        ),
      ],
    );
  }
}
