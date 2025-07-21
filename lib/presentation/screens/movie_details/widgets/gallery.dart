import 'package:flutter/material.dart';

class BackdropGallery extends StatelessWidget {
  final List<String> backdropPaths;

  const BackdropGallery({
    Key? key,
    required this.backdropPaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Fixed height based on aspect ratio (1.77)
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: backdropPaths.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: 8), // Space between images
        itemBuilder: (context, index) {
          final backdropPath = backdropPaths[index];
          return _buildBackdropImage(backdropPath);
        },
      ),
    );
  }

  Widget _buildBackdropImage(String? backdropPath) {
    final double width = 266; // Width based on aspect ratio (150 * 1.77)
    final double height = 150; // Fixed height

    return ClipRRect(
      borderRadius: BorderRadius.circular(8), // Rounded corners
      child: backdropPath != null
          ? Image.network(
              "https://image.tmdb.org/t/p/w780$backdropPath", // Use w780 for backdrops
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  _buildPlaceholder(width, height),
            )
          : _buildPlaceholder(width, height),
    );
  }

  Widget _buildPlaceholder(double width, double height) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300], // Placeholder background color
      child: Center(
        child:
            Icon(Icons.image_not_supported, size: 40, color: Colors.grey[500]),
      ),
    );
  }
}
