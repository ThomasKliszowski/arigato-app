// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ReadingProgress extends DataClass implements Insertable<ReadingProgress> {
  final String id;
  final String mangaId;
  final String volumeId;
  final double volumeNumber;
  final String chapterId;
  final double chapterNumber;
  final int lastPage;
  final double progress;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;
  ReadingProgress(
      {@required this.id,
      @required this.mangaId,
      this.volumeId,
      this.volumeNumber,
      this.chapterId,
      this.chapterNumber,
      @required this.lastPage,
      @required this.progress,
      @required this.isRead,
      this.createdAt,
      this.updatedAt});
  factory ReadingProgress.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return ReadingProgress(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      mangaId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}manga_id']),
      volumeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}volume_id']),
      volumeNumber: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}volume_number']),
      chapterId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_id']),
      chapterNumber: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_number']),
      lastPage:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}last_page']),
      progress: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}progress']),
      isRead:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_read']),
      createdAt: $ReadingProgressionsTable.$converter0.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])),
      updatedAt: $ReadingProgressionsTable.$converter1.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || mangaId != null) {
      map['manga_id'] = Variable<String>(mangaId);
    }
    if (!nullToAbsent || volumeId != null) {
      map['volume_id'] = Variable<String>(volumeId);
    }
    if (!nullToAbsent || volumeNumber != null) {
      map['volume_number'] = Variable<double>(volumeNumber);
    }
    if (!nullToAbsent || chapterId != null) {
      map['chapter_id'] = Variable<String>(chapterId);
    }
    if (!nullToAbsent || chapterNumber != null) {
      map['chapter_number'] = Variable<double>(chapterNumber);
    }
    if (!nullToAbsent || lastPage != null) {
      map['last_page'] = Variable<int>(lastPage);
    }
    if (!nullToAbsent || progress != null) {
      map['progress'] = Variable<double>(progress);
    }
    if (!nullToAbsent || isRead != null) {
      map['is_read'] = Variable<bool>(isRead);
    }
    if (!nullToAbsent || createdAt != null) {
      final converter = $ReadingProgressionsTable.$converter0;
      map['created_at'] = Variable<int>(converter.mapToSql(createdAt));
    }
    if (!nullToAbsent || updatedAt != null) {
      final converter = $ReadingProgressionsTable.$converter1;
      map['updated_at'] = Variable<int>(converter.mapToSql(updatedAt));
    }
    return map;
  }

  ReadingProgressionsCompanion toCompanion(bool nullToAbsent) {
    return ReadingProgressionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      mangaId: mangaId == null && nullToAbsent
          ? const Value.absent()
          : Value(mangaId),
      volumeId: volumeId == null && nullToAbsent
          ? const Value.absent()
          : Value(volumeId),
      volumeNumber: volumeNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(volumeNumber),
      chapterId: chapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterId),
      chapterNumber: chapterNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterNumber),
      lastPage: lastPage == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPage),
      progress: progress == null && nullToAbsent
          ? const Value.absent()
          : Value(progress),
      isRead:
          isRead == null && nullToAbsent ? const Value.absent() : Value(isRead),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ReadingProgress.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ReadingProgress(
      id: serializer.fromJson<String>(json['id']),
      mangaId: serializer.fromJson<String>(json['mangaId']),
      volumeId: serializer.fromJson<String>(json['volumeId']),
      volumeNumber: serializer.fromJson<double>(json['volumeNumber']),
      chapterId: serializer.fromJson<String>(json['chapterId']),
      chapterNumber: serializer.fromJson<double>(json['chapterNumber']),
      lastPage: serializer.fromJson<int>(json['lastPage']),
      progress: serializer.fromJson<double>(json['progress']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mangaId': serializer.toJson<String>(mangaId),
      'volumeId': serializer.toJson<String>(volumeId),
      'volumeNumber': serializer.toJson<double>(volumeNumber),
      'chapterId': serializer.toJson<String>(chapterId),
      'chapterNumber': serializer.toJson<double>(chapterNumber),
      'lastPage': serializer.toJson<int>(lastPage),
      'progress': serializer.toJson<double>(progress),
      'isRead': serializer.toJson<bool>(isRead),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ReadingProgress copyWith(
          {String id,
          String mangaId,
          String volumeId,
          double volumeNumber,
          String chapterId,
          double chapterNumber,
          int lastPage,
          double progress,
          bool isRead,
          DateTime createdAt,
          DateTime updatedAt}) =>
      ReadingProgress(
        id: id ?? this.id,
        mangaId: mangaId ?? this.mangaId,
        volumeId: volumeId ?? this.volumeId,
        volumeNumber: volumeNumber ?? this.volumeNumber,
        chapterId: chapterId ?? this.chapterId,
        chapterNumber: chapterNumber ?? this.chapterNumber,
        lastPage: lastPage ?? this.lastPage,
        progress: progress ?? this.progress,
        isRead: isRead ?? this.isRead,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ReadingProgress(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('volumeId: $volumeId, ')
          ..write('volumeNumber: $volumeNumber, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('lastPage: $lastPage, ')
          ..write('progress: $progress, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          mangaId.hashCode,
          $mrjc(
              volumeId.hashCode,
              $mrjc(
                  volumeNumber.hashCode,
                  $mrjc(
                      chapterId.hashCode,
                      $mrjc(
                          chapterNumber.hashCode,
                          $mrjc(
                              lastPage.hashCode,
                              $mrjc(
                                  progress.hashCode,
                                  $mrjc(
                                      isRead.hashCode,
                                      $mrjc(createdAt.hashCode,
                                          updatedAt.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ReadingProgress &&
          other.id == this.id &&
          other.mangaId == this.mangaId &&
          other.volumeId == this.volumeId &&
          other.volumeNumber == this.volumeNumber &&
          other.chapterId == this.chapterId &&
          other.chapterNumber == this.chapterNumber &&
          other.lastPage == this.lastPage &&
          other.progress == this.progress &&
          other.isRead == this.isRead &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ReadingProgressionsCompanion extends UpdateCompanion<ReadingProgress> {
  final Value<String> id;
  final Value<String> mangaId;
  final Value<String> volumeId;
  final Value<double> volumeNumber;
  final Value<String> chapterId;
  final Value<double> chapterNumber;
  final Value<int> lastPage;
  final Value<double> progress;
  final Value<bool> isRead;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ReadingProgressionsCompanion({
    this.id = const Value.absent(),
    this.mangaId = const Value.absent(),
    this.volumeId = const Value.absent(),
    this.volumeNumber = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chapterNumber = const Value.absent(),
    this.lastPage = const Value.absent(),
    this.progress = const Value.absent(),
    this.isRead = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ReadingProgressionsCompanion.insert({
    @required String id,
    @required String mangaId,
    this.volumeId = const Value.absent(),
    this.volumeNumber = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chapterNumber = const Value.absent(),
    @required int lastPage,
    @required double progress,
    @required bool isRead,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : id = Value(id),
        mangaId = Value(mangaId),
        lastPage = Value(lastPage),
        progress = Value(progress),
        isRead = Value(isRead);
  static Insertable<ReadingProgress> custom({
    Expression<String> id,
    Expression<String> mangaId,
    Expression<String> volumeId,
    Expression<double> volumeNumber,
    Expression<String> chapterId,
    Expression<double> chapterNumber,
    Expression<int> lastPage,
    Expression<double> progress,
    Expression<bool> isRead,
    Expression<int> createdAt,
    Expression<int> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mangaId != null) 'manga_id': mangaId,
      if (volumeId != null) 'volume_id': volumeId,
      if (volumeNumber != null) 'volume_number': volumeNumber,
      if (chapterId != null) 'chapter_id': chapterId,
      if (chapterNumber != null) 'chapter_number': chapterNumber,
      if (lastPage != null) 'last_page': lastPage,
      if (progress != null) 'progress': progress,
      if (isRead != null) 'is_read': isRead,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ReadingProgressionsCompanion copyWith(
      {Value<String> id,
      Value<String> mangaId,
      Value<String> volumeId,
      Value<double> volumeNumber,
      Value<String> chapterId,
      Value<double> chapterNumber,
      Value<int> lastPage,
      Value<double> progress,
      Value<bool> isRead,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return ReadingProgressionsCompanion(
      id: id ?? this.id,
      mangaId: mangaId ?? this.mangaId,
      volumeId: volumeId ?? this.volumeId,
      volumeNumber: volumeNumber ?? this.volumeNumber,
      chapterId: chapterId ?? this.chapterId,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      lastPage: lastPage ?? this.lastPage,
      progress: progress ?? this.progress,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mangaId.present) {
      map['manga_id'] = Variable<String>(mangaId.value);
    }
    if (volumeId.present) {
      map['volume_id'] = Variable<String>(volumeId.value);
    }
    if (volumeNumber.present) {
      map['volume_number'] = Variable<double>(volumeNumber.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    if (chapterNumber.present) {
      map['chapter_number'] = Variable<double>(chapterNumber.value);
    }
    if (lastPage.present) {
      map['last_page'] = Variable<int>(lastPage.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (createdAt.present) {
      final converter = $ReadingProgressionsTable.$converter0;
      map['created_at'] = Variable<int>(converter.mapToSql(createdAt.value));
    }
    if (updatedAt.present) {
      final converter = $ReadingProgressionsTable.$converter1;
      map['updated_at'] = Variable<int>(converter.mapToSql(updatedAt.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadingProgressionsCompanion(')
          ..write('id: $id, ')
          ..write('mangaId: $mangaId, ')
          ..write('volumeId: $volumeId, ')
          ..write('volumeNumber: $volumeNumber, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('lastPage: $lastPage, ')
          ..write('progress: $progress, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ReadingProgressionsTable extends ReadingProgressions
    with TableInfo<$ReadingProgressionsTable, ReadingProgress> {
  final GeneratedDatabase _db;
  final String _alias;
  $ReadingProgressionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mangaIdMeta = const VerificationMeta('mangaId');
  GeneratedTextColumn _mangaId;
  @override
  GeneratedTextColumn get mangaId => _mangaId ??= _constructMangaId();
  GeneratedTextColumn _constructMangaId() {
    return GeneratedTextColumn(
      'manga_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _volumeIdMeta = const VerificationMeta('volumeId');
  GeneratedTextColumn _volumeId;
  @override
  GeneratedTextColumn get volumeId => _volumeId ??= _constructVolumeId();
  GeneratedTextColumn _constructVolumeId() {
    return GeneratedTextColumn(
      'volume_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _volumeNumberMeta =
      const VerificationMeta('volumeNumber');
  GeneratedRealColumn _volumeNumber;
  @override
  GeneratedRealColumn get volumeNumber =>
      _volumeNumber ??= _constructVolumeNumber();
  GeneratedRealColumn _constructVolumeNumber() {
    return GeneratedRealColumn(
      'volume_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _chapterIdMeta = const VerificationMeta('chapterId');
  GeneratedTextColumn _chapterId;
  @override
  GeneratedTextColumn get chapterId => _chapterId ??= _constructChapterId();
  GeneratedTextColumn _constructChapterId() {
    return GeneratedTextColumn(
      'chapter_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _chapterNumberMeta =
      const VerificationMeta('chapterNumber');
  GeneratedRealColumn _chapterNumber;
  @override
  GeneratedRealColumn get chapterNumber =>
      _chapterNumber ??= _constructChapterNumber();
  GeneratedRealColumn _constructChapterNumber() {
    return GeneratedRealColumn(
      'chapter_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastPageMeta = const VerificationMeta('lastPage');
  GeneratedIntColumn _lastPage;
  @override
  GeneratedIntColumn get lastPage => _lastPage ??= _constructLastPage();
  GeneratedIntColumn _constructLastPage() {
    return GeneratedIntColumn(
      'last_page',
      $tableName,
      false,
    );
  }

  final VerificationMeta _progressMeta = const VerificationMeta('progress');
  GeneratedRealColumn _progress;
  @override
  GeneratedRealColumn get progress => _progress ??= _constructProgress();
  GeneratedRealColumn _constructProgress() {
    return GeneratedRealColumn(
      'progress',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  GeneratedBoolColumn _isRead;
  @override
  GeneratedBoolColumn get isRead => _isRead ??= _constructIsRead();
  GeneratedBoolColumn _constructIsRead() {
    return GeneratedBoolColumn(
      'is_read',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedIntColumn _createdAt;
  @override
  GeneratedIntColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedIntColumn _constructCreatedAt() {
    return GeneratedIntColumn(
      'created_at',
      $tableName,
      true,
    )..clientDefault = () => const DateTimeConverter().mapToSql(DateTime.now());
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedIntColumn _updatedAt;
  @override
  GeneratedIntColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedIntColumn _constructUpdatedAt() {
    return GeneratedIntColumn(
      'updated_at',
      $tableName,
      true,
    )..clientDefault = () => const DateTimeConverter().mapToSql(DateTime.now());
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        mangaId,
        volumeId,
        volumeNumber,
        chapterId,
        chapterNumber,
        lastPage,
        progress,
        isRead,
        createdAt,
        updatedAt
      ];
  @override
  $ReadingProgressionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'reading_progressions';
  @override
  final String actualTableName = 'reading_progressions';
  @override
  VerificationContext validateIntegrity(Insertable<ReadingProgress> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('manga_id')) {
      context.handle(_mangaIdMeta,
          mangaId.isAcceptableOrUnknown(data['manga_id'], _mangaIdMeta));
    } else if (isInserting) {
      context.missing(_mangaIdMeta);
    }
    if (data.containsKey('volume_id')) {
      context.handle(_volumeIdMeta,
          volumeId.isAcceptableOrUnknown(data['volume_id'], _volumeIdMeta));
    }
    if (data.containsKey('volume_number')) {
      context.handle(
          _volumeNumberMeta,
          volumeNumber.isAcceptableOrUnknown(
              data['volume_number'], _volumeNumberMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id'], _chapterIdMeta));
    }
    if (data.containsKey('chapter_number')) {
      context.handle(
          _chapterNumberMeta,
          chapterNumber.isAcceptableOrUnknown(
              data['chapter_number'], _chapterNumberMeta));
    }
    if (data.containsKey('last_page')) {
      context.handle(_lastPageMeta,
          lastPage.isAcceptableOrUnknown(data['last_page'], _lastPageMeta));
    } else if (isInserting) {
      context.missing(_lastPageMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress'], _progressMeta));
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read'], _isReadMeta));
    } else if (isInserting) {
      context.missing(_isReadMeta);
    }
    context.handle(_createdAtMeta, const VerificationResult.success());
    context.handle(_updatedAtMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReadingProgress map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ReadingProgress.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ReadingProgressionsTable createAlias(String alias) {
    return $ReadingProgressionsTable(_db, alias);
  }

  static TypeConverter<DateTime, int> $converter0 = const DateTimeConverter();
  static TypeConverter<DateTime, int> $converter1 = const DateTimeConverter();
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$Database.connect(DatabaseConnection c) : super.connect(c);
  $ReadingProgressionsTable _readingProgressions;
  $ReadingProgressionsTable get readingProgressions =>
      _readingProgressions ??= $ReadingProgressionsTable(this);
  ReadingProgressionsDao _readingProgressionsDao;
  ReadingProgressionsDao get readingProgressionsDao =>
      _readingProgressionsDao ??= ReadingProgressionsDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [readingProgressions];
}
