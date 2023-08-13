import 'package:flutter/material.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/presentation/ui/single_page_ui/search.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

class Podcasts extends StatelessWidget {
  const Podcasts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
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
            icon: const Icon(Icons.search, size: 26),
            onPressed: () {
              navigateRoute(context, const SearchPage());
            },
          ),
        ],
        backgroundColor: pBackground,
        elevation: 0,
      ),
    );
  }
}
