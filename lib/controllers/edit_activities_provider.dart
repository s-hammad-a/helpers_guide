import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:helperguide/modules/activitiy.dart';

class EditActivitiesProvider extends ChangeNotifier{
  List<Activity> activities = [];
  final DatabaseReference activitiesRef = FirebaseDatabase.instance.reference().child('activities');
  String tempImage = "assets/placeholder.png";

  void setImage(String image) {
    activities.add(Activity(image: image, link: ""));
    tempImage = image;
    notifyListeners();
  }

  void deleteActivity(int index) {
    activities.removeAt(index);
  }
}