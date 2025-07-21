import 'package:flutter/material.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.typography.heading3.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
