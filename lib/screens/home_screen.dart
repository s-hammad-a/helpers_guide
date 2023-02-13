import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:helperguide/controllers/home_screen_provider.dart';
import 'package:provider/provider.dart';

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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                  height: 200,
                  child: Swiper.children(
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: true,
                    pagination: const SwiperPagination(),
                    children: [
                      Image.asset(
                        "assets/pic1.jpeg",
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        "assets/pic2.jpeg",
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        "assets/pic3.jpeg",
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        "assets/pic4.jpeg",
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        "assets/pic5.jpeg",
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
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

                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: TextButton(
                              onPressed: () {  },
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Color(0x55DB3231)),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset("assets/about university.png", color: Colors.blueGrey, colorBlendMode: BlendMode.dst,),
                                  const Text(
                                    "About University",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                              style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(EdgeInsets.zero),
                              ),
                              onPressed: () {  },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset("assets/colleges.jpeg",),
                                  const Text(
                                    "About University",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: SizedBox(
                  height: 80,
                  child: TextButton(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      ),
                      onPressed: () {  },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/university majors.jpeg",),
                          const Text(
                            "University Majors",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      )
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
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          " September",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {  },
                          icon: const RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: Text(
                  "Events of 15 September",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: EventCard(),
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
class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFFA1C3FC),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(height: 5,),
          Text(
            "مبادرة الاثراء الرقمي",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.end,
          ),
          SizedBox(height: 5,),
          Text(
            "وكالة الجامعة للشؤون الاكاديمية",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            textAlign: TextAlign.end,
          ),
          SizedBox(height: 10,),
          Text(
            "08:30 AM - 09:30 AM",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.end,
          ),
          SizedBox(height: 5,),
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

