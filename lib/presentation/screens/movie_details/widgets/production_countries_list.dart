import 'package:flutter/material.dart';
import 'package:moviealike/data/movie/models/production_country_dto.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';

class ProductionCountriesList extends StatelessWidget {
  final List<ProductionCountryDto> countries;
  final Function(ProductionCountryDto) onTap;

  const ProductionCountriesList({
    super.key,
    required this.countries,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Group countries into rows of 3 items each
    final rows = <Widget>[];
    for (int i = 0; i < countries.length; i += 3) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            3,
            (index) {
              final countryIndex = i + index;
              if (countryIndex < countries.length) {
                final country = countries[countryIndex];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ContainerWithRippleEffect(
                      onTap: () => onTap(country),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Display the flag emoji
                          Text(
                            _getFlagEmoji(country.iso31661),
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 4),
                          // Display the country name
                          Flexible(
                            child: Text(
                              country.name,
                              style: context.typography.heading6.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                              ),
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
      children: rows,
    );
  }

  /// Converts ISO 3166-1 alpha-2 country code to a flag emoji
  String _getFlagEmoji(String countryCode) {
    const int base = 0x1F1E6; // Unicode for regional indicator 'A'
    return String.fromCharCodes(
      countryCode.toUpperCase().codeUnits.map((e) => base + (e - 65)),
    );
  }
}
