import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/widgets/my_border_radius.dart';
class  ProfileCircleAvatar extends StatelessWidget {
  final String imageUrl;

  ProfileCircleAvatar({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: getHeight(100.0),
          height: getHeight(100.0),
          padding: _isDefault() ? EdgeInsets.all(24.w) : EdgeInsets.zero,
          decoration: MyDecoration.circular(
            border: Border.all(color: AppColors.primary, width: getWidth(2)),
            color: Colors.transparent,
            radius: 100.0,
          ),
          child: ClipRRect(
            borderRadius: MyBorderRadius.circular(radius: _isDefault() ? 0.0 : 100.0),
            child:_isDefault()
                ? SvgPicture.asset(AssetIcon.gitHub)
                : CachedNetworkImage(imageUrl: imageUrl),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: getWidth(21.43),
            child: SvgPicture.asset(AssetIcon.edit),
          ).onClick(() {
            // ImageChooser.chooseImage();
          }),
        )
      ],
    );
  }
  bool _isDefault() => imageUrl=='default';
}