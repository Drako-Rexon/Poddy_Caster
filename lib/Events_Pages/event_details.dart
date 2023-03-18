import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';

class EventDetails extends StatefulWidget {
  EventDetails({Key? key}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          overlayColor: MaterialStateProperty.all(trans),
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: pLightPink,
          ),
        ),
        title: Text(
          "Events",
          style: TextStyle(
            color: pWhite,
            fontSize: AppConfig.textSize24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 26,
              color: pPrimaryTextColor,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: trans,
        elevation: 0,
      ),
      backgroundColor: pBackgroundAppColor,
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
            children: [],
          ),
        ),
      ),
    );
  }
}
