import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/widgets/buttons/start_chat_floating_action_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoad = false;
  @override
  void initState() {
    super.initState();
    getData().then((value) {
      _isLoad = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ilova responsive bo'lishi uchun
    SizeConfig().init(context);
    // Ilovada navigator amallarini har joyda context'siz ishlata olish uchun
    CustomNavigator().init(context);

    return ListenableProvider(
      create: (context) => TabProvider(),
      child: Scaffold(
        floatingActionButton: const StartChatButton(),
        body: _isLoad ?  _buildSingleChildScrollView() : Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  SingleChildScrollView _buildSingleChildScrollView() {
    return SingleChildScrollView(
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
    );
  }

  Future<void> getData() async {
    InfoService service = InfoService();
    service.getDataFromUrl();
    service.getDataFromStorage();
  }
}
