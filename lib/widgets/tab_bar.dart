import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';


class CustomTabBar extends StatelessWidget {
  CustomTabBar({Key? key}) : super(key: key);
  late int _currentIndex;
  late TabProvider _tabProvider;

  @override
  Widget build(BuildContext context) {
    _tabProvider = context.watch();
    _currentIndex = _tabProvider.index;
    return Container(
      height: getProportionateScreenHeight(32.0),
      width: getProportionateScreenWidth(194.0),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(6.0),
        vertical: getProportionateScreenHeight(5.0),
      ),
      decoration: BoxDecoration(
        borderRadius: _setBorderRadius(),
        color: Colors.white,
      ),
      child: Row(
        children: [
          _setButton('About', 0),
          _setButton('Work', 1),
        ],
      ),
    );
  }

  Expanded _setButton(
    String label,
    int index,
  ) =>
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            _tabProvider.onTap(index);
          },
          child: MyTextWidget(
            label,
            color: _checkIndex(index) ? Colors.white : ConstColor.secondary,
            size: 11.0,
            weight: FontWeight.w700,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shadowColor: Colors.transparent,
            primary: _checkIndex(index) ? ConstColor.secondary : Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: _setBorderRadius()),
          ),
        ),
      );

  bool _checkIndex(int index) => _currentIndex == index ? true : false;

  BorderRadius _setBorderRadius() => BorderRadius.circular(
        getProportionateScreenWidth(16.0),
      );
}
