import 'package:flutter/material.dart';
import 'package:rurallife_flutter/api/mock.dart';
import 'package:rurallife_flutter/components/detail/index.dart';
import 'package:rurallife_flutter/models/town.dart';
import 'package:rurallife_flutter/router/index.dart';

class Detail extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.detail,
      key: ValueKey(Routes.detail),
      child: Detail(),
    );
  }

  Detail({Key? key}) : super(key: key);

  final mock = Mock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: mock.getTown(),
        builder: (context, AsyncSnapshot<List<Town>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return TownDetailListView(town: snapshot.data![0]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
