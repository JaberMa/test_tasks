import 'package:flutter/material.dart';
import 'package:test_tasks/utils/constants/app_strings.dart';

class MsgWelcome extends StatelessWidget {
  final String headlineWelcome;
  const MsgWelcome({super.key, required this.headlineWelcome});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.headlineWelcome,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          AppStrings.messageWelcome,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
