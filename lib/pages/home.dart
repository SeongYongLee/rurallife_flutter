import 'package:flutter/material.dart';
import 'package:rurallife_flutter/api/mock.dart';
import 'package:rurallife_flutter/components/home/index.dart';
import 'package:rurallife_flutter/models/town.dart';
import 'package:rurallife_flutter/router/index.dart';

class Home extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.home,
      key: ValueKey(Routes.home),
      child: Home(),
    );
  }

  Home({Key? key}) : super(key: key);

  final mock = Mock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: mock.getTown(),
        builder: (context, AsyncSnapshot<List<Town>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return TownListView(townLists: snapshot.data ?? []);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFFF66E22),
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(
            label: '발견',
            icon: Image.asset(
              'assets/images/bottom_navigation_bar/tab_0_active.png',
              width: 18,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: '농활찾기',
            icon: Image.asset(
              'assets/images/bottom_navigation_bar/tab_1.png',
              width: 18,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: '예약',
            icon: Image.asset(
              'assets/images/bottom_navigation_bar/tab_2.png',
              width: 18,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: '마이',
            icon: Image.asset(
              'assets/images/bottom_navigation_bar/tab_3.png',
              width: 18,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
