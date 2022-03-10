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
          spacing: 19.w,
          runSpacing: 19.h,
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
          vertical: 19.h,
        ),
        padding: _setContentPadding(),
        decoration: _boxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setTitle(AppStrings.bio),
            SizedBox(height: 10.h),
            MyText(
              AppStrings.locale == 'uz' ? _profile.bioUz : _profile.bio,
              lines: 10,
              color: AppColors.lightGrey,
            ),
          ],
        ),
      );

  MyText _setTitle(String title) {
    return MyText(title, weight: FontWeight.w600);
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r));
  }

  // On the web
  Container _showOnTheWeb() => Container(
        decoration: _boxDecoration(),
        height: 91.h,
        width: double.infinity,
        padding: _setContentPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setTitle(AppStrings.onTheWeb),
            SizedBox(height: getHeight(10.0)),
            Wrap(
              spacing: 19.w,
              children: StaticData.staticProfile.socialMedias
                  .map(
                    (socialMedia) => SvgPicture.asset(
                      IconWithKey.icon(socialMedia.title),
                      height: 32.h,
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
        margin: EdgeInsets.only(top: 19.h),
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
          Expanded(
              child: MyText(data, size: 17.0).onClick(() {
            _onButtonPressed(data);
          })),
        ],
      );

  EdgeInsets _setContentPadding() {
    return EdgeInsets.symmetric(
      vertical: 15.h,
      horizontal: 16.w,
    );
  }

  // Work info
  Container _setWorkInfo(String title, String data) => Container(
        width: 158.w,
        height: 183.h,
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
