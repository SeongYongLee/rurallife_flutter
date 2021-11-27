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
            return VolunteerListView(volunteerLists: snapshot.data ?? []);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            label: '발견',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: '검색',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: '예약',
            icon: Icon(Icons.airplane_ticket),
          ),
          BottomNavigationBarItem(
            label: '마이',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
