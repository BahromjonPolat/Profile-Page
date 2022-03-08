import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/widgets/buttons/primary_button.dart';

class ExitAlertDialog extends StatelessWidget {
  const ExitAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // TODO: Titleni AppStringa qo'shish kerak!
      title: const Text('Are you really want to exit?'),
      content: Row(
        children: [
          Expanded(
            child: PrimaryButton(onPressed: _onYesPressed, label: 'Yes'),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: PrimaryButton(
              onPressed: () => Navigator.pop(context),
              label: 'No',
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }

  void _onYesPressed() async {
    await FirebaseAuth.instance.signOut();
    await GetStorage().remove('user');
    CustomNavigator().pushAndRemoveUntil(const MyHomePage());
  }
}
