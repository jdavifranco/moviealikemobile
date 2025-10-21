import 'package:flutter/material.dart';
import 'package:moviealike/domain/search/models/person_details.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/constants/app_svgs.dart';
import 'package:flutter_svg/svg.dart';

class PersonDetailsSection extends StatefulWidget {
  final PersonDetails personDetails;

  const PersonDetailsSection({
    Key? key,
    required this.personDetails,
  }) : super(key: key);

  @override
  State<PersonDetailsSection> createState() => _PersonDetailsSectionState();
}

class _PersonDetailsSectionState extends State<PersonDetailsSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.dimensionScheme.screenMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: RemoteImage(
                  imageUrl: widget.personDetails.profilePath != null
                      ? "https://image.tmdb.org/t/p/w500/${widget.personDetails.profilePath}"
                      : null,
                  width: 120,
                  height: 180,
                  fit: BoxFit.cover,
                  placeholder: Container(
                    width: 120,
                    height: 180,
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: (0.3)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person,
                        color: AppColors.white,
                        size: 48,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 120,
                    height: 180,
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: (0.3)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person,
                        color: AppColors.white,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.personDetails.name ?? "",
                      style: context.typography.heading2.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (widget.personDetails.knownForDepartment?.isNotEmpty ==
                        true) ...[
                      _buildInfoRow(
                        AppSvgs.personIcon,
                        widget.personDetails.knownForDepartment!,
                        context,
                      ),
                      const SizedBox(height: 4),
                    ],
                    if (widget.personDetails.birthday != null) ...[
                      _buildInfoRow(
                        AppSvgs.calendarIcon,
                        _formatDate(widget.personDetails.birthday!),
                        context,
                      ),
                      const SizedBox(height: 4),
                    ],
                    if (widget.personDetails.placeOfBirth != null) ...[
                      _buildInfoRow(
                        AppSvgs.movieIcon,
                        widget.personDetails.placeOfBirth!,
                        context,
                      ),
                      const SizedBox(height: 4),
                    ],
                    if (widget.personDetails.popularity != null &&
                        widget.personDetails.popularity! > 0) ...[
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.orange,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.personDetails.popularity
                                    ?.toStringAsFixed(1) ??
                                "",
                            style: context.typography.heading5.copyWith(
                              color: AppColors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (widget.personDetails.biography?.isNotEmpty == true) ...[
            Text(
              context.text.biography,
              style: context.typography.heading3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            _buildExpandableBiography(context),
            const SizedBox(height: 16),
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
              color: Colors.white.withValues(alpha: (0.8)),
              fontWeight: FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildExpandableBiography(BuildContext context) {
    const int maxLines = 4;
    final biography = widget.personDetails.biography;

    final textSpan = TextSpan(
      text: biography,
      style: context.typography.heading5.copyWith(
        color: Colors.white.withValues(alpha: (0.8)),
        fontWeight: FontWeight.normal,
        height: 1.5,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
        maxWidth: MediaQuery.of(context).size.width -
            (context.dimensionScheme.screenMargin * 2));
    final isLongText = textPainter.didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          biography ?? "",
          style: context.typography.heading5.copyWith(
            color: Colors.white.withValues(alpha: (0.8)),
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
          maxLines: _isExpanded ? null : maxLines,
          overflow: _isExpanded ? null : TextOverflow.ellipsis,
        ),
        if (isLongText) ...[
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? context.text.seeLess : context.text.seeMore,
              style: context.typography.heading5.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return "${date.day}/${date.month}/${date.year}";
    } catch (e) {
      return dateString;
    }
  }
}
