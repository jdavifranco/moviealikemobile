import 'package:flutter/material.dart';
import 'package:moviealike/data/movie/models/production_company_dto.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';

class ProductionCompanyList extends StatelessWidget {
  final List<ProductionCompanyDto> companies;
  final Function(ProductionCompanyDto) onTap;

  const ProductionCompanyList({
    super.key,
    required this.companies,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Group companies into rows of 3 items each
    final rows = <Widget>[];
    for (int i = 0; i < companies.length; i += 3) {
      rows.add(
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) {
                final companyIndex = i + index;
                if (companyIndex < companies.length) {
                  final company = companies[companyIndex];
                  return Flexible(
                    fit: FlexFit
                        .loose, // Allow the child to take only as much space as needed
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ContainerWithRippleEffect(
                        onTap: () => onTap(company),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Display the company logo
                            if (company.logoPath != null)
                              RemoteImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w200${company.logoPath}",
                                placeholder: Container(
                                  width: 50,
                                  height: 50,
                                  color: AppColors.secondary,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.accent,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  width: 50,
                                  height: 50,
                                  color: AppColors.secondary,
                                  child: const Icon(
                                    Icons.error,
                                    color: AppColors.accent,
                                  ),
                                ),
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                              )
                            else
                              Container(
                                width: 50,
                                height: 50,
                                color: AppColors.secondary,
                                child: const Icon(
                                  Icons.business,
                                  color: AppColors.accent,
                                ),
                              ),
                            const SizedBox(height: 8),
                            // Display the company name
                            Flexible(
                              child: Text(
                                company.name,
                                style: context.typography.heading6.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
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
        ),
      );
    }

    return Column(
      children: rows,
    );
  }
}
