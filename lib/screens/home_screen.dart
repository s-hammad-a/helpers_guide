import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:helperguide/controllers/edit_activities_provider.dart';
import 'package:helperguide/controllers/edit_events_provider.dart';
import 'package:helperguide/controllers/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/edit_university_provider.dart';
import '../modules/university_activitiy.dart';
import 'edit_events.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          color: const Color(0xFF428DFC),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: context.watch<HomeScreenProvider>().currentPage == 0 ? Colors.black : Colors.white,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: context.watch<HomeScreenProvider>().currentPage == 0 ? Colors.black : Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    Provider.of<HomeScreenProvider>(context, listen: false).jumpToPage(0);
                  },
                )
              ),
              Expanded(
                child: TextButton(
                  child: Column(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: context.watch<HomeScreenProvider>().currentPage == 1 ? Colors.black : Colors.white,
                      ),
                      Text(
                        'Calender',
                        style: TextStyle(
                          color: context.watch<HomeScreenProvider>().currentPage == 1 ? Colors.black : Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    Provider.of<HomeScreenProvider>(context, listen: false).jumpToPage(1);
                  },
                )
              ),
              Expanded(
                child: TextButton(
                  child: Column(
                    children: [
                      Icon(
                        Icons.map,
                        color: context.watch<HomeScreenProvider>().currentPage == 2 ? Colors.black : Colors.white,
                      ),
                      Text(
                        'Map',
                        style: TextStyle(
                          color: context.watch<HomeScreenProvider>().currentPage == 2 ? Colors.black : Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    Provider.of<HomeScreenProvider>(context, listen: false).jumpToPage(2);
                  },
                )
              ),
              Expanded(
                child: TextButton(
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        color: context.watch<HomeScreenProvider>().currentPage == 3 ? Colors.black : Colors.white,
                      ),
                      Text(
                        'Account',
                        style: TextStyle(
                          color: context.watch<HomeScreenProvider>().currentPage == 3 ? Colors.black : Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    Provider.of<HomeScreenProvider>(context, listen: false).jumpToPage(3);
                  },
                )
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: context.watch<HomeScreenProvider>().controller,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF428DFC),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                ),
                height: MediaQuery.of(context).size.height/4.5,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    const Text(
                      " Hi Turki !",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          " Hafr Al-Batin University",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      const Text(
                        "Activities around you",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
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
                          Navigator.pushNamed(context, "/editActivities");
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: CardSwipe(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: SizedBox(
                  height: 25,
                  child: Row(
                    children: [
                      const Text(
                        "University Information",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
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
                          Navigator.pushNamed(context, "/editUniversity");
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const UniversityInformation(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF428DFC),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                ),
                height: MediaQuery.of(context).size.height/4,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          context.watch<HomeScreenProvider>().months[context.watch<HomeScreenProvider>().current.month],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            DateTime? temp = await showDatePicker(
                              context: context,
                              initialDate: Provider.of<HomeScreenProvider>(context, listen: false).current,
                              firstDate: DateTime.now().subtract(const Duration(days: 365)),
                              lastDate: DateTime.now().add(const Duration(days: 365)),
                            );
                            Provider.of<HomeScreenProvider>(context, listen: false).setCurrentDate(temp!);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        itemExtent: 65,
                        controller: context.watch<HomeScreenProvider>().scrollController,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: Provider.of<HomeScreenProvider>(context, listen: false).getNumberOfDays(),
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              FloatingActionButton(
                                focusNode: context.watch<HomeScreenProvider>().current.day == index + 1 ? context.watch<HomeScreenProvider>().focusNode : FocusNode(),
                                shape: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(200)
                                ),
                                backgroundColor: context.watch<HomeScreenProvider>().current.day == index + 1 ? Colors.red : Colors.white,
                                onPressed: () {
                                  Provider.of<HomeScreenProvider>(context, listen: false).setChangeDate(index+1);
                                },
                                child: Text(
                                  (index+1).toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5,)
                            ],
                          );
                        },

                      ),

                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        "Events of ${context.watch<HomeScreenProvider>().current.day} ${context.watch<HomeScreenProvider>().months[context.watch<HomeScreenProvider>().current.month]}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
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
                          Navigator.pushNamed(context, "/editEvents");
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: ListView.builder(
                    itemCount: context.watch<EditEventsProvider>().events.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: EventCard(event: context.watch<EditEventsProvider>().events[index], index: index,),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF428DFC),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                ),
                height: MediaQuery.of(context).size.height/4.5,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Expanded(child: SizedBox.shrink()),
                    Text(
                      " Hafr Al-Batin University",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: const BoxDecoration(
                      color: Color(0xFFA1C3FC),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Text(
                      "مرافق مجمع الياسمين",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: const [
                          LocationCard(),
                          SizedBox(height: 5,),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF428DFC),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                ),
                height: MediaQuery.of(context).size.height/3,
                width: double.maxFinite,
                child: Column(
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/helper logo.png"),
                      radius: 50,
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(100, 20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {  },
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  const LocationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0x33A1C3FC),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Text(
              "كلية علوم وهندسة الحاسب الالي كلية العلوم الطبية التطبيقية كلية الصيدلة ,كلية الهندسة",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(width: 10,),
          Icon(
            Icons.location_on_outlined,
            color: Colors.black,
            size: 40,
          ),
        ],
      ),
    );
  }
}


class UniversityActivityCard extends StatelessWidget {
  const UniversityActivityCard({Key? key, required this.universityActivity, required this.index}) : super(key: key);
  final UniversityActivity universityActivity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
          onPressed: () {
            launchUrl(Uri.parse(universityActivity.link));
          },
          onLongPress: () {
            Provider.of<EditUniversityProvider>(context, listen: false).deleteUniversityActivity(index);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                universityActivity.image,
                fit: BoxFit.fill,
                color: Colors.blueGrey,
                colorBlendMode: BlendMode.dst,
              ),
              Text(
                universityActivity.about,
                style: TextStyle(
                  fontSize: 15,
                  background: Paint()
                    ..color = Colors.white54,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.black,
                ),
              )
            ],
          )
      ),
    );
  }
}

class UniversityInformation extends StatelessWidget {
  const UniversityInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        context.watch<EditUniversityProvider>().activities.isNotEmpty ? Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: SizedBox(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: UniversityActivityCard(universityActivity: context.watch<EditUniversityProvider>().activities[0], index: 0),
                  ),
                  context.watch<EditUniversityProvider>().activities.length > 1 ? Expanded(
                    child: UniversityActivityCard(universityActivity: context.watch<EditUniversityProvider>().activities[1], index: 1),
                  ) : const SizedBox.shrink(),
                ],
              ),
            )
        ) : const SizedBox.shrink(),
        context.watch<EditUniversityProvider>().activities.length > 2 ? Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: SizedBox(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: UniversityActivityCard(universityActivity: context.watch<EditUniversityProvider>().activities[2], index: 2),
                  ),
                  context.watch<EditUniversityProvider>().activities.length > 3 ? Expanded(
                    child: UniversityActivityCard(universityActivity: context.watch<EditUniversityProvider>().activities[3], index: 3),
                  ) : const SizedBox.shrink(),
                ],
              ),
            )
        ) : const SizedBox.shrink(),
      ],
    );
  }
}

class CardSwipe extends StatelessWidget {
  const CardSwipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),
      height: 200,
      child: Swiper.children(
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        pagination: const SwiperPagination(),
        children: Provider.of<HomeScreenProvider>(context, listen: false).activities.map((e) {
          return Image.network(
            e.image,
            fit: BoxFit.fill,
          );
        }).toList(),
      ),
    );
  }
}
