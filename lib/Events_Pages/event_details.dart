import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';
import 'package:poddy_caster/_components/sample_json.dart';
import 'package:poddy_caster/_components/util_widgets.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key, required this.list}) : super(key: key);
  final list;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackgroundAppColor,
      body: RefreshIndicator(
        color: pPrimaryTextColor,
        backgroundColor: pDeepPrimary,
        onRefresh: () async {
          setState(() {
            _loading = false;
          });
          Timer(const Duration(milliseconds: 1500), () {
            setState(() {
              _loading = true;
            });
          });
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Image.asset(
                  widget.list['img'],
                  height: AppConfig.screenHeight / 2,
                  width: AppConfig.screenWidth,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Container(
                      height: AppConfig.screenHeight / 2,
                      width: AppConfig.screenWidth,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [trans, pBackgroundAppColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.list['mainTitle'],
                            style: TextStyle(
                              color: pWhite,
                              fontFamily: 'CircularStd',
                              fontSize: AppConfig.textSize24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            widget.list['des'],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: pWhite,
                              fontFamily: 'CircularStd-Book',
                              fontSize: AppConfig.textSize18 - 2,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: AppConfig.height60 * 3,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: events1.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        InkWell(
                                            onTap: () {
                                              Get.to(() => EventDetails(
                                                  list: events1[index]));
                                            },
                                            child: CarouselCardHome(
                                                objData: events1[index]))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: pLightPink,
                        ),
                      ),
                      Text(
                        "Events",
                        style: TextStyle(
                          color: pWhite,
                          fontSize: AppConfig.textSize24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 26,
                          color: pPrimaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
