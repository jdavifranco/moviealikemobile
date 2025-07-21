import 'package:flutter/material.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/extensions/string_extension.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/common/style/typography/app_typography_scheme.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key, required this.controller});
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    final styles = AppTypographyScheme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // if (context.isLargeScreen)
          //   Image.asset(
          //     width: 100,
          //     AppWebps.moviealikeLogo,
          //     color: AppColors.white,
          //   ),
          Center(
            child: IntrinsicWidth(
              child: TabBar(
                tabAlignment: TabAlignment.center,
                controller: controller,
                labelStyle: styles.heading6,
                labelColor: AppColors.accent,
                unselectedLabelColor: AppColors.textPrimary,
                dividerColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    return states.contains(MaterialState.focused)
                        ? null
                        : Colors.transparent;
                  },
                ),
                tabs: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.dimensionScheme.screenMargin),
                    child: Tab(
                      child: IntrinsicWidth(
                          child: Center(
                        child: Text(
                          context.text.home,
                        ),
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.dimensionScheme.screenMargin),
                    child: Tab(
                      child: IntrinsicWidth(
                          child: Center(
                              child: Text(context.text.movies.capitalized))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.dimensionScheme.screenMargin),
                    child: Tab(
                      child: IntrinsicWidth(
                          child: Center(
                              child: Text(context.text.series.capitalized))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
