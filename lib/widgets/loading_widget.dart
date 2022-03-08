import 'package:flutter/cupertino.dart';
import 'package:profile/core/components/exporting_packages.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 812.h,
      width: 375.w,
      alignment: Alignment.center,
      color: const Color(0x0fdac2c2),
      child: const CupertinoActivityIndicator(),
    );
  }
}
