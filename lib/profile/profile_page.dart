import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/sample_json.dart';
import 'package:podcast_app/_components/util_widgets.dart';
import 'package:podcast_app/player_page/player.dart';
import 'package:podcast_app/profile/more.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _loading = true;

  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement:
          Center(child: CircularProgressIndicator(color: pPrimaryTextColor)),
      visible: _loading,
      child: Scaffold(
        backgroundColor: pBackground,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: pBackground,
          title: Text("Profile"),
          centerTitle: true,
          actions: [
            InkWell(
              overlayColor: MaterialStateProperty.all(trans),
              onTap: () {
                Get.to(() => More());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.more_vert, size: 32),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.search, size: 32),
            ),
          ],
        ),
        body: RefreshIndicator(
          color: pPrimaryTextColor,
          backgroundColor: pDeepPrimary,
          onRefresh: () async {
            setState(() {
              _loading = false;
            });
            Timer(Duration(milliseconds: 1500), () {
              setState(() {
                _loading = true;
              });
            });
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: pLightPink,
                              blurRadius: 10,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: AppConfig.width50 + AppConfig.width10,
                          backgroundImage:
                              AssetImage('assets/images/avatar.jpg'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Drako Rexon",
                        style: TextStyle(
                          color: pWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "drakocodeforever@gmail.com",
                        style: TextStyle(
                          color: pPrimaryTextColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Favourite Podcasts",
                        style: TextStyle(color: pWhite),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: radioPopularBroadCard.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProfileCards(fav: fav);
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Favourite Radio Stations",
                    style: TextStyle(
                      color: pWhite,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: radioPopularBroadCard.length *
                      (AppConfig.height80 + AppConfig.height10),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: radioPopularBroadCard.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        ListCardBottomHome(
                          radioPopularBroadCard[index],
                          func: () {
                            Get.to(
                                PlayerPage(data: radioPopularBroadCard[index]));
                          },
                          radio: true,
                        ),
                        SizedBox(height: AppConfig.height10),
                      ],
                    ),
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
