import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/models/profile_info_model.dart';
import 'package:profile/widgets/my_decoration.dart';

class HeaderInfo extends StatelessWidget {
  HeaderInfo({Key? key}) : super(key: key);
  late TabProvider _tabProvider;
  final ProfileInfo _profile = StaticData.staticProfile;

  @override
  Widget build(BuildContext context) {
    _tabProvider = context.watch();
    return Container(
      decoration: MyDecoration.circular(color: Colors.white, radius: 20.0),
      padding: MyEdgeInsets.all(10.0),
      height: getHeight(250.0),
      child: _isCurrent() ? _showWorkHeader() : _showAboutHeader(),
    );
  }

  Row _showAboutHeader() {
    return Row(
      children: [
        _setProfileImage(),
        SizedBox(width: getWidth(10.0)),
        _setRightSideInfo(),
      ],
    );
  }

  Row _showWorkHeader() {
    return Row(
      children: [
        _setLeftSideInfo(),
        SizedBox(width: getWidth(10.0)),
        _setProfileImage(),
      ],
    );
  }

  Expanded _setRightSideInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setTitle(_profile.firstName),
          _setAccountInfo('Email', _profile.email),
          _setAccountInfo('Date of birth', _profile.started.toString()),
          _setAccountInfo('Address', 'Tashkent district, Tashkent'),
        ],
      ),
    );
  }

  Expanded _setLeftSideInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setTitle("Flutter Developer"),
          _setAccountInfo('Type', _profile.type),
          _setAccountInfo('Started', _profile.started.toString()),
          _setAccountInfo('Experience', '${_profile.experience} Year'),
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
          _profile.imageUrl,
          fit: BoxFit.cover,
          height: getHeight(250.0),
          width: getWidth(154.0),
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

  BorderRadius _setBorderRadius() => BorderRadius.circular(
        getWidth(20.0),
      );
}
