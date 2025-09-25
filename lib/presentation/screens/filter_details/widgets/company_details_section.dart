import 'package:flutter/material.dart';
import 'package:moviealike/domain/search/models/company_details.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/constants/app_svgs.dart';
import 'package:flutter_svg/svg.dart';

class CompanyDetailsSection extends StatelessWidget {
  final CompanyDetails companyDetails;

  const CompanyDetailsSection({
    Key? key,
    required this.companyDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.dimensionScheme.screenMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Logo and Basic Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.secondary.withOpacity(0.2),
                  ),
                ),
                child: companyDetails.logoPath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: RemoteImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/w500/${companyDetails.logoPath}",
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                          placeholder: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.business,
                                color: AppColors.white,
                                size: 48,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.business,
                                color: AppColors.white,
                                size: 48,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Center(
                        child: Icon(
                          Icons.business,
                          color: AppColors.white,
                          size: 48,
                        ),
                      ),
              ),
              const SizedBox(width: 16),
              // Basic Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyDetails.name,
                      style: context.typography.heading2.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (companyDetails.headquarters.isNotEmpty) ...[
                      _buildInfoRow(
                        AppSvgs
                            .movieIcon, // Using movie icon as placeholder for location
                        companyDetails.headquarters,
                        context,
                      ),
                      const SizedBox(height: 4),
                    ],
                    if (companyDetails.originCountry.isNotEmpty) ...[
                      _buildInfoRow(
                        AppSvgs
                            .calendarIcon, // Using calendar icon as placeholder for country
                        companyDetails.originCountry,
                        context,
                      ),
                      const SizedBox(height: 4),
                    ],
                    if (companyDetails.homepage != null &&
                        companyDetails.homepage!.isNotEmpty) ...[
                      _buildInfoRow(
                        AppSvgs
                            .personIcon, // Using person icon as placeholder for website
                        "Website Available",
                        context,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Description
          if (companyDetails.description.isNotEmpty) ...[
            Text(
              context.text.overview,
              style: context.typography.heading3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              companyDetails.description,
              style: context.typography.heading5.copyWith(
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.normal,
                height: 1.5,
              ),
            ),
          ] else ...[
            Text(
              context.text.overview,
              style: context.typography.heading3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "No description available for this company.",
              style: context.typography.heading5.copyWith(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(String iconAsset, String text, BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconAsset,
          colorFilter: const ColorFilter.mode(
            AppColors.grey,
            BlendMode.srcIn,
          ),
          height: 16,
          width: 16,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: context.typography.heading5.copyWith(
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
