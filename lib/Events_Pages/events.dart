import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poddy_caster/Events_Pages/event_details.dart';
import 'package:poddy_caster/Events_Pages/event_map.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';
import 'package:poddy_caster/_components/sample_json.dart';
import 'package:poddy_caster/_components/util_widgets.dart';
import 'package:poddy_caster/search/search.dart';

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
            child: const Icon(
              Icons.map_outlined,
              size: 26,
              color: pPrimaryTextColor,
            ),
            onTap: () {
              Get.to(() => EventMap());
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              overlayColor: MaterialStateProperty.all(trans),
              child: const Icon(
                Icons.search,
                size: 26,
                color: pPrimaryTextColor,
              ),
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
                height: AppConfig.height60 * 3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: events1.length,
                    itemBuilder: (BuildContext context, int index) =>
                        CarouselCardHome(objData: events1[index])),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppConfig.height20),
              child: Container(
                height: AppConfig.height60 * 2,
                width: AppConfig.screenWidth - 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/banner-1.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: AppConfig.height30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (act != index) {
                            act = index;
                          } else {
                            act = -1;
                          }
                        });
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: AppConfig.width20),
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
              padding: EdgeInsets.only(left: AppConfig.width10),
              child: SizedBox(
                height: AppConfig.height60 * 3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: events1.length,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          Get.to(() => EventDetails(list: events1[index]));
                        },
                        child: CarouselCardHome(objData: events1[index]))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppConfig.width20),
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
              padding: EdgeInsets.only(left: AppConfig.width10),
              child: SizedBox(
                height: AppConfig.height60 * 3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: events1.length,
                    itemBuilder: (BuildContext context, int index) =>
                        CarouselCardHome(objData: events1[index])),
              ),
            ),
            SizedBox(height: AppConfig.height20),
          ],
        ),
      ),
    );
  }
}
