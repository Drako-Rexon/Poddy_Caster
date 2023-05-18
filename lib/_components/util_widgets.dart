// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';

class HoriCarousel extends StatelessWidget {
  const HoriCarousel({Key? key, this.ind = 0, required this.list})
      : super(key: key);
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
  const DotCarousel({
    Key? key,
    this.active = false,
    this.borderClr = pWhite,
    this.fillClr = pWhite,
    this.dia = 8,
  }) : super(key: key);
  final bool active;
  final Color borderClr;
  final Color fillClr;
  final double dia;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dia,
      width: dia,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: fillClr,
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: borderClr,
        ),
      ),
    );
  }
}

class CarouselCardHome extends StatelessWidget {
  const CarouselCardHome({
    Key? key,
    required this.objData,
  }) : super(key: key);
  final dynamic objData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: AppConfig.width10, right: AppConfig.width10),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: AppConfig.height60 * 2,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                image: AssetImage(objData["img"]),
              ),
            ),
          ),
          SizedBox(height: AppConfig.height5),
          Text(
            objData["mainTitle"].toUpperCase(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: pWhite,
              fontSize: AppConfig.textSize12,
              fontFamily: 'CircularStd-Book',
            ),
          ),
          SizedBox(height: AppConfig.height5),
          Text(
            objData["subTitle"],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: pPrimaryTextColor,
              fontSize: AppConfig.textSize10,
            ),
          ),
        ],
      ),
    );
  }
}

class ListCardBottomHome extends StatefulWidget {
  ListCardBottomHome(
    this.list,
    this.func, {
    Key? key,
    this.fav = false,
    this.radio = false,
  }) : super(key: key);
  final dynamic list;
  bool fav;
  final bool radio;
  final Function? func;

  @override
  State<ListCardBottomHome> createState() => _ListCardBottomHomeState();
}

class _ListCardBottomHomeState extends State<ListCardBottomHome> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(trans),
      onTap: () {
        widget.func!();
      },
      child: Container(
        width: AppConfig.screenWidth - 40,
        height: AppConfig.height80,
        padding: EdgeInsets.all(AppConfig.height10),
        decoration: const BoxDecoration(
          color: ColorsForApp.darkPurple,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: AppConfig.width15),
                  width: AppConfig.height50,
                  height: AppConfig.height50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage(widget.list['img']),
                    ),
                  ),
                ),
                SizedBox(
                  width: AppConfig.screenWidth - (AppConfig.width30 * 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.list['mainTitle'].toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: pWhite,
                          fontSize: AppConfig.textSize14,
                          fontFamily: 'CircularStd-Book',
                        ),
                      ),
                      SizedBox(height: AppConfig.height5),
                      Text(
                        widget.list['subTitle'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: AppConfig.textSize12,
                          color: pCustomGrey,
                          fontFamily: 'CircularStd-Book',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    widget.func!();
                  },
                  child: Icon(
                    Icons.more_horiz,
                    color: pPrimaryTextColor,
                    size: AppConfig.textSize18,
                  ),
                ),
                widget.radio
                    ? Row(
                        children: [
                          SizedBox(width: AppConfig.width10),
                          InkWell(
                            overlayColor: MaterialStateProperty.all(trans),
                            onTap: () {
                              setState(() {
                                widget.fav
                                    ? widget.fav = false
                                    : widget.fav = true;
                              });
                            },
                            child: Icon(
                              widget.fav
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: pPrimaryTextColor,
                              size: 18,
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(width: AppConfig.width10),
              ],
            ),
          ],
        ),
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
        isDisable
            ? () {
                return;
              }
            : func();
      },
      child: Container(
        width: wid != 0.0 ? wid : AppConfig.screenWidth - AppConfig.width50,
        height: hei != 0.0 ? hei : AppConfig.height40 + AppConfig.height5,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDisable ? disableGradient : gradientButton1,
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: wid / 20,
                child: const CircularProgressIndicator(color: pWhite))
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
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: backColor,
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: pWhite)
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
      height: AppConfig.height60,
      width: AppConfig.screenWidth - 40,
      decoration: const BoxDecoration(
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
              style: const TextStyle(color: pWhite),
            ),
            InkWell(
              onTap: func(),
              child: Container(
                height: AppConfig.height20,
                width: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: pBackground,
                ),
                child: const Icon(
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
    return Center(
      child: NormalText(text: text),
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
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        func();
      },
      child: Container(
        decoration: const BoxDecoration(
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
                    Text(name, style: const TextStyle(color: pWhite)),
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

class BackArrow extends StatelessWidget {
  const BackArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(trans),
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.arrow_back,
        color: pLightPink,
      ),
    );
  }
}

class ProfileCards extends StatefulWidget {
  ProfileCards({
    Key? key,
    this.fav = false,
    this.hei = 200.0,
    this.wid = 200.0,
  }) : super(key: key);
  bool fav;
  final double hei;
  final double wid;

  @override
  State<ProfileCards> createState() => _ProfileCardsState();
}

class _ProfileCardsState extends State<ProfileCards> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Stack(
          children: [
            Container(
              height: widget.hei,
              width: widget.wid,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Image-2.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: pWhite,
              ),
              child: Center(
                child: InkWell(
                  overlayColor: MaterialStateProperty.all(trans),
                  onTap: () {
                    setState(() {
                      widget.fav =
                          widget.fav ? widget.fav = false : widget.fav = true;
                    });
                  },
                  child: widget.fav
                      ? const Icon(
                          Icons.favorite,
                          color: pLightPink,
                          size: 22,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          size: 20,
                          color: pLightPink,
                        ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class BackGroundImageFilter extends StatelessWidget {
  const BackGroundImageFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppConfig.screenHeight * 0.4,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/images/Image-7.png'),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              height: AppConfig.screenHeight * 0.3,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 0.75,
                  colors: [
                    ColorsForApp.backImagRadial1.withOpacity(0.5),
                    ColorsForApp.backImagRadial2.withOpacity(0.7),
                    ColorsForApp.backImagRadial3.withOpacity(0.9),
                  ],
                ),
              ),
            ),
            Container(
              height: AppConfig.screenHeight * 0.669,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    // ColorsForApp.backGradientColor1,
                    ColorsForApp.backImagRadial3.withOpacity(1),
                    ColorsForApp.backGradientColor2,
                  ],
                  radius: 2,
                ),
              ),
            )
          ],
        ),
        Container(
          height: AppConfig.screenHeight,
          decoration: BoxDecoration(
            color: ColorsForApp.backGradientColor1.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}

class IntroPagePart extends StatelessWidget {
  const IntroPagePart({
    Key? key,
    this.img = 'assets/images/imageNot.png',
    required this.content,
  }) : super(key: key);
  final String img;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppConfig.screenWidth,
          height: AppConfig.height20 * 25,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img)),
          ),
        ),
        Text(
          "Tune your Radio",
          style: TextStyle(
            color: pWhite,
            fontSize: AppConfig.textSize24 * 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: pPrimaryTextColor,
              fontSize: AppConfig.textSize18 - 2,
            ),
          ),
        ),
      ],
    );
  }
}
