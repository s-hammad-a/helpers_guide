import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  PageController controller = PageController();
  int currentPage = 0;

  void jumpToPage(int page) {
    controller.jumpToPage(page);
    currentPage = page;
    notifyListeners();
  }
}