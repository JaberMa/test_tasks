import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MsgWelcome extends StatelessWidget {
  final String headlineWelcome;
  const MsgWelcome({super.key, required this.headlineWelcome});

  @override
  Widget build(BuildContext context) {
    return Text(
      "msg_welcome".tr(),
      style: const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
