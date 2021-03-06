import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MessageWritingLayout extends StatelessWidget {
  const MessageWritingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => MessageProvider(),
      builder: (ctx, w) {
        MessageProvider provider = ctx.watch();
        return Container(
          padding: MyEdgeInsets.symmetric(v: 16.0, h: 12.0),
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomIconButton(
                onPressed: () => Fluttertoast.showToast(msg: 'Soon'),
                assetIcon: AppIcon.image,
                color: AppColors.text,
              ),
              _buildSizedBox(),
              Expanded(
                child: CustomInput(controller: provider.messageController),
              ),
              _buildSizedBox(),
              _buildFloatingActionButton(provider),
            ],
          ),
        );
      },
    );
  }

  FloatingActionButton _buildFloatingActionButton(MessageProvider provider) {
    return FloatingActionButton(
      onPressed: provider.sendMessage,
      mini: true,
      elevation: 0.0,
      backgroundColor: AppColors.secondary,
      child: SvgPicture.asset(AppIcon.send, color: Colors.white),
    );
  }

  SizedBox _buildSizedBox() => SizedBox(width: getWidth(12.0));
}
