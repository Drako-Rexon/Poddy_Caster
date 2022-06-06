import 'package:flutter/material.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/components/normal_text.dart';

class RadioStationPage extends StatefulWidget {
  RadioStationPage({Key? key}) : super(key: key);

  @override
  State<RadioStationPage> createState() => _RadioStationPageState();
}

class _RadioStationPageState extends State<RadioStationPage>
    with SingleTickerProviderStateMixin {
  static List<Tab> myTabs = [
    Tab(text: "Popular Broadcast"),
    Tab(text: "Radio Genre")
  ];
  TabController _tabController =
      TabController(vsync: this, length: myTabs.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsForApp.commonBackGround,
      appBar: AppBar(
        title: NormalText(
          text: "Radio Stations",
          isBold: true,
          textColor: ColorsForApp.cutomWhite,
          textSize: SizeForDynamic.textSize24,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: ColorsForApp.commonBackGround,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: _tabController,
              tabs: myTabs,
            ),
          ),
          TabBarView(
            children: [
              Center(
                child: Text("Hello1"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
