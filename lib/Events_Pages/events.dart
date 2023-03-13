import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/Events_Pages/event_details.dart';
import 'package:podcast_app/Events_Pages/event_map.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/sample_json.dart';
import 'package:podcast_app/_components/util_widgets.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  int act = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: NormalText(
          text: "Events",
          isBold: true,
          textColor: pWhite,
          textSize: AppConfig.textSize24,
        ),
        actions: [
          InkWell(
            overlayColor: MaterialStateProperty.all(trans),
            child: Icon(
              Icons.map_outlined,
              size: 26,
              color: pPrimaryTextColor,
            ),
            onTap: () {
              Get.to(() => EventMap());
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              overlayColor: MaterialStateProperty.all(trans),
              child: Icon(
                Icons.search,
                size: 26,
                color: pPrimaryTextColor,
              ),
              onTap: () {},
            ),
          ),
        ],
        backgroundColor: pBackground,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Popular Events",
                style: TextStyle(
                  color: pWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: AppConfig.textSize18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: events1.length,
                    itemBuilder: (BuildContext context, int index) =>
                        CarouselCardHome(objData: events1[index])),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 120,
                width: AppConfig.screenWidth - 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/banner-1.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          // ! not working
                          // Todo
                          act = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Text(
                            eventGenres[index],
                            style: TextStyle(
                              color: act == index ? pLightPink : pWhite,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: events1.length,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          Get.to(() => EventDetails());
                        },
                        child: CarouselCardHome(objData: events1[index]))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Favourite Events",
                style: TextStyle(
                  color: pWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: AppConfig.textSize18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: events1.length,
                    itemBuilder: (BuildContext context, int index) =>
                        CarouselCardHome(objData: events1[index])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
