import 'package:flutter/material.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;
  final double rating;
  final VoidCallback onTap;
  final double movieHeight;
  final double movieWidth;
  const MovieCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.rating,
    required this.onTap,
    required this.movieHeight,
    required this.movieWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWithRippleEffect(
      onTap: onTap,
      width: movieWidth,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  width: movieWidth,
                  height: movieHeight,
                  fit: BoxFit.cover,
                ),
              ),
              if (rating > 0)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: context.typography.heading6.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.typography.heading5.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 4, right: 8),
            child: Text(genre,
                overflow: TextOverflow.ellipsis,
                style: context.typography.heading7.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }
}
