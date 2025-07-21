class YoutubeVideo {
  final String id;
  final String title;
  final String? description;
  final String? thumbnailUrl;
  final String? channelTitle;
  final String? duration; // ISO 8601 or formatted string if available

  YoutubeVideo({
    required this.id,
    required this.title,
    this.description,
    this.thumbnailUrl,
    this.channelTitle,
    this.duration,
  });
}
