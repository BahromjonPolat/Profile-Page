import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/widgets/my_decoration.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({Key? key}) : super(key: key);
  late int _currentIndex;
  late TabProvider _tabProvider;

  @override
  Widget build(BuildContext context) {
    _tabProvider = context.watch();
    _currentIndex = _tabProvider.index;
    return Container(
      height: getHeight(32.0),
      width: getWidth(194.0),
      padding: MyEdgeInsets.symmetric(h: 6.0, v: 5.0),
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
        child: InkWell(
          onTap: () {
            _tabProvider.onTap(index);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            decoration: MyDecoration.circular(
              color: _currentIndex == index ? ConstColor.secondary : null,
            ),
            child: MyText(
              label,
              color: _checkIndex(index) ? Colors.white : ConstColor.secondary,
              size: 11.0,
              weight: FontWeight.w700,
            ),
          ),
        ),
      );

  bool _checkIndex(int index) => _currentIndex == index ? true : false;

  BorderRadius _setBorderRadius() => BorderRadius.circular(
        getWidth(16.0),
      );
}
