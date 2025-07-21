import 'package:flutter/material.dart';
import 'package:moviealike/data/movie/models/genre_dto.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';

class GenresList extends StatelessWidget {
  final List<GenreDto> genres;
  final Function(GenreDto) onTap;
  const GenresList({super.key, required this.genres, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Group genres into rows of 3 items each
    final rows = <Widget>[];
    for (int i = 0; i < genres.length; i += 3) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            3,
            (index) {
              final genreIndex = i + index;
              if (genreIndex < genres.length) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ContainerWithRippleEffect(
                      onTap: () => onTap(genres[genreIndex]),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.compare,
                              color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              genres[genreIndex].name,
                              style: context.typography.heading6.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                // Add an empty spacer for alignment if there are fewer than 3 items in the row
                return const Spacer();
              }
            },
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: rows,
    );
  }
}
