import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/domain/movies/models/movie.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MovieCarousel extends StatefulWidget {
  final List<Movie> movies;

  const MovieCarousel({Key? key, required this.movies}) : super(key: key);

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> with OnContextReady {
  late final PageController _pageController;
  late int _currentIndex = 2;
  late double movieWidth;
  late double movieHeight;
  late double totalHeight;

  @override
  void didChangeDependencies() {
    final screenWidth = MediaQuery.of(context).size.width;

    movieWidth = min(screenWidth * 0.7, 400);
    movieHeight = movieWidth / 1.77;
    totalHeight = movieHeight;

    super.didChangeDependencies();
  }

  @override
  void onContextReady(BuildContext context) {
    _pageController = PageController(
        viewportFraction: context.isLargeScreen ? 0.8 : 0.8, initialPage: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: totalHeight,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.movies.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: EdgeInsets.symmetric(
                    horizontal: _currentIndex == index ? 0 : 10),
                height: movieHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    if (_currentIndex == index)
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      ContainerWithRippleEffect(
                        width: movieWidth,
                        onTap: () {
                          GoRouter.of(context)
                              .push('/movie_details/${movie.id}');
                        },
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
                            width: movieWidth,
                            height: movieHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black54,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'On ${movie.releaseDate}',
                              style: context.typography.heading6.copyWith(
                                  color: AppColors.whiteGrey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: widget.movies.length,
      effect: CustomizableEffect(
        activeDotDecoration: DotDecoration(
          width: 30,
          height: 10,
          color: AppColors.accent, // Active bullet color
          borderRadius: BorderRadius.circular(20),
        ),
        dotDecoration: DotDecoration(
          width: 10,
          height: 10,
          color: AppColors.accent.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        spacing: 10.0,
      ),
    );
  }
}

/*## Add Supported Image Sizes  
                                 Min Res      Max Res  
poster   = Poster ............  500 x 750   2000 x 3000  
backdrop = Fanart ............ 1280 x 720   3840 x 2160  
still    = TV Show Episode ... 1280 x 720   3840 x 2160  
profile  = Actors Actresses ..  300 x 450   2000 x 3000  
logo     = TMDb Logo  

## API Supported Image Sizes  

|  poster  | backdrop |  still   | profile  |   logo   |
| :------: | :------: | :------: | :------: | :------: |
| -------- | -------- | -------- |    w45   |    w45   |
|    w92   | -------- |    w92   | -------- |    w92   |
|   w154   | -------- | -------- | -------- |   w154   |
|   w185   | -------- |   w185   |   w185   |   w185   |
| -------- |   w300   |   w300   | -------- |   w300   |
|   w342   | -------- | -------- | -------- | -------- |
|   w500   | -------- | -------- | -------- |   w500   |
| -------- | -------- | -------- |   h632   | -------- |
|   w780   |   w780   | -------- | -------- | -------- |
| -------- |  w1280   | -------- | -------- | -------- |
| original | original | original | original | original |  

Original Size is the size of the uploaded image.  
It can be between Minimum Resolution and Maximum Resolution.  */
