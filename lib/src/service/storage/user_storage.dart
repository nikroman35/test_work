import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserStorage {
  late Box _box;

  Future openBox() async {
    _box = await Hive.openBox('localStorage');
  }

  String? get userName => _box.get("name");
  set userName(String? name) => _box.put("name", name);
}