import 'package:flutter/material.dart';
import 'package:poddy_caster/src/presentation/views/introduction/bloc/intro_bloc.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/presentation/views/auth/sign_in.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int actPage = 0;
  late PageController _pageController;
  final IntroBloc introBloc = IntroBloc();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IntroBloc, IntroState>(
      bloc: introBloc,
      listenWhen: (previous, current) => current is IntroActionState,
      buildWhen: (previous, current) => current is! IntroActionState,
      listener: (context, state) {
        if (state is IntroToEnterAppNavigateState) {
          navigateRoute(context, const SignInPage());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: pBackground,
          body: SafeArea(
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (ind) {
                    setState(() {
                      actPage = _pageController.page!.round();
                    });
                  },
                  controller: _pageController,
                  children: const [
                    IntroPagePart(
                      img: 'assets/images/radio.png',
                      content:
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                    ),
                    IntroPagePart(
                      img: 'assets/images/radio.png',
                      content:
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                    ),
                    IntroPagePart(
                      img: 'assets/images/radio.png',
                      content:
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                    ),
                    IntroPagePart(
                      img: 'assets/images/radio.png',
                      content:
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                    ),
                  ],
                ),
                Align(
                  alignment: const Alignment(0.9, -0.9),
                  child: InkWell(
                    onTap: () {
                      introBloc.add(ProceedToTheAppPage());
                    },
                    child: SizedBox(
                      height: AppConfig.height30,
                      width: AppConfig.width50,
                      child: const Center(
                        child: Text(
                          "skip",
                          style: TextStyle(color: pLightPink),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(alignment: const Alignment(0, 0.9), child: controller()),
              ],
            ),
          ),
        );
      },
    );
  }

  Row controller() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(trans),
          onTap: () {
            setState(() {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.linear,
              );
              introBloc.add(PreviousButtonClickedEvent());
            });
          },
          child: SizedBox(
            height: AppConfig.height50,
            width: AppConfig.width70 + AppConfig.width30,
            child: const Center(
              child: Text(
                "Previous",
                style: TextStyle(color: pLightPink),
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppConfig.height50,
          width: AppConfig.width60 * 2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return DotCarousel(
                dia: 10,
                fillClr: actPage == index ? pLightPink : pPrimaryTextColor,
                borderClr: actPage == index ? pLightPink : pPrimaryTextColor,
              );
            },
          ),
        ),
        InkWell(
          overlayColor: MaterialStateProperty.all(trans),
          onTap: () {
            actPage == 3
                ? introBloc.add(ProceedToTheAppPage())
                : _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
            
          },
          child: SizedBox(
            height: AppConfig.height50,
            width: 70,
            child: Center(
              child: Text(
                actPage == 3 ? "Done" : "Next",
                style: const TextStyle(color: pLightPink),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
