import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class HeaderInfo extends StatelessWidget {
  HeaderInfo({Key? key}) : super(key: key);
  late TabProvider _tabProvider;

  @override
  Widget build(BuildContext context) {
    _tabProvider = context.watch();
    return Container(
      decoration: _buildBoxDecoration(),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10.0),
        vertical: getProportionateScreenHeight(10.0),
      ),
      height: getProportionateScreenHeight(250.0),
      child: _isCurrent() ? _showWorkHeader() : _showAboutHeader(),
    );
  }

  Row _showAboutHeader() {
    return Row(
      children: [
        _setProfileImage(),
        SizedBox(width: getProportionateScreenWidth(10.0)),
        _setRightSideInfo(),
      ],
    );
  }

  Row _showWorkHeader() {
    return Row(
      children: [
        _setLeftSideInfo(),
        SizedBox(width: getProportionateScreenWidth(10.0)),
        _setProfileImage(),
      ],
    );
  }

  Expanded _setRightSideInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _setTitle("Bahrom Po'lat"),
          SizedBox(height: getProportionateScreenHeight(14.0)),
          _setAccountInfo('Email', 'bahromjon.ergashboyev@gmail.com'),
          SizedBox(height: getProportionateScreenHeight(14.0)),
          _setAccountInfo('Date of birth', 'June, 18, 1994'),
          SizedBox(height: getProportionateScreenHeight(14.0)),
          _setAccountInfo('Address', 'Tashkent district, Tashkent'),
        ],
      ),
    );
  }

  Expanded _setLeftSideInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _setTitle("Flutter Developer"),
          SizedBox(height: getProportionateScreenHeight(14.0)),
          _setAccountInfo('Type', 'Junior employee'),
          SizedBox(height: getProportionateScreenHeight(14.0)),
          _setAccountInfo('Started', 'Dec 2020'),
          SizedBox(height: getProportionateScreenHeight(14.0)),
          _setAccountInfo('Experience', '1 Year'),
        ],
      ),
    );
  }

  MyTextWidget _setTitle(String title) {
    return MyTextWidget(title, size: 41.0, lines: 2);
  }

  ClipRRect _setProfileImage() => ClipRRect(
        borderRadius: _setBorderRadius(),
        child: Image.network(
          'https://source.unsplash.com/random/4',
          fit: BoxFit.cover,
          height: getProportionateScreenHeight(250.0),
          width: getProportionateScreenWidth(154.0),
        ),
      );

  _setAccountInfo(String title, String data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(title, color: ConstColor.lightGrey, size: 9.0),
          MyTextWidget(data),
        ],
      );

  bool _isCurrent() => _tabProvider.index == 1 ? true : false;

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: _setBorderRadius(),
      color: Colors.white,
    );
  }

  BorderRadius _setBorderRadius() => BorderRadius.circular(
        getProportionateScreenWidth(20.0),
      );
}
