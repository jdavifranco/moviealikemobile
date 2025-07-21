import 'package:flutter/widgets.dart';
import 'package:moviealike/presentation/screens/about/about_screen.dart';

class AboutEntry extends StatelessWidget {
  static const path = '/about';
  const AboutEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutScreen();
  }
}
