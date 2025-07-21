// coverage:ignore-file
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class PathModule {
  @Named("InternalDocuments")
  @singleton
  @preResolve
  Future<Directory> getInternalDocument() {
    return getApplicationDocumentsDirectory();
  }
}
