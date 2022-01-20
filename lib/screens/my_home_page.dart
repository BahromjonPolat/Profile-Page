import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListenableProvider(
      create: (context) => TabProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: MyEdgeInsets.symmetric(v: 30, h: 16),
              child: Column(
                children: [
                  HeaderInfo(),
                  SizedBox(height: getProportionateScreenHeight(20.0)),
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
