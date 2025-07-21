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
        // Play Button
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
            color: Colors.white,
          ),
          label: Text(
            context.text.trailer,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(width: 16),

        // Download Button
        // _buildCircularButton(
        //   icon: Icons.download,
        //   onPressed: onDownload,
        // ),

        // const SizedBox(width: 16),

        // // External Link Button
        // _buildCircularButton(
        //   icon: Icons.open_in_new,
        //   iconColor: Colors.cyanAccent,
        //   onPressed: onExternalLink,
        // ),
      ],
    );
  }

  // Widget _buildCircularButton({
  //   required IconData icon,
  //   required VoidCallback onPressed,
  //   Color iconColor = Colors.white54,
  // }) {
  //   return InkWell(
  //     onTap: onPressed,
  //     borderRadius: BorderRadius.circular(30),
  //     child: Container(
  //       width: 50,
  //       height: 50,
  //       decoration: BoxDecoration(
  //         color: Colors.black.withOpacity(0.2), // Slight dark overlay
  //         shape: BoxShape.circle,
  //       ),
  //       child: Icon(icon, color: iconColor, size: 24),
  //     ),
  //   );
  // }
}
