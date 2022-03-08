import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/core/components/icon_with_key.dart';

class FooterInfo extends StatelessWidget {
  FooterInfo({Key? key}) : super(key: key);

  late TabProvider _tabProvider;
  final ProfileModel _profile = StaticData.staticProfile;

  @override
  Widget build(BuildContext context) {
    _tabProvider = context.watch();
    return _tabProvider.index == 0 ? _showAbout() : _showWorks();
  }

  Column _showAbout() => Column(
        children: [
          _setBio(),
          _showOnTheWeb(),
          _showContactInfo(),
        ],
      );

  Padding _showWorks() => Padding(
        padding: EdgeInsets.symmetric(vertical: getHeight(21.0)),
        child: Wrap(
          spacing: getWidth(19.0),
          runSpacing: getHeight(19.0),
          children: [
            _setWorkInfo(AppStrings.projectsDone, '${_profile.projectsDone}'),
            _setWorkInfo(AppStrings.successRate, '${_profile.successRate}%'),
            _setWorkInfo(AppStrings.teams, '${_profile.teams}'),
            _setWorkInfo(AppStrings.clientReports, '${_profile.clientReports}'),
          ],
        ),
      );

  Container _setBio() => Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: getHeight(19.0),
        ),
        padding: _setContentPadding(),
        decoration: _boxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setTitle(AppStrings.bio),
            SizedBox(height: getHeight(10.0)),
            MyText(_profile.bio, lines: 10, color: AppColors.lightGrey),
          ],
        ),
      );

  MyText _setTitle(String title) {
    return MyText(title, weight: FontWeight.w600);
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(getWidth(14.0)));
  }

  // On the web
  Container _showOnTheWeb() => Container(
        decoration: _boxDecoration(),
        height: getHeight(91.0),
        width: double.infinity,
        padding: _setContentPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setTitle(AppStrings.onTheWeb),
            SizedBox(height: getHeight(10.0)),
            Wrap(
              spacing: getWidth(19.0),
              children: StaticData.staticProfile.socialMedias
                  .map(
                    (socialMedia) => SvgPicture.asset(
                      IconWithKey.icon(socialMedia.title),
                      height: getHeight(32.0),
                    ).onClick(() {
                      _onButtonPressed(socialMedia.url);
                    }),
                  )
                  .toList(),
            ),
          ],
        ),
      );

  Container _showContactInfo() => Container(
        padding: _setContentPadding(),
        decoration: _boxDecoration(),
        margin: EdgeInsets.only(top: getHeight(19.0)),
        child: Column(
          children: [
            _setData(AppStrings.website, _profile.webSite),
            // SizedBox(height: getHeight(22.0)),
            // _setData(AppStrings.phone, _profile.phone),
          ],
        ),
      );

  Row _setData(String title, String data) => Row(
        children: [
          Expanded(child: _setTitle(title)),
          Expanded(child: MyText(data, size: 17.0).onClick(() {
            _onButtonPressed(data);
          })),
        ],
      );

  EdgeInsets _setContentPadding() {
    return EdgeInsets.symmetric(
      vertical: getHeight(15.0),
      horizontal: getWidth(16.0),
    );
  }

  // Work info
  Container _setWorkInfo(String title, String data) => Container(
        width: getWidth(158.0),
        height: getHeight(183.0),
        decoration: _boxDecoration(),
        padding: _setContentPadding(),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(data, size: 58.0),
            MyText(title, size: 18.0, lines: 2, align: TextAlign.center),
          ],
        ),
      );

  void _onButtonPressed(String urlString) async {
    await launch(urlString);
  }
}
