import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/index.dart';

class Mock {
  Future<List<Volunteer>> getVolunteer() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final dataString = await _loadAsset('assets/mock/volunteer/volunteer.json');

    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['recipes'] != null) {
      final recipes = <Volunteer>[];
      json['recipes'].forEach((v) {
        recipes.add(Volunteer.fromJson(v));
      });
      return recipes;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
