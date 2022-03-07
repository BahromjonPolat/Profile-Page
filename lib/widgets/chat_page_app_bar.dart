import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/screens/profile/profile_page.dart';

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
          _showUserProfile(),
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

  Widget _showUserProfile() {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: CircleAvatar(
        backgroundImage: NetworkImage(StaticData.staticProfile.imageUrl),
      ).onClick(() async {
        // await FirebaseAuth.instance.signOut();
        CustomNavigator().push(const UserProfilePage());
      }),
    );
  }

  Column _buildTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          StaticData.staticProfile.firstName,
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
    return 'Last seen at $formatted';
  }

  @override
  Size get preferredSize => Size(double.infinity, getHeight(56.0));
}
