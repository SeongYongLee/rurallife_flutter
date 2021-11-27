import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rurallife_flutter/models/index.dart';
import 'package:rurallife_flutter/state/app.dart';

class TownDetailListView extends StatelessWidget {
  final Town town;

  const TownDetailListView({
    Key? key,
    required this.town,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _backToHome() async {
      Provider.of<AppStateManager>(context, listen: false).backToHome();
    }

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(town.image_detail_url),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _backToHome();
                  },
                  child:
                      Image.asset('assets/images/common/back_arrow_white.png'),
                ),
                Image.asset('assets/images/common/share.png'),
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
            child: Row(
              children: [
                Text('남원에서 농활로 벽화그리기'),
              ],
            ),
          ),
        ),
        // Image.asset(
        //   town.image_url,
        //   fit: BoxFit.cover,
        //   height: 820,
        //   alignment: new Alignment(-1.0, -1.0),
        // ),
        // Positioned(
        //   top: 70,
        //   width: MediaQuery.of(context).size.width,
        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Image.asset('assets/images/common/back_arrow_white.png'),
        //         Image.asset('assets/images/common/share.png'),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
