import 'package:flutter/material.dart';
import 'package:rurallife_flutter/models/discovery.dart';

class DiscoveryManager extends ChangeNotifier {
  Discovery get getUser => _user;

  Discovery _user = Discovery(
    address: '',
    people: '',
    start_date: '',
    end_date: '',
    activityInfos: [],
  );
}
