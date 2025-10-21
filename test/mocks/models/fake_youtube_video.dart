import 'package:faker/faker.dart';
import 'package:moviealike/domain/movies/models/youtube_video.dart';

YoutubeVideo getFakeYoutubeVideo({
  String? id,
  String? title,
  String? thumbnailUrl,
  String? channelTitle,
  String? description,
  String? duration,
}) =>
    YoutubeVideo(
      id: id ?? faker.randomGenerator.string(10),
      title: title ?? faker.lorem.sentence(),
      thumbnailUrl: thumbnailUrl ?? faker.image.loremPicsum(),
      channelTitle: channelTitle ?? faker.company.name(),
      description: description ?? faker.lorem.sentence(),
      duration: duration ?? 'PT2M30S',
    );
