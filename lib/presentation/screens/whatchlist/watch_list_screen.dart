import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/constants/app_svgs.dart';
import 'package:moviealike/presentation/screens/whatchlist/watch_list_bloc.dart';
import 'package:moviealike/presentation/screens/whatchlist/watch_list_state.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  late final _bloc = BlocProvider.of<WatchListBloc>(context);
  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.sizeOf(context).width / 5;
    final imageHeight = imageWidth / 0.66;
    final cardHeight = imageHeight + 44;
    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.primary,
          centerTitle: true,
          title: Text(
            context.text.watchlist,
            style: context.typography.heading4.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: AppColors.secondary.withAlpha(120),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(
                AppSvgs.arrowBackIcon,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
                height: 24,
                width: 24,
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.primary,
        body: state.movies.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.text.yourWatchlistIsEmpty,
                      style: TextStyle(
                        color: AppColors.white.withOpacity(0.7),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push('/search');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        context.text.addMovieToWatchlist,
                        style: context.typography.body2.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: ListView.builder(
                  itemCount: state.movies.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final movie = state.movies[index];
                    return Container(
                      height: cardHeight,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ContainerWithRippleEffect(
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).push('/movie_details/${movie.movieId}');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    child: RemoteImage(
                                      imageUrl:
                                          "https://image.tmdb.org/t/p/original/${movie.posterUrl}",
                                      width: imageWidth,
                                      height: imageHeight,
                                      fit: BoxFit.cover,
                                      placeholder: Container(
                                        width: MediaQuery.sizeOf(
                                              context,
                                            ).width /
                                            3,
                                        decoration: BoxDecoration(
                                          color: AppColors.secondary,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      errorWidget: (
                                        context,
                                        url,
                                        error,
                                      ) =>
                                          Container(
                                        width: MediaQuery.sizeOf(
                                              context,
                                            ).width /
                                            3,
                                        decoration: BoxDecoration(
                                          color: AppColors.secondary,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            AppSvgs.movieIcon,
                                            height: 48,
                                            colorFilter: const ColorFilter.mode(
                                              AppColors.accent,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      movie.genre,
                                      style: context.typography.body3.copyWith(
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      movie.title,
                                      style:
                                          context.typography.heading4.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              context.text.movie,
                                              style: context.typography.body2
                                                  .copyWith(
                                                color: AppColors.white
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Icon(
                                              Icons.star,
                                              color: AppColors.orange,
                                              size: 14,
                                            ),
                                            const SizedBox(width: 2),
                                            Text(
                                              movie.rating.toStringAsFixed(2),
                                              style: context.typography.body2
                                                  .copyWith(
                                                color: AppColors.orange,
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _bloc.onRemoveFromWatchList(
                                              state.movies[index].movieId,
                                            );
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red.shade400,
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
