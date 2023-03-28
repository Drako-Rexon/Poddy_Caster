import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';
import 'package:poddy_caster/_components/sample_json.dart';
import 'package:poddy_caster/_components/util_widgets.dart';
import 'package:poddy_caster/player_page/player.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackgroundAppColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: pLightPink,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Search',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: pWhite,
            fontSize: AppConfig.textSize24,
          ),
        ),
        backgroundColor: pBackgroundAppColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextFormField(
              style: const TextStyle(color: pBackgroundAppColor),
              cursorColor: pLightPrimary,
              decoration: const InputDecoration(
                fillColor: pBackground,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                prefixIcon: Icon(Icons.search, color: pLightPrimary),
                hintText: "Search",
                hintStyle: TextStyle(color: pLightPrimary),
              ),
            ),
          ),
          SizedBox(
            height: AppConfig.screenHeight * 2 / 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: radioPopularBroadCard.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProfileCards(
                            hei: 120,
                            wid: 120,
                          );
                        }),
                  ),
                  const SizedBox(height: 30),
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
                              Get.to(() => PlayerPage(
                                  data: radioPopularBroadCard[index]));
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
        ],
      ),
    );
  }
}
