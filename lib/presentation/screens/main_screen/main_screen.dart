import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/presentation/common/navigation/custom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  const MainScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavBar(
        currentRoute:
            GoRouter.of(context).routerDelegate.currentConfiguration.fullPath,
      ),
    );
  }
}
