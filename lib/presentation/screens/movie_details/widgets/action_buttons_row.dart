import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/constants/app_svgs.dart';

class ActionButtonsRow extends StatelessWidget {
  final VoidCallback onPlay;
  final VoidCallback onDownload;
  final VoidCallback onExternalLink;
  final bool isPlaying;
  const ActionButtonsRow({
    Key? key,
    required this.onPlay,
    required this.onDownload,
    required this.onExternalLink,
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: onPlay,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          icon: SvgPicture.asset(
            isPlaying ? AppSvgs.pauseIcon : AppSvgs.playIcon,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          label: Text(
            context.text.trailer,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
