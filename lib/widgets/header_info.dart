import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class HeaderInfo extends StatelessWidget {
  HeaderInfo({Key? key}) : super(key: key);
  late TabProvider _tabProvider;
  final ProfileModel _profile = StaticData.staticProfile;

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
          _setAccountInfo(
            'Date of birth',
            _formattedDate(_profile.dateOfBirth, 'MMMM, dd, yyyy'),
          ),
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
          _setAccountInfo('Started', _formattedDate(_profile.started, 'yMMM')),
          _setAccountInfo('Experience', '${_profile.experience} Year'),
        ],
      ),
    );
  }

  MyText _setTitle(String title) {
    return MyText(title, size: 41.0, lines: 2);
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
          MyText(title, color: ConstColor.lightGrey, size: 9.0),
          MyText(data),
        ],
      );

  String _formattedDate(DateTime dateTime, String format) {
    final DateFormat dateFormat = DateFormat(format);
    final String formatted = dateFormat.format(dateTime);
    DateFormat.ABBR_MONTH;
    return formatted;
  }

  bool _isCurrent() => _tabProvider.index == 1 ? true : false;

  BorderRadius _setBorderRadius() => BorderRadius.circular(
        getWidth(20.0),
      );
}
