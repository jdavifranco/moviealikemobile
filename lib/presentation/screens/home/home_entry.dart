import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/di/di_setup.dart';
import 'package:moviealike/presentation/screens/home/home_bloc.dart';
import 'package:moviealike/presentation/screens/home/home_screen.dart';

class HomeEntry extends StatelessWidget {
  static const path = '/';
  const HomeEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(getIt(), getIt())..init(),
      child: const HomeScreen(),
    );
  }
}
