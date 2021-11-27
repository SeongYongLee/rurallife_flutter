import 'package:flutter/material.dart';
import 'package:rurallife_flutter/api/mock.dart';
import 'package:rurallife_flutter/models/volunteer.dart';
import 'package:rurallife_flutter/router/index.dart';

class Home extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.home,
      key: ValueKey(Routes.home),
      child: const Home(),
    );
  }

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final mock = Mock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: mock.getVolunteer(),
        builder: (context, AsyncSnapshot<List<Volunteer>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text('done');
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
