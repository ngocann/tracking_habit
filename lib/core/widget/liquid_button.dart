import 'package:flutter/material.dart';

import 'package:tracking_habit/core/extension/context_ext.dart';

class LiquidButton extends StatelessWidget {
  final VoidCallback? onPress;

  final String text;

  LiquidButton({
    Key? key,
    this.onPress,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: context.primaryColor(),
        minimumSize: Size(200, 50),
      ),
      onPressed: onPress ?? null,
      child: const Text('LOGIN'),
    );
  }
}
