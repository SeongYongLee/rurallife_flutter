import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/index.dart';

class Mock {
  Future<List<Town>> getTown() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final dataString = await _loadAsset('assets/mock/town/town.json');

    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['towns'] != null) {
      final towns = <Town>[];
      json['towns'].forEach((v) {
        towns.add(Town.fromJson(v));
      });
      return towns;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
