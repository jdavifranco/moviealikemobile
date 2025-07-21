// coverage:ignore-file
import 'dart:typed_data';

import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:quiver/collection.dart';

class RemoteImageCacheManager extends InheritedWidget {
  static const memoryCacheLimit = 100;
  final CacheManager cacheManager;
  final LruMap cache;

  const RemoteImageCacheManager({
    super.key,
    required this.cacheManager,
    required this.cache,
    required super.child,
  });

  static RemoteImageCacheManager? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RemoteImageCacheManager>();
  }

  Uint8List? getCachedImage(Uri uri) {
    return cache[uri.toString()];
  }

  Future<void> saveImageToCache(File file, Uri uri) async {
    final bytes = await file.readAsBytes();
    cache[uri.toString()] = bytes;
    return;
  }

  static RemoteImageCacheManager of(BuildContext context) {
    final RemoteImageCacheManager? result = maybeOf(context);
    assert(result != null, 'No CacheManager found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(RemoteImageCacheManager oldWidget) => false;
}
