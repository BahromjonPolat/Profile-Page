import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/widgets/components/my_border_radius.dart';

class ProfileCircleAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileCircleAvatar({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: getHeight(100.0),
          height: getHeight(100.0),
          padding: _isDefault() ? EdgeInsets.all(24.w) : EdgeInsets.zero,
          decoration: MyDecoration.circular(
            border: Border.all(color: AppColors.secondary, width: getWidth(2)),
            color: Colors.transparent,
            radius: 100.0,
          ),
          child: ClipRRect(
            borderRadius:
                MyBorderRadius.circular(radius: _isDefault() ? 0.0 : 100.0),
            child: _isDefault()
                ? SvgPicture.asset(AppIcon.personal)
                : CachedNetworkImage(imageUrl: imageUrl),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: CircleAvatar(
            backgroundColor: AppColors.secondary,
            radius: getWidth(21.43),
            child: SvgPicture.asset(AppIcon.image),
          ).onClick(() {
            // ImageChooser.chooseImage();
          }),
        )
      ],
    );
  }

  bool _isDefault() => imageUrl == 'default';
}
