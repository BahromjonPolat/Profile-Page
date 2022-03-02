
import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'dart:async';
import 'dart:developer' as developer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runZonedGuarded(() {
    runApp(const MyApp());
  }, (dynamic error, dynamic stack) {
    developer.log("Something went wrong!", error: error, stackTrace: stack);
  });

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375.0, 812.0),
      builder: () => MaterialApp(
        title: 'My Profile Bahromjon',
        debugShowCheckedModeBanner: false,
        theme: MyTheme.light,
        home: const MyHomePage(),
      ),
    );
  }

  // TODO: ChatPageda xabarlarni chiqarish
  // TODO: HomePage'dagi xatoni tuzatish.
  // TODO: Play Store'ga yuklash
}

