import 'package:flutter/material.dart';

class SupabaseProvider extends ChangeNotifier {
  late int _userId;

  int get userId => _userId;

  void setUserId(int uId) {
    _userId = uId;

    notifyListeners();
  }
}
