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
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: backdropPaths.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final backdropPath = backdropPaths[index];
          return _buildBackdropImage(backdropPath);
        },
      ),
    );
  }

  Widget _buildBackdropImage(String? backdropPath) {
    const double width = 266;
    const double height = 150;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: backdropPath != null
          ? Image.network(
              "https://image.tmdb.org/t/p/w780$backdropPath",
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _buildPlaceholder(width, height),
            )
          : _buildPlaceholder(width, height),
    );
  }

  Widget _buildPlaceholder(double width, double height) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Center(
        child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey[500]),
      ),
    );
  }
}
