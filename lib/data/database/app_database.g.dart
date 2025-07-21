// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WatchlistMoviesTableTable extends WatchlistMoviesTable
    with TableInfo<$WatchlistMoviesTableTable, WatchlistMovieDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WatchlistMoviesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _movieIdMeta =
      const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int> movieId = GeneratedColumn<int>(
      'movie_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String> genre = GeneratedColumn<String>(
      'genre', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _releaseYearMeta =
      const VerificationMeta('releaseYear');
  @override
  late final GeneratedColumn<String> releaseYear = GeneratedColumn<String>(
      'release_year', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterUrlMeta =
      const VerificationMeta('posterUrl');
  @override
  late final GeneratedColumn<String> posterUrl = GeneratedColumn<String>(
      'poster_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, movieId, title, genre, rating, releaseYear, posterUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'watchlist_movies_table';
  @override
  VerificationContext validateIntegrity(Insertable<WatchlistMovieDto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    } else if (isInserting) {
      context.missing(_genreMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('release_year')) {
      context.handle(
          _releaseYearMeta,
          releaseYear.isAcceptableOrUnknown(
              data['release_year']!, _releaseYearMeta));
    } else if (isInserting) {
      context.missing(_releaseYearMeta);
    }
    if (data.containsKey('poster_url')) {
      context.handle(_posterUrlMeta,
          posterUrl.isAcceptableOrUnknown(data['poster_url']!, _posterUrlMeta));
    } else if (isInserting) {
      context.missing(_posterUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WatchlistMovieDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WatchlistMovieDto(
      movieId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}movie_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      genre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
      releaseYear: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_year'])!,
      posterUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_url'])!,
    );
  }

  @override
  $WatchlistMoviesTableTable createAlias(String alias) {
    return $WatchlistMoviesTableTable(attachedDatabase, alias);
  }
}

class WatchlistMoviesTableCompanion extends UpdateCompanion<WatchlistMovieDto> {
  final Value<int> id;
  final Value<int> movieId;
  final Value<String> title;
  final Value<String> genre;
  final Value<double> rating;
  final Value<String> releaseYear;
  final Value<String> posterUrl;
  const WatchlistMoviesTableCompanion({
    this.id = const Value.absent(),
    this.movieId = const Value.absent(),
    this.title = const Value.absent(),
    this.genre = const Value.absent(),
    this.rating = const Value.absent(),
    this.releaseYear = const Value.absent(),
    this.posterUrl = const Value.absent(),
  });
  WatchlistMoviesTableCompanion.insert({
    this.id = const Value.absent(),
    required int movieId,
    required String title,
    required String genre,
    required double rating,
    required String releaseYear,
    required String posterUrl,
  })  : movieId = Value(movieId),
        title = Value(title),
        genre = Value(genre),
        rating = Value(rating),
        releaseYear = Value(releaseYear),
        posterUrl = Value(posterUrl);
  static Insertable<WatchlistMovieDto> custom({
    Expression<int>? id,
    Expression<int>? movieId,
    Expression<String>? title,
    Expression<String>? genre,
    Expression<double>? rating,
    Expression<String>? releaseYear,
    Expression<String>? posterUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (movieId != null) 'movie_id': movieId,
      if (title != null) 'title': title,
      if (genre != null) 'genre': genre,
      if (rating != null) 'rating': rating,
      if (releaseYear != null) 'release_year': releaseYear,
      if (posterUrl != null) 'poster_url': posterUrl,
    });
  }

  WatchlistMoviesTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? movieId,
      Value<String>? title,
      Value<String>? genre,
      Value<double>? rating,
      Value<String>? releaseYear,
      Value<String>? posterUrl}) {
    return WatchlistMoviesTableCompanion(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      title: title ?? this.title,
      genre: genre ?? this.genre,
      rating: rating ?? this.rating,
      releaseYear: releaseYear ?? this.releaseYear,
      posterUrl: posterUrl ?? this.posterUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String>(genre.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (releaseYear.present) {
      map['release_year'] = Variable<String>(releaseYear.value);
    }
    if (posterUrl.present) {
      map['poster_url'] = Variable<String>(posterUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WatchlistMoviesTableCompanion(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('title: $title, ')
          ..write('genre: $genre, ')
          ..write('rating: $rating, ')
          ..write('releaseYear: $releaseYear, ')
          ..write('posterUrl: $posterUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WatchlistMoviesTableTable watchlistMoviesTable =
      $WatchlistMoviesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [watchlistMoviesTable];
}

typedef $$WatchlistMoviesTableTableCreateCompanionBuilder
    = WatchlistMoviesTableCompanion Function({
  Value<int> id,
  required int movieId,
  required String title,
  required String genre,
  required double rating,
  required String releaseYear,
  required String posterUrl,
});
typedef $$WatchlistMoviesTableTableUpdateCompanionBuilder
    = WatchlistMoviesTableCompanion Function({
  Value<int> id,
  Value<int> movieId,
  Value<String> title,
  Value<String> genre,
  Value<double> rating,
  Value<String> releaseYear,
  Value<String> posterUrl,
});

class $$WatchlistMoviesTableTableFilterComposer
    extends Composer<_$AppDatabase, $WatchlistMoviesTableTable> {
  $$WatchlistMoviesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get movieId => $composableBuilder(
      column: $table.movieId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get genre => $composableBuilder(
      column: $table.genre, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get releaseYear => $composableBuilder(
      column: $table.releaseYear, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get posterUrl => $composableBuilder(
      column: $table.posterUrl, builder: (column) => ColumnFilters(column));
}

class $$WatchlistMoviesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WatchlistMoviesTableTable> {
  $$WatchlistMoviesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get movieId => $composableBuilder(
      column: $table.movieId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genre => $composableBuilder(
      column: $table.genre, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get releaseYear => $composableBuilder(
      column: $table.releaseYear, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get posterUrl => $composableBuilder(
      column: $table.posterUrl, builder: (column) => ColumnOrderings(column));
}

class $$WatchlistMoviesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WatchlistMoviesTableTable> {
  $$WatchlistMoviesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get movieId =>
      $composableBuilder(column: $table.movieId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get genre =>
      $composableBuilder(column: $table.genre, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get releaseYear => $composableBuilder(
      column: $table.releaseYear, builder: (column) => column);

  GeneratedColumn<String> get posterUrl =>
      $composableBuilder(column: $table.posterUrl, builder: (column) => column);
}

class $$WatchlistMoviesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WatchlistMoviesTableTable,
    WatchlistMovieDto,
    $$WatchlistMoviesTableTableFilterComposer,
    $$WatchlistMoviesTableTableOrderingComposer,
    $$WatchlistMoviesTableTableAnnotationComposer,
    $$WatchlistMoviesTableTableCreateCompanionBuilder,
    $$WatchlistMoviesTableTableUpdateCompanionBuilder,
    (
      WatchlistMovieDto,
      BaseReferences<_$AppDatabase, $WatchlistMoviesTableTable,
          WatchlistMovieDto>
    ),
    WatchlistMovieDto,
    PrefetchHooks Function()> {
  $$WatchlistMoviesTableTableTableManager(
      _$AppDatabase db, $WatchlistMoviesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WatchlistMoviesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WatchlistMoviesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WatchlistMoviesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> movieId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> genre = const Value.absent(),
            Value<double> rating = const Value.absent(),
            Value<String> releaseYear = const Value.absent(),
            Value<String> posterUrl = const Value.absent(),
          }) =>
              WatchlistMoviesTableCompanion(
            id: id,
            movieId: movieId,
            title: title,
            genre: genre,
            rating: rating,
            releaseYear: releaseYear,
            posterUrl: posterUrl,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int movieId,
            required String title,
            required String genre,
            required double rating,
            required String releaseYear,
            required String posterUrl,
          }) =>
              WatchlistMoviesTableCompanion.insert(
            id: id,
            movieId: movieId,
            title: title,
            genre: genre,
            rating: rating,
            releaseYear: releaseYear,
            posterUrl: posterUrl,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WatchlistMoviesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $WatchlistMoviesTableTable,
        WatchlistMovieDto,
        $$WatchlistMoviesTableTableFilterComposer,
        $$WatchlistMoviesTableTableOrderingComposer,
        $$WatchlistMoviesTableTableAnnotationComposer,
        $$WatchlistMoviesTableTableCreateCompanionBuilder,
        $$WatchlistMoviesTableTableUpdateCompanionBuilder,
        (
          WatchlistMovieDto,
          BaseReferences<_$AppDatabase, $WatchlistMoviesTableTable,
              WatchlistMovieDto>
        ),
        WatchlistMovieDto,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WatchlistMoviesTableTableTableManager get watchlistMoviesTable =>
      $$WatchlistMoviesTableTableTableManager(_db, _db.watchlistMoviesTable);
}
