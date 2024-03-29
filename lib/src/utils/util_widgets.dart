// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

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

class RegularCardToggle extends StatefulWidget {
  const RegularCardToggle(
    this.name,
    this.func, {
    Key? key,
    required this.status,
    this.listAction = const [],
    this.listLead = const [],
  }) : super(key: key);
  final Function func;
  final String name;
  final List<Widget> listAction;
  final List<Widget> listLead;
  final bool status;

  @override
  State<RegularCardToggle> createState() => _RegularCardToggleState();
}

class _RegularCardToggleState extends State<RegularCardToggle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        widget.func();
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
              Expanded(
                  flex: widget.listLead.length,
                  child: Row(children: widget.listLead)),
              Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.name, style: const TextStyle(color: pWhite)),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: ToggleButtons(
                            renderBorder: false,
                            color: pCustomGrey,
                            borderRadius: BorderRadius.circular(10),
                            fillColor: pDarkPink,
                            selectedColor: pWhite,
                            isSelected: [widget.status],
                            onPressed: (int newInd) {
                              // setState(() {
                              // for (int i = 0; i < gapLess.length; i++) {
                              //   newInd == i
                              //       ? gapLess[i] = true
                              //       : gapLess[i] = false;
                              // }
                              // widget.status = !widget.status;
                              // });
                            },
                            children: const [Text("ON"), Text("OFF")],
                          ),
                        ),
                      ],
                    ),
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
        popScreen(context);
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
