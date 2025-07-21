import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moviealike/di/di_setup.dart';
import 'package:moviealike/di/language_module.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/navigation/navigation_controller.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image_cache_manager.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/common/style/font_families.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:quiver/collection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NavigationController.instance;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  await configureDependencies();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.primary,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  PaintingBinding.instance.imageCache.maximumSize = 0;
  PaintingBinding.instance.imageCache.maximumSizeBytes = 0;

  runApp(const MovieAlike());
}

class MovieAlike extends StatelessWidget {
  const MovieAlike({super.key});

  @override
  Widget build(BuildContext context) {
    return RemoteImageCacheManager(
      cacheManager: DefaultCacheManager(),
      cache: LruMap<String, Uint8List>(
        maximumSize: RemoteImageCacheManager.memoryCacheLimit,
      ),
      child: MaterialApp.router(
        routerConfig: NavigationController.router,
        title: 'MovieAlike',
        scrollBehavior: const MaterialScrollBehavior().copyWith(
            //  dragDevices: {PointerDeviceKind.mouse},
            ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accent),
          useMaterial3: true,
          fontFamily: FontFamilies.montserrat,
          extensions: [
            context.typography,
          ],
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale == null) {
            return supportedLocales.first;
          }
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }
}
