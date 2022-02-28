import 'package:flutter/material.dart';
import 'package:profile/core/components/custom_navigator.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InfoService().getDataFromUrl();
    // Ilova responsive bo'lishi uchun
    SizeConfig().init(context);
    // Ilovada navigator amallarini har joyda context'siz ishlata olish uchun
    CustomNavigator().init(context);

    InfoService().getDataFromUrl();
    return ListenableProvider(
      create: (context) => TabProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: MyEdgeInsets.symmetric(v: 30, h: 16),
              child: Column(
                children: [
                  HeaderInfo(),
                  SizedBox(height: getHeight(20.0)),
                  CustomTabBar(),
                  FooterInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    InfoService service = InfoService();
     service.getDataFromUrl();
     service.getDataFromPref();
  }


}
