import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart'; // Assuming this path for AppColors
import 'package:moviealike/presentation/constants/app_svgs.dart';
import 'package:url_launcher/url_launcher.dart'; // For opening URLs

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          context.text.about,
          style: context.typography.heading4
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
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
              colorFilter:
                  const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.primary,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildAppInfoSection(context),
          const SizedBox(height: 24),
          _buildLegalSection(context),
          const SizedBox(height: 24),
          _buildCreditsSection(context),
          // const SizedBox(height: 24),
          // _buildAdsDisclosure(context),
        ],
      ),
    );
  }

  Widget _buildAppInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.text.appInfo,
          style: context.typography.heading4.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          context.text.appDescription,
          style: context.typography.body2
              .copyWith(color: AppColors.white.withOpacity(0.8)),
        )
      ],
    );
  }

  Widget _buildLegalSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.text.legalPolicies,
          style: context.typography.heading4.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _buildPolicyLink(
          context,
          title: context.text.termsOfService,
          onTap: () async {
            const url = 'https://moviealike.com/termsofservice.html';
            final uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        _buildPolicyLink(
          context,
          title: context.text.privacyPolicy,
          onTap: () async {
            const url = 'https://moviealike.com';
            final uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
      ],
    );
  }

  Widget _buildCreditsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.text.credits,
          style: context.typography.heading4.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () async {
            const url = 'https://www.themoviedb.org/';
            final uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  context.text.tmdbAttribution,
                  style: context.typography.body2
                      .copyWith(color: AppColors.white.withOpacity(0.8)),
                ),
              ),
              Icon(Icons.open_in_new,
                  size: 16, color: AppColors.white.withOpacity(0.6)),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildAdsDisclosure(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         context.text.adsDisclosure,
  //         style: context.typography.heading4.copyWith(
  //           color: AppColors.white,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //       Text(
  //         context.text.adsDisclosureDescription,
  //         style: context.typography.body2
  //             .copyWith(color: AppColors.white.withOpacity(0.8)),
  //       ),
  //     ],
  //   );
  //}

  Widget _buildPolicyLink(BuildContext context,
      {required String title, String? content, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap ??
            () {
              if (content != null) {
                _showPolicyDialog(context, title: title, content: content);
              }
            },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.typography.body2.copyWith(color: AppColors.white),
            ),
            Icon(Icons.arrow_forward_ios,
                size: 16, color: AppColors.white.withOpacity(0.6)),
          ],
        ),
      ),
    );
  }

  void _showPolicyDialog(BuildContext context,
      {required String title, required String content}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Text(content),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(context.text.close),
          ),
        ],
      ),
    );
  }
}
