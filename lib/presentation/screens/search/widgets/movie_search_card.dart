import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/constants/app_svgs.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';

class MovieSearchCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String year;
  final String duration;
  final String rating;
  final String genre;
  final String type;
  final bool isPremium;
  final VoidCallback onTap;
  const MovieSearchCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.year,
    required this.duration,
    required this.rating,
    required this.genre,
    required this.type,
    this.isPremium = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWithRippleEffect(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              RemoteImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 112,
                  height: 112 / 0.66,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: Container(
                  width: 112,
                  height: 112 / 0.66,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.movie,
                    size: 48,
                    color: AppColors.accent,
                  )),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 112,
                  height: 112 / 0.66,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    AppSvgs.movieIcon,
                    height: 48,
                    width: 48,
                    colorFilter: const ColorFilter.mode(
                        AppColors.accent, BlendMode.srcIn),
                  )),
                ),
              ),
            ],
          ),

          const SizedBox(width: 16),

          // Movie Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Premium Badge
                if (isPremium)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      context.text.premium,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                const SizedBox(height: 4),
                // Movie Title
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Year and Duration
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 16, color: AppColors.grey),
                    const SizedBox(width: 4),
                    Text(
                      year,
                      style:
                          const TextStyle(color: AppColors.grey, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Rating and Genre
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        rating,
                        style: const TextStyle(
                          color: AppColors.accent,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      genre,
                      style:
                          const TextStyle(color: AppColors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
