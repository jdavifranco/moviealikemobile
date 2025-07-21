import 'package:flutter/material.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';

class GlobalDialog extends StatelessWidget {
  final VoidCallback onClickToAction;

  const GlobalDialog({
    super.key,
    required this.onClickToAction,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(children: [
        SizedBox(height: 20),
        Text(
          context.text.loginRequired,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          context.text.loginRequiredMessage,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
      ]),
    );
  }
}
