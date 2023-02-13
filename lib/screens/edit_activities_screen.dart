import 'package:flutter/material.dart';
import 'package:helperguide/controllers/edit_activities_provider.dart';
import 'package:helperguide/firebase/firebase_storage.dart';
import 'package:provider/provider.dart';

class EditActivities extends StatelessWidget {
  const EditActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF428DFC),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            height: MediaQuery.of(context).size.height/5,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Expanded(child: SizedBox.shrink()),
                Text(
                  " Edit Activities",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Text(
                " Activities Visible to user",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
              IconButton(
                splashRadius: 25,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.edit,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: 350,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200,
                                width: 300,
                                child: IconButton(
                                  icon: Image.asset(
                                    "assets/placeholder.png",
                                    fit: BoxFit.fill,
                                    height: 200,
                                  ),
                                  onPressed: () {
                                    StorageManager sm = StorageManager();
                                    sm.uploadFile();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  cursorColor: Colors.black,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFA1C3FC), width: 1.0),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    hintText: "Link",
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        letterSpacing: 0.5
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox.shrink()),
                              SizedBox(
                                width: 250,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Color(0xFF151A4F),)
                                  ),
                                  child: const Text(
                                    "Add new Activity",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(width: 10,),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<EditActivitiesProvider>().activities.length,
              itemBuilder: (BuildContext context, int index) {
                return ActivityCard(activity: Provider.of<EditActivitiesProvider>(context, listen: false).activities[index]);
              },
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key, required this.activity}) : super(key: key);
  final Map activity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: () {

        },
        child: Image.network(
          activity["image"],
          fit: BoxFit.fill,
          height: 200,
        ),
      ),
    );
  }
}
