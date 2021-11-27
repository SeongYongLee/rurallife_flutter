import 'package:flutter/material.dart';
import 'package:rurallife_flutter/components/home/volunteer_tile.dart';
import 'package:rurallife_flutter/models/index.dart';

class VolunteerListView extends StatelessWidget {
  final List<Town> volunteerLists;

  const VolunteerListView({
    Key? key,
    required this.volunteerLists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: true,
      scrollDirection: Axis.vertical,
      itemCount: volunteerLists.length,
      itemBuilder: (context, index) {
        final volunteer = volunteerLists[index];
        return TownTile(town: volunteer);
      },
    );
  }
}
