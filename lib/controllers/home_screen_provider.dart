import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helperguide/modules/activitiy.dart';

class HomeScreenProvider extends ChangeNotifier {
  PageController controller = PageController();
  int currentPage = 0;
  List<Activity> activities = [];
  final DatabaseReference activitiesRef = FirebaseDatabase.instance.reference().child('activities/');

  void jumpToPage(int page) {
    controller.jumpToPage(page);
    currentPage = page;
    notifyListeners();
  }
  Future<void> getFromDatabase() async {
    Query query = activitiesRef.limitToFirst(5);
    query.onChildAdded.listen((event) {
      activities.add(Activity.fromJson(event.snapshot.value as Map));
    });
  }
}