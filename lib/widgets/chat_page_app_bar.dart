import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/screens/profile/profile_page.dart';
import 'package:profile/widgets/dialogs/exit_alert_dialog.dart';

class ChatPageAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChatPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          _buildLeading(context),
          _buildTitle(),
          const Spacer(),
          _showUserProfile(context),
        ],
      ),
    );
  }

  CustomIconButton _buildLeading(BuildContext context) {
    return CustomIconButton(
      assetIcon: AppIcon.arrowBack,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _showUserProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: CircleAvatar(
        child: SvgPicture.asset(AppIcon.logout),
        // backgroundImage: NetworkImage(StaticData.staticProfile.imageUrl),
      ).onClick(() async {
        showDialog(context: context, builder: (_) => const ExitAlertDialog());
      }),
    );
  }

  Column _buildTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          '${StaticData.staticProfile.firstName} ${StaticData.staticProfile.lastName}',
          size: 16.0,
          weight: FontWeight.w600,
        ),
        MyText(
          _showLastTime(StaticData.staticProfile.dateOfBirth),
          weight: FontWeight.w400,
        )
      ],
    );
  }

  String _showLastTime(DateTime dateTime) {
    DateFormat format = DateFormat('MMM, dd');
    String formatted = format.format(dateTime);
    return 'Last seen at recently';
  }

  @override
  Size get preferredSize => Size(double.infinity, getHeight(56.0));
}
