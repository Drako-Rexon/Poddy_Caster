import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:poddy_caster/Screens/Player_page/player.dart';
import 'package:poddy_caster/Screens/Profile/more.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';
import 'package:poddy_caster/_components/sample_json.dart';
import 'package:poddy_caster/_components/util_widgets.dart';
import 'package:poddy_caster/Screens/search/search.dart';

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
      replacement: const Center(
          child: CircularProgressIndicator(color: pPrimaryTextColor)),
      visible: _loading,
      child: Scaffold(
        backgroundColor: pBackground,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: pBackground,
          title: const Text("Profile"),
          centerTitle: true,
          actions: [
            InkWell(
              overlayColor: MaterialStateProperty.all(trans),
              onTap: () {
                Get.to(() => const More());
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.more_vert, size: 26),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                  onTap: () {
                    Get.to(() => const SearchPage());
                  },
                  child: const Icon(Icons.search, size: 26)),
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
            Timer(const Duration(milliseconds: 1500), () {
              setState(() {
                _loading = true;
              });
            });
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppConfig.height20),
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: AppConfig.height60 * 2,
                        width: 120,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: pLightPink,
                              blurRadius: 5,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Visibility(
                          replacement: const Center(
                            child: CircularProgressIndicator(
                                color: pPrimaryTextColor),
                          ),
                          visible: _loading,
                          child: CircleAvatar(
                            radius: AppConfig.width50 + AppConfig.width10,
                            backgroundImage:
                                const AssetImage('assets/images/avatar.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(height: AppConfig.height20),
                      const Text(
                        "Drako Rexon",
                        style: TextStyle(
                          color: pWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "drakocodeforever@gmail.com",
                        style: TextStyle(
                          color: pPrimaryTextColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Favourite Podcasts",
                        style: TextStyle(color: pWhite),
                      ),
                      SizedBox(height: AppConfig.height10),
                      SizedBox(
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
                SizedBox(height: AppConfig.height20),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Favourite Radio Stations",
                    style: TextStyle(
                      color: pWhite,
                    ),
                  ),
                ),
                SizedBox(height: AppConfig.height10),
                SizedBox(
                  height: radioPopularBroadCard.length *
                      (AppConfig.height80 + AppConfig.height10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: radioPopularBroadCard.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        ListCardBottomHome(
                          radioPopularBroadCard[index],
                          () {
                            Get.to(() =>
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
