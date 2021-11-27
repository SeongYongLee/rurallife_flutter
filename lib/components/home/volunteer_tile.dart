import 'package:flutter/material.dart';
import 'package:rurallife_flutter/models/index.dart';

class VolunteerTile extends StatelessWidget {
  final Volunteer volunteer;

  const VolunteerTile({
    Key? key,
    required this.volunteer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            volunteer.imageUrl,
            fit: BoxFit.cover,
            height: 820,
            alignment: new Alignment(-1.0, -1.0),
          ),
        ),
        Positioned(
          top: 70,
          right: 25,
          child: Image.asset('assets/images/common/share.png'),
        ),
        Positioned(
          top: 400,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 195,
                  child: Wrap(
                    spacing: 10.0,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/common/location_icon.png'),
                          Text(
                            volunteer.location,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        volunteer.name,
                        style: TextStyle(
                          fontSize: 27.0,
                          color: Colors.white,
                          fontFamily: 'Cafe24Dangdanghae',
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 110,
                  width: 200,
                  child: Wrap(
                    spacing: 10.0,
                    children: List.generate(
                      volunteer.volunteerList.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            width: 95,
                            height: 36,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFffffff)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                volunteer.volunteerList[index].toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 680,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/home/down_double_arrow.png',
                  width: 32,
                  height: 23,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 157, height: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFf76e22),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      print('hi');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '농활 둘러보기',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Image.asset(
                          'assets/images/home/right_arrow.png',
                          width: 12,
                          height: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
