// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FavouritesImagesTableData extends DataClass
    implements Insertable<FavouritesImagesTableData> {
  final int id;
  final String largeImageUrl;
  final String userImageUrl;
  final int likes;
  final int views;
  final int comments;
  final int downloads;
  final int imagesize;
  FavouritesImagesTableData(
      {@required this.id,
      @required this.largeImageUrl,
      @required this.userImageUrl,
      @required this.likes,
      @required this.views,
      @required this.comments,
      @required this.downloads,
      @required this.imagesize});
  factory FavouritesImagesTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return FavouritesImagesTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      largeImageUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}large_image_url']),
      userImageUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_image_url']),
      likes: intType.mapFromDatabaseResponse(data['${effectivePrefix}likes']),
      views: intType.mapFromDatabaseResponse(data['${effectivePrefix}views']),
      comments:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}comments']),
      downloads:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}downloads']),
      imagesize:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}imagesize']),
    );
  }
  factory FavouritesImagesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return FavouritesImagesTableData(
      id: serializer.fromJson<int>(json['id']),
      largeImageUrl: serializer.fromJson<String>(json['largeImageUrl']),
      userImageUrl: serializer.fromJson<String>(json['userImageUrl']),
      likes: serializer.fromJson<int>(json['likes']),
      views: serializer.fromJson<int>(json['views']),
      comments: serializer.fromJson<int>(json['comments']),
      downloads: serializer.fromJson<int>(json['downloads']),
      imagesize: serializer.fromJson<int>(json['imagesize']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'largeImageUrl': serializer.toJson<String>(largeImageUrl),
      'userImageUrl': serializer.toJson<String>(userImageUrl),
      'likes': serializer.toJson<int>(likes),
      'views': serializer.toJson<int>(views),
      'comments': serializer.toJson<int>(comments),
      'downloads': serializer.toJson<int>(downloads),
      'imagesize': serializer.toJson<int>(imagesize),
    };
  }

  @override
  FavouritesImagesTableCompanion createCompanion(bool nullToAbsent) {
    return FavouritesImagesTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      largeImageUrl: largeImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(largeImageUrl),
      userImageUrl: userImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(userImageUrl),
      likes:
          likes == null && nullToAbsent ? const Value.absent() : Value(likes),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      comments: comments == null && nullToAbsent
          ? const Value.absent()
          : Value(comments),
      downloads: downloads == null && nullToAbsent
          ? const Value.absent()
          : Value(downloads),
      imagesize: imagesize == null && nullToAbsent
          ? const Value.absent()
          : Value(imagesize),
    );
  }

  FavouritesImagesTableData copyWith(
          {int id,
          String largeImageUrl,
          String userImageUrl,
          int likes,
          int views,
          int comments,
          int downloads,
          int imagesize}) =>
      FavouritesImagesTableData(
        id: id ?? this.id,
        largeImageUrl: largeImageUrl ?? this.largeImageUrl,
        userImageUrl: userImageUrl ?? this.userImageUrl,
        likes: likes ?? this.likes,
        views: views ?? this.views,
        comments: comments ?? this.comments,
        downloads: downloads ?? this.downloads,
        imagesize: imagesize ?? this.imagesize,
      );
  @override
  String toString() {
    return (StringBuffer('FavouritesImagesTableData(')
          ..write('id: $id, ')
          ..write('largeImageUrl: $largeImageUrl, ')
          ..write('userImageUrl: $userImageUrl, ')
          ..write('likes: $likes, ')
          ..write('views: $views, ')
          ..write('comments: $comments, ')
          ..write('downloads: $downloads, ')
          ..write('imagesize: $imagesize')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          largeImageUrl.hashCode,
          $mrjc(
              userImageUrl.hashCode,
              $mrjc(
                  likes.hashCode,
                  $mrjc(
                      views.hashCode,
                      $mrjc(comments.hashCode,
                          $mrjc(downloads.hashCode, imagesize.hashCode))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is FavouritesImagesTableData &&
          other.id == this.id &&
          other.largeImageUrl == this.largeImageUrl &&
          other.userImageUrl == this.userImageUrl &&
          other.likes == this.likes &&
          other.views == this.views &&
          other.comments == this.comments &&
          other.downloads == this.downloads &&
          other.imagesize == this.imagesize);
}

class FavouritesImagesTableCompanion
    extends UpdateCompanion<FavouritesImagesTableData> {
  final Value<int> id;
  final Value<String> largeImageUrl;
  final Value<String> userImageUrl;
  final Value<int> likes;
  final Value<int> views;
  final Value<int> comments;
  final Value<int> downloads;
  final Value<int> imagesize;
  const FavouritesImagesTableCompanion({
    this.id = const Value.absent(),
    this.largeImageUrl = const Value.absent(),
    this.userImageUrl = const Value.absent(),
    this.likes = const Value.absent(),
    this.views = const Value.absent(),
    this.comments = const Value.absent(),
    this.downloads = const Value.absent(),
    this.imagesize = const Value.absent(),
  });
  FavouritesImagesTableCompanion.insert({
    this.id = const Value.absent(),
    @required String largeImageUrl,
    @required String userImageUrl,
    @required int likes,
    @required int views,
    @required int comments,
    @required int downloads,
    @required int imagesize,
  })  : largeImageUrl = Value(largeImageUrl),
        userImageUrl = Value(userImageUrl),
        likes = Value(likes),
        views = Value(views),
        comments = Value(comments),
        downloads = Value(downloads),
        imagesize = Value(imagesize);
  FavouritesImagesTableCompanion copyWith(
      {Value<int> id,
      Value<String> largeImageUrl,
      Value<String> userImageUrl,
      Value<int> likes,
      Value<int> views,
      Value<int> comments,
      Value<int> downloads,
      Value<int> imagesize}) {
    return FavouritesImagesTableCompanion(
      id: id ?? this.id,
      largeImageUrl: largeImageUrl ?? this.largeImageUrl,
      userImageUrl: userImageUrl ?? this.userImageUrl,
      likes: likes ?? this.likes,
      views: views ?? this.views,
      comments: comments ?? this.comments,
      downloads: downloads ?? this.downloads,
      imagesize: imagesize ?? this.imagesize,
    );
  }
}

class $FavouritesImagesTableTable extends FavouritesImagesTable
    with TableInfo<$FavouritesImagesTableTable, FavouritesImagesTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $FavouritesImagesTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _largeImageUrlMeta =
      const VerificationMeta('largeImageUrl');
  GeneratedTextColumn _largeImageUrl;
  @override
  GeneratedTextColumn get largeImageUrl =>
      _largeImageUrl ??= _constructLargeImageUrl();
  GeneratedTextColumn _constructLargeImageUrl() {
    return GeneratedTextColumn(
      'large_image_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userImageUrlMeta =
      const VerificationMeta('userImageUrl');
  GeneratedTextColumn _userImageUrl;
  @override
  GeneratedTextColumn get userImageUrl =>
      _userImageUrl ??= _constructUserImageUrl();
  GeneratedTextColumn _constructUserImageUrl() {
    return GeneratedTextColumn(
      'user_image_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  GeneratedIntColumn _likes;
  @override
  GeneratedIntColumn get likes => _likes ??= _constructLikes();
  GeneratedIntColumn _constructLikes() {
    return GeneratedIntColumn(
      'likes',
      $tableName,
      false,
    );
  }

  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  GeneratedIntColumn _views;
  @override
  GeneratedIntColumn get views => _views ??= _constructViews();
  GeneratedIntColumn _constructViews() {
    return GeneratedIntColumn(
      'views',
      $tableName,
      false,
    );
  }

  final VerificationMeta _commentsMeta = const VerificationMeta('comments');
  GeneratedIntColumn _comments;
  @override
  GeneratedIntColumn get comments => _comments ??= _constructComments();
  GeneratedIntColumn _constructComments() {
    return GeneratedIntColumn(
      'comments',
      $tableName,
      false,
    );
  }

  final VerificationMeta _downloadsMeta = const VerificationMeta('downloads');
  GeneratedIntColumn _downloads;
  @override
  GeneratedIntColumn get downloads => _downloads ??= _constructDownloads();
  GeneratedIntColumn _constructDownloads() {
    return GeneratedIntColumn(
      'downloads',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imagesizeMeta = const VerificationMeta('imagesize');
  GeneratedIntColumn _imagesize;
  @override
  GeneratedIntColumn get imagesize => _imagesize ??= _constructImagesize();
  GeneratedIntColumn _constructImagesize() {
    return GeneratedIntColumn(
      'imagesize',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        largeImageUrl,
        userImageUrl,
        likes,
        views,
        comments,
        downloads,
        imagesize
      ];
  @override
  $FavouritesImagesTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favourites_images_table';
  @override
  final String actualTableName = 'favourites_images_table';
  @override
  VerificationContext validateIntegrity(FavouritesImagesTableCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.largeImageUrl.present) {
      context.handle(
          _largeImageUrlMeta,
          largeImageUrl.isAcceptableValue(
              d.largeImageUrl.value, _largeImageUrlMeta));
    } else if (largeImageUrl.isRequired && isInserting) {
      context.missing(_largeImageUrlMeta);
    }
    if (d.userImageUrl.present) {
      context.handle(
          _userImageUrlMeta,
          userImageUrl.isAcceptableValue(
              d.userImageUrl.value, _userImageUrlMeta));
    } else if (userImageUrl.isRequired && isInserting) {
      context.missing(_userImageUrlMeta);
    }
    if (d.likes.present) {
      context.handle(
          _likesMeta, likes.isAcceptableValue(d.likes.value, _likesMeta));
    } else if (likes.isRequired && isInserting) {
      context.missing(_likesMeta);
    }
    if (d.views.present) {
      context.handle(
          _viewsMeta, views.isAcceptableValue(d.views.value, _viewsMeta));
    } else if (views.isRequired && isInserting) {
      context.missing(_viewsMeta);
    }
    if (d.comments.present) {
      context.handle(_commentsMeta,
          comments.isAcceptableValue(d.comments.value, _commentsMeta));
    } else if (comments.isRequired && isInserting) {
      context.missing(_commentsMeta);
    }
    if (d.downloads.present) {
      context.handle(_downloadsMeta,
          downloads.isAcceptableValue(d.downloads.value, _downloadsMeta));
    } else if (downloads.isRequired && isInserting) {
      context.missing(_downloadsMeta);
    }
    if (d.imagesize.present) {
      context.handle(_imagesizeMeta,
          imagesize.isAcceptableValue(d.imagesize.value, _imagesizeMeta));
    } else if (imagesize.isRequired && isInserting) {
      context.missing(_imagesizeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavouritesImagesTableData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FavouritesImagesTableData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FavouritesImagesTableCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.largeImageUrl.present) {
      map['large_image_url'] =
          Variable<String, StringType>(d.largeImageUrl.value);
    }
    if (d.userImageUrl.present) {
      map['user_image_url'] =
          Variable<String, StringType>(d.userImageUrl.value);
    }
    if (d.likes.present) {
      map['likes'] = Variable<int, IntType>(d.likes.value);
    }
    if (d.views.present) {
      map['views'] = Variable<int, IntType>(d.views.value);
    }
    if (d.comments.present) {
      map['comments'] = Variable<int, IntType>(d.comments.value);
    }
    if (d.downloads.present) {
      map['downloads'] = Variable<int, IntType>(d.downloads.value);
    }
    if (d.imagesize.present) {
      map['imagesize'] = Variable<int, IntType>(d.imagesize.value);
    }
    return map;
  }

  @override
  $FavouritesImagesTableTable createAlias(String alias) {
    return $FavouritesImagesTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FavouritesImagesTableTable _favouritesImagesTable;
  $FavouritesImagesTableTable get favouritesImagesTable =>
      _favouritesImagesTable ??= $FavouritesImagesTableTable(this);
  @override
  List<TableInfo> get allTables => [favouritesImagesTable];
}
