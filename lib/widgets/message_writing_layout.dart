import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/widgets/custom_input.dart';

class MessageWritingLayout extends StatelessWidget {
  const MessageWritingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints(maxHeight: getHeight(155.0)),
      child: Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomInput())
        ],
      ),
    );
  }
}
