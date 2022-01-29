import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class ChatPageAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChatPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MyText(StaticData.staticProfile.firstName),
      actions: [
        CircleAvatar(
          backgroundImage: NetworkImage(StaticData.staticProfile.imageUrl),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, getHeight(56.0));
}
