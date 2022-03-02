import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class ChatPageAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChatPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          CustomIconButton(
            assetIcon: AssetIcon.arrowBack,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Column(
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
          ),
          const Spacer(),
          CircleAvatar(
            backgroundImage: NetworkImage(StaticData.staticProfile.imageUrl),
          ).onClick(()async {
          await  FirebaseAuth.instance.signOut();
          CustomNavigator().pushReplacement(MyHomePage());
          }),
        ],
      ),
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
