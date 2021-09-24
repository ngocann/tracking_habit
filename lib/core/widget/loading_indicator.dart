import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(50),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
