import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/provider/user_profile_provider.dart';
import 'package:profile/services/fire_store_service.dart';
import 'package:profile/widgets/dialogs/exit_alert_dialog.dart';
import 'package:profile/widgets/inputs/edit_profile_input.dart';
import 'package:profile/widgets/profile_circle_avatar.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late UserModel _user;
  final String _uid = FirebaseAuth.instance.currentUser!.uid;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    FireStoreService().getUserById(_uid).then((value) {
      _user = value;
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => UserProfileProvider(),
      builder: (ctx, w) {
        return Scaffold(
          body: _isLoading
              ? const Center(child: CupertinoActivityIndicator())
              : _buildSafeArea(),
        );
      },
    );
  }

  SafeArea _buildSafeArea() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            Form(child: Column(
              children: [
                EditProfileInput(
                  controller: TextEditingController(),
                  assetIcon: AppIcon.personal,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  _header() => Row(
        children: [
          const ProfileCircleAvatar(imageUrl: 'default'),
          SizedBox(width: 16.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                _user.fullName!,
                size: 18.0,
              ),
              MyText(_user.email!),
            ],
          ),
          const Spacer(),
          CustomIconButton(
            assetIcon: AppIcon.logout,
            onPressed: _onLogoutButtonPressed,
          )
        ],
      ).sp(h: 16.0, v: 24.h);

  void _onLogoutButtonPressed() {
    showDialog(context: context, builder: (_) => const ExitAlertDialog());
  }
}
