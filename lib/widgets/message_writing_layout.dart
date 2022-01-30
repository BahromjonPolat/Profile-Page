import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MessageWritingLayout extends StatelessWidget {
   MessageWritingLayout({Key? key}) : super(key: key);
   final TextEditingController _editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MyEdgeInsets.symmetric(v: 16.0, h: 12.0),
      constraints: BoxConstraints(maxHeight: getHeight(79.0)),
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomIconButton(onPressed: () {}, assetIcon: AssetIcon.emoticon),
          _buildSizedBox(),
          Expanded(child: CustomInput(controller: _editingController)),
          _buildSizedBox(),
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

  SizedBox _buildSizedBox() => SizedBox(width: getWidth(12.0));
}
