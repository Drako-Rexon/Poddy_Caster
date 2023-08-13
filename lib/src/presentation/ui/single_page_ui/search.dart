import 'package:flutter/material.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/src/data/sample_json.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/presentation/ui/single_page_ui/player.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

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
          style: ButtonStyle(overlayColor: MaterialStateProperty.all(trans)),
          icon: const Icon(
            Icons.arrow_back,
            color: pLightPink,
          ),
          onPressed: () {
            Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: Column(
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
                      height: AppConfig.height60 * 2,
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
                        itemBuilder: (BuildContext context, int index) =>
                            Column(
                          children: [
                            ListCardBottomHome(
                              radioPopularBroadCard[index],
                              () {
                                navigateRoute(
                                  context,
                                  PlayerPage(
                                      data: radioPopularBroadCard[index]),
                                );
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
      ),
    );
  }
}
