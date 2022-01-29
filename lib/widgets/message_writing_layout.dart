import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/widgets/custom_input.dart';

class MessageWritingLayout extends StatelessWidget {
  const MessageWritingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MyEdgeInsets.symmetric(v: 16.0, h: 12.0),
      constraints: BoxConstraints(maxHeight: getHeight(155.0)),
      child: Row(
        children: [
          CustomIconButton(onPressed: () {}, assetIcon: AssetIcon.facebook),
          Expanded(child: CustomInput()),
          FloatingActionButton(
            onPressed: () {},
            mini: true,
            elevation: 0.0,
            backgroundColor: ConstColor.text,
            child: const Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }
}
