import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/ellipses_text.dart';
import 'package:podcast_app/player_page/player.dart';

class HoriCarousel extends StatelessWidget {
  HoriCarousel({Key? key, this.ind = 0, required this.list}) : super(key: key);
  final int ind;
  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          list[ind]["text1"],
          style: TextStyle(
            color: pCustomGrey,
            fontSize: AppConfig.textSize12,
            fontFamily: 'CircularStd-Book',
          ),
        ),
        NormalText(
          text: list[ind]["text2"],
          textSize: AppConfig.textSize36,
          isBold: true,
          textColor: pWhite,
        ),
      ],
    );
  }
}

class DotCarousel extends StatelessWidget {
  DotCarousel({Key? key, this.active = false}) : super(key: key);
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: active ? pWhite : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: pWhite,
        ),
      ),
    );
  }
}

class CarouselCardHome extends StatelessWidget {
  const CarouselCardHome({
    Key? key,
    required this.list,
    this.ind = 0,
  }) : super(key: key);
  final List<dynamic> list;
  final int ind;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(list[ind]["img"]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: EllipsisText(
              text: list[ind]["mainTitle"],
              toUpper: true,
              textColor: pWhite,
              textSize: AppConfig.textSize12,
              isBold: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: EllipsisText(
              text: list[ind]["subTitle"],
              textSize: AppConfig.textSize8,
            ),
          ),
        ],
      ),
    );
  }
}

class ListCardBottomHome extends StatefulWidget {
  ListCardBottomHome({
    Key? key,
    required this.list,
    this.ind = 0,
    this.fav = false,
    this.radio = false,
  }) : super(key: key);
  final List list;
  final int ind;
  bool fav;
  final bool radio;

  @override
  State<ListCardBottomHome> createState() => _ListCardBottomHomeState();
}

class _ListCardBottomHomeState extends State<ListCardBottomHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConfig.screenWidth - 40,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorsForApp.darkPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: AppConfig.width15),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.list[widget.ind]['img']),
                  ),
                ),
              ),
              SizedBox(
                width: AppConfig.screenWidth - 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  /* for the text data */ children: [
                    EllipsisText(
                      text: widget.list[widget.ind]['mainTitle'],
                      textColor: pWhite,
                      isBold: true,
                      textSize: AppConfig.textSize12,
                    ),
                    SizedBox(height: 5),
                    EllipsisText(
                      text: widget.list[widget.ind]['subTitle'],
                      textColor: pCustomGrey,
                      textSize: AppConfig.textSize10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.to(() => PlayerPage());
                },
                icon: Icon(
                  Icons.more_horiz,
                  color: pWhite,
                ),
              ),
              widget.radio
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          widget.fav ? widget.fav = false : widget.fav = true;
                        });
                      },
                      icon: Icon(
                        widget.fav ? Icons.favorite : Icons.favorite_border,
                        color: pWhite,
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton(
    this.text,
    this.func, {
    Key? key,
    this.isLoading = false,
    this.isDisable = true,
    this.wid = 0.0,
    this.hei = 0.0,
    this.textSize = 18.0,
  }) : super(key: key);

  final String text;
  final bool isLoading;
  final Function func;
  final bool isDisable;
  final double wid;
  final double hei;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: wid != 0.0 ? wid : AppConfig.screenWidth - AppConfig.width50,
        height: hei != 0.0 ? hei : AppConfig.height40 + AppConfig.height5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDisable ? disableGradient : gradientButton1,
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(color: pWhite)
            : Center(
                child: NormalText(
                  text: text,
                  textColor: pWhite,
                  textSize: textSize == 18.0 ? 18 : textSize,
                  isBold: true,
                ),
              ),
      ),
    );
  }
}

class SignInSocial extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Function func;
  final bool isDisable;
  final String iconLocation;
  final Color textColor;
  final Color backColor;

  const SignInSocial(
    this.text,
    this.func,
    this.iconLocation, {
    Key? key,
    this.isLoading = false,
    this.isDisable = true,
    this.textColor = pWhite,
    this.backColor = pDeepPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: AppConfig.screenWidth - AppConfig.width50,
        height: AppConfig.height40 + AppConfig.height5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: backColor,
        ),
        child: isLoading
            ? CircularProgressIndicator(color: pWhite)
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(iconLocation),
                      width: AppConfig.width40,
                      height: AppConfig.height20,
                    ),
                    NormalText(
                      text: text,
                      textColor: textColor,
                      isBold: true,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class RadioGenreCard extends StatelessWidget {
  const RadioGenreCard({
    Key? key,
    required this.list,
    this.ind = 0,
    required this.func,
  }) : super(key: key);
  final List<dynamic> list;
  final int ind;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: AppConfig.screenWidth - 40,
      decoration: BoxDecoration(
        color: pSecondaryDeep,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              list[ind]['category'],
              style: TextStyle(color: pWhite),
            ),
            InkWell(
              onTap: func(),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pBackground,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: pWhite,
                  size: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestingPage extends StatelessWidget {
  const TestingPage({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: NormalText(text: text),
      ),
    );
  }
}

class NormalText extends StatelessWidget {
  const NormalText({
    Key? key,
    required this.text,
    this.textSize = 14,
    this.isBold = false,
    this.textColor = pPrimaryTextColor,
    this.align = TextAlign.justify,
    this.toUpper = false,
  }) : super(key: key);
  final String text;
  final double textSize;
  final bool isBold;
  final Color textColor;
  final TextAlign align;
  final bool toUpper;

  @override
  Widget build(BuildContext context) {
    return Text(
      toUpper ? text.toUpperCase() : text,
      textAlign: align,
      style: TextStyle(
        fontSize: textSize,
        fontFamily: isBold ? 'CircularStd' : 'CircularStd-Book',
        color: textColor,
      ),
    );
  }
}

class RegularCard extends StatelessWidget {
  const RegularCard(
    this.name,
    this.func, {
    Key? key,
    this.listAction = const [],
    this.listLead = const [],
  }) : super(key: key);
  final Function func;
  final String name;
  final List<Widget> listAction;
  final List<Widget> listLead;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func();
      },
      child: Container(
        decoration: BoxDecoration(
          color: pSecondaryDeep,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        width: AppConfig.screenWidth - 40,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(flex: listLead.length, child: Row(children: listLead)),
              Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: TextStyle(color: pWhite)),
                    Row(children: listAction)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
