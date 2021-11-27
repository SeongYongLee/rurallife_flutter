import 'package:flutter/material.dart';
import 'package:rurallife_flutter/components/home/town_tile.dart';
import 'package:rurallife_flutter/models/index.dart';

class TownListView extends StatelessWidget {
  final List<Town> townLists;

  const TownListView({
    Key? key,
    required this.townLists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: true,
      scrollDirection: Axis.vertical,
      itemCount: townLists.length,
      itemBuilder: (context, index) {
        final volunteer = townLists[index];
        return TownTile(town: volunteer);
      },
    );
  }
}
