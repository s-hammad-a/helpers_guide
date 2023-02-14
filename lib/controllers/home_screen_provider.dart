import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helperguide/modules/activitiy.dart';

class HomeScreenProvider extends ChangeNotifier {
  PageController controller = PageController();
  int currentPage = 0;
  ScrollController scrollController = ScrollController();
  List<Activity> activities = [];
  final DatabaseReference activitiesRef = FirebaseDatabase.instance.reference().child('activities');
  DateTime current = DateTime.now();
  FocusNode focusNode = FocusNode();
  var months = [
    " ",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  void jumpToPage(int page) {
    controller.jumpToPage(page);
    currentPage = page;
    if(currentPage == 1) {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() {
        scrollController.animateTo(current.day*60, duration: const Duration(seconds: 1), curve: Curves.linear);
      });
    }
    notifyListeners();
  }
  Future<void> getFromDatabase() async {
    activities = [];
    print("eeeeeee");
    Query query = activitiesRef;
    query.once().then((value) {
      for (var element in value.snapshot.children) {
        activities.add(Activity.fromJson(element.value as Map));
      }
    });
  }
  int getNumberOfDays() {
    if(current.month == 1 || current.month == 3 || current.month == 5 || current.month == 7 || current.month == 8 || current.month == 10 || current.month == 12) {
      return 31;
    }
    else if(current.month == 2) {
      return 28;
    }
    else {
      return 30;
    }
  }
  void setCurrentDate(DateTime value) {
    current = value;
    Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      // focusNode.requestFocus();
      scrollController.animateTo((current.day*65) - 195, duration: const Duration(seconds: 1), curve: Curves.linear);
    });
    notifyListeners();
  }
  void setChangeDate(int day) {
    current = DateTime(current.year, current.month, day);
    notifyListeners();
    Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      scrollController.animateTo((current.day*65) - 195, duration: const Duration(seconds: 1), curve: Curves.linear);
    });
    notifyListeners();
  }
}