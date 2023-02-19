import 'package:flutter/material.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/util_widgets.dart';

class Podcasts extends StatelessWidget {
  const Podcasts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: pBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: NormalText(
          text: "Podcasts",
          isBold: true,
          textColor: pWhite,
          textSize: AppConfig.textSize24,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 32),
            onPressed: () {},
          ),
        ],
        backgroundColor: pBackground,
        elevation: 0,
      ),
    );
  }
}
