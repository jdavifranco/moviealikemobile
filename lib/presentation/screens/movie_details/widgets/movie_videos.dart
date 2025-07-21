import 'package:flutter/material.dart';
import 'package:moviealike/domain/movies/models/youtube_video.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/custom_youtube_player.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';

class MovieVideos extends StatefulWidget {
  final List<YoutubeVideo> videos;
  const MovieVideos({
    Key? key,
    required this.videos,
  }) : super(key: key);

  @override
  State<MovieVideos> createState() => _MovieVideosState();
}

class _MovieVideosState extends State<MovieVideos> {
  String? selectedVideoId;
  final ScrollController _scrollController = ScrollController();
  late List<GlobalKey> _itemKeys;
  bool playerIsReady = false;
  double listSize = 150;
  double defaultWidth = 266; // Default width for non-expanded videos
  double defaultHeight = 150; // Default height for non-expanded videos
  double expandedHeight = 220; // Height for the expanded video
  @override
  void initState() {
    super.initState();
    _itemKeys = List.generate(widget.videos.length, (_) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videos.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            context.text.trailersAndVideos,
            style: context.typography.heading3.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            height:
                listSize, // Make the container tall enough for the expanded video
            child: ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.videos.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final video = widget.videos[index];
                final isSelected = selectedVideoId == video.id;
                return Padding(
                  key: _itemKeys[index],
                  padding: EdgeInsets.only(
                      left: index == 0 ? 16 : 6,
                      right: index == widget.videos.length - 1 ? 16 : 6),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    width: isSelected
                        ? MediaQuery.sizeOf(context).width - 24
                        : defaultWidth,
                    height: isSelected ? expandedHeight : defaultHeight,
                    child: isSelected
                        ? _YoutubePlayerVideoItem(
                            video: video,
                            isSelected: selectedVideoId == video.id,
                            onClose: () {
                              setState(() {
                                selectedVideoId = null;
                                playerIsReady = false;
                                listSize = defaultHeight;
                              });
                            },
                            playerIsReady: playerIsReady,
                            onPlayerReady: () {
                              setState(() {
                                playerIsReady = true;
                              });
                            },
                          )
                        : _VideoItem(
                            video: video,
                            width: defaultWidth,
                            height: defaultHeight,
                            onTap: () {
                              setState(() {
                                selectedVideoId = video.id;
                                playerIsReady = false;
                                listSize = expandedHeight;
                              });
                              _scrollToSelectedVideo(index);
                            },
                            placeholderBuilder: _buildPlaceholder,
                          ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder(double width, double height) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Center(
        child: Icon(Icons.ondemand_video, size: 40, color: Colors.grey[500]),
      ),
    );
  }

  void _scrollToSelectedVideo(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = _itemKeys[index].currentContext;
      if (context != null) {
        // Calculate the offset to center the expanded video
        final box = context.findRenderObject() as RenderBox?;
        final listBox = _scrollController.position.context.storageContext
            .findRenderObject() as RenderBox?;
        if (box != null && listBox != null) {
          final itemOffset =
              box.localToGlobal(Offset.zero, ancestor: listBox).dx;
          final itemWidth = isSelected(index)
              ? MediaQuery.sizeOf(context).width - 24
              : defaultWidth;
          final listWidth = listBox.size.width;
          final targetScrollOffset = _scrollController.offset +
              itemOffset -
              (listWidth - itemWidth) / 2;
          _scrollController.animateTo(
            targetScrollOffset,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        } else {
          Scrollable.ensureVisible(
            context,
            duration: const Duration(milliseconds: 400),
            alignment: 0.5,
            curve: Curves.easeInOut,
            alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
          );
        }
      }
    });
  }

  bool isSelected(int index) => selectedVideoId == widget.videos[index].id;
}

class _YoutubePlayerVideoItem extends StatefulWidget {
  final YoutubeVideo video;
  final bool isSelected;
  final VoidCallback onClose;
  final bool playerIsReady;
  final Function() onPlayerReady;

  const _YoutubePlayerVideoItem({
    Key? key,
    required this.video,
    required this.isSelected,
    required this.onClose,
    required this.playerIsReady,
    required this.onPlayerReady,
  }) : super(key: key);

  @override
  State<_YoutubePlayerVideoItem> createState() =>
      _YoutubePlayerVideoItemState();
}

class _YoutubePlayerVideoItemState extends State<_YoutubePlayerVideoItem> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width - 24;
    final double height = width / (16 / 9);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          widget.isSelected
              ? Container(
                  key: ValueKey('player_${widget.video.id}'),
                  width: width,
                  height: height,
                  color: Colors.black.withAlpha(217),
                  child: CustomYoutubePlayer(
                      youtubeId: widget.video.id,
                      onReady: widget.onPlayerReady),
                )
              : const SizedBox.shrink(),
          if (!widget.playerIsReady) ...[
            Stack(
              children: [
                widget.video.thumbnailUrl != null
                    ? Image.network(
                        widget.video.thumbnailUrl!,
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildPlaceholder(width, height),
                      )
                    : _buildPlaceholder(width, height),
                Container(
                  width: width,
                  height: height,
                  color: Colors.black.withAlpha(140),
                ),
                const Positioned.fill(
                  child: Center(
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            strokeWidth: 4,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(AppColors.accent),
                          ),
                          Icon(Icons.play_arrow,
                              color: AppColors.accent, size: 28),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(Icons.close,
                  color: Colors.white.withAlpha(217), size: 32),
              onPressed: widget.onClose,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(double width, double height) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Center(
        child: Icon(Icons.ondemand_video, size: 40, color: Colors.grey[500]),
      ),
    );
  }
}

class _VideoItem extends StatelessWidget {
  final YoutubeVideo video;
  final double width;
  final double height;
  final VoidCallback onTap;
  final Widget Function(double, double) placeholderBuilder;

  const _VideoItem({
    Key? key,
    required this.video,
    required this.width,
    required this.height,
    required this.onTap,
    required this.placeholderBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWithRippleEffect(
      showRipple: false,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black.withAlpha(217),
      ),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            video.thumbnailUrl != null
                ? Image.network(
                    video.thumbnailUrl!,
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        placeholderBuilder(width, height),
                  )
                : placeholderBuilder(width, height),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withAlpha(128),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Text(
                  video.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Icon(Icons.play_circle_fill,
                  color: Colors.white.withAlpha(217), size: 32),
            ),
          ],
        ),
      ),
    );
  }
}
