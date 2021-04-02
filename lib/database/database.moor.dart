// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Manga extends DataClass implements Insertable<Manga> {
  final String id;
  final String title;
  final String description;
  final String cover;
  final String authors;
  final int otherTitles;
  final DateTime createdAt;
  final DateTime updatedAt;
  Manga(
      {@required this.id,
      @required this.title,
      this.description,
      this.cover,
      this.authors,
      @required this.otherTitles,
      @required this.createdAt,
      @required this.updatedAt});
  factory Manga.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Manga(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      cover:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}cover']),
      authors:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}authors']),
      otherTitles: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}other_titles']),
      createdAt: $MangasTable.$converter0.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])),
      updatedAt: $MangasTable.$converter1.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || cover != null) {
      map['cover'] = Variable<String>(cover);
    }
    if (!nullToAbsent || authors != null) {
      map['authors'] = Variable<String>(authors);
    }
    if (!nullToAbsent || otherTitles != null) {
      map['other_titles'] = Variable<int>(otherTitles);
    }
    if (!nullToAbsent || createdAt != null) {
      final converter = $MangasTable.$converter0;
      map['created_at'] = Variable<int>(converter.mapToSql(createdAt));
    }
    if (!nullToAbsent || updatedAt != null) {
      final converter = $MangasTable.$converter1;
      map['updated_at'] = Variable<int>(converter.mapToSql(updatedAt));
    }
    return map;
  }

  MangasCompanion toCompanion(bool nullToAbsent) {
    return MangasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      cover:
          cover == null && nullToAbsent ? const Value.absent() : Value(cover),
      authors: authors == null && nullToAbsent
          ? const Value.absent()
          : Value(authors),
      otherTitles: otherTitles == null && nullToAbsent
          ? const Value.absent()
          : Value(otherTitles),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Manga.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Manga(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      cover: serializer.fromJson<String>(json['cover']),
      authors: serializer.fromJson<String>(json['authors']),
      otherTitles: serializer.fromJson<int>(json['otherTitles']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'cover': serializer.toJson<String>(cover),
      'authors': serializer.toJson<String>(authors),
      'otherTitles': serializer.toJson<int>(otherTitles),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Manga copyWith(
          {String id,
          String title,
          String description,
          String cover,
          String authors,
          int otherTitles,
          DateTime createdAt,
          DateTime updatedAt}) =>
      Manga(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        cover: cover ?? this.cover,
        authors: authors ?? this.authors,
        otherTitles: otherTitles ?? this.otherTitles,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Manga(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('cover: $cover, ')
          ..write('authors: $authors, ')
          ..write('otherTitles: $otherTitles, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  cover.hashCode,
                  $mrjc(
                      authors.hashCode,
                      $mrjc(otherTitles.hashCode,
                          $mrjc(createdAt.hashCode, updatedAt.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Manga &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.cover == this.cover &&
          other.authors == this.authors &&
          other.otherTitles == this.otherTitles &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MangasCompanion extends UpdateCompanion<Manga> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> cover;
  final Value<String> authors;
  final Value<int> otherTitles;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const MangasCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.cover = const Value.absent(),
    this.authors = const Value.absent(),
    this.otherTitles = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MangasCompanion.insert({
    @required String id,
    @required String title,
    this.description = const Value.absent(),
    this.cover = const Value.absent(),
    this.authors = const Value.absent(),
    @required int otherTitles,
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : id = Value(id),
        title = Value(title),
        otherTitles = Value(otherTitles),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Manga> custom({
    Expression<String> id,
    Expression<String> title,
    Expression<String> description,
    Expression<String> cover,
    Expression<String> authors,
    Expression<int> otherTitles,
    Expression<int> createdAt,
    Expression<int> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (cover != null) 'cover': cover,
      if (authors != null) 'authors': authors,
      if (otherTitles != null) 'other_titles': otherTitles,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MangasCompanion copyWith(
      {Value<String> id,
      Value<String> title,
      Value<String> description,
      Value<String> cover,
      Value<String> authors,
      Value<int> otherTitles,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return MangasCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      cover: cover ?? this.cover,
      authors: authors ?? this.authors,
      otherTitles: otherTitles ?? this.otherTitles,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cover.present) {
      map['cover'] = Variable<String>(cover.value);
    }
    if (authors.present) {
      map['authors'] = Variable<String>(authors.value);
    }
    if (otherTitles.present) {
      map['other_titles'] = Variable<int>(otherTitles.value);
    }
    if (createdAt.present) {
      final converter = $MangasTable.$converter0;
      map['created_at'] = Variable<int>(converter.mapToSql(createdAt.value));
    }
    if (updatedAt.present) {
      final converter = $MangasTable.$converter1;
      map['updated_at'] = Variable<int>(converter.mapToSql(updatedAt.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MangasCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('cover: $cover, ')
          ..write('authors: $authors, ')
          ..write('otherTitles: $otherTitles, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MangasTable extends Mangas with TableInfo<$MangasTable, Manga> {
  final GeneratedDatabase _db;
  final String _alias;
  $MangasTable(this._db, [this._alias]);
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

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _coverMeta = const VerificationMeta('cover');
  GeneratedTextColumn _cover;
  @override
  GeneratedTextColumn get cover => _cover ??= _constructCover();
  GeneratedTextColumn _constructCover() {
    return GeneratedTextColumn(
      'cover',
      $tableName,
      true,
    );
  }

  final VerificationMeta _authorsMeta = const VerificationMeta('authors');
  GeneratedTextColumn _authors;
  @override
  GeneratedTextColumn get authors => _authors ??= _constructAuthors();
  GeneratedTextColumn _constructAuthors() {
    return GeneratedTextColumn(
      'authors',
      $tableName,
      true,
    );
  }

  final VerificationMeta _otherTitlesMeta =
      const VerificationMeta('otherTitles');
  GeneratedIntColumn _otherTitles;
  @override
  GeneratedIntColumn get otherTitles =>
      _otherTitles ??= _constructOtherTitles();
  GeneratedIntColumn _constructOtherTitles() {
    return GeneratedIntColumn(
      'other_titles',
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
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedIntColumn _updatedAt;
  @override
  GeneratedIntColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedIntColumn _constructUpdatedAt() {
    return GeneratedIntColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        cover,
        authors,
        otherTitles,
        createdAt,
        updatedAt
      ];
  @override
  $MangasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'mangas';
  @override
  final String actualTableName = 'mangas';
  @override
  VerificationContext validateIntegrity(Insertable<Manga> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('cover')) {
      context.handle(
          _coverMeta, cover.isAcceptableOrUnknown(data['cover'], _coverMeta));
    }
    if (data.containsKey('authors')) {
      context.handle(_authorsMeta,
          authors.isAcceptableOrUnknown(data['authors'], _authorsMeta));
    }
    if (data.containsKey('other_titles')) {
      context.handle(
          _otherTitlesMeta,
          otherTitles.isAcceptableOrUnknown(
              data['other_titles'], _otherTitlesMeta));
    } else if (isInserting) {
      context.missing(_otherTitlesMeta);
    }
    context.handle(_createdAtMeta, const VerificationResult.success());
    context.handle(_updatedAtMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Manga map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Manga.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MangasTable createAlias(String alias) {
    return $MangasTable(_db, alias);
  }

  static TypeConverter<DateTime, int> $converter0 = const DateTimeConverter();
  static TypeConverter<DateTime, int> $converter1 = const DateTimeConverter();
}

class Volume extends DataClass implements Insertable<Volume> {
  final String id;
  final double number;
  final String title;
  final String description;
  final String ean13;
  final String cover;
  final int pageCount;
  final String mangaId;
  final DateTime publicationDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  Volume(
      {@required this.id,
      @required this.number,
      @required this.title,
      @required this.description,
      this.ean13,
      this.cover,
      @required this.pageCount,
      @required this.mangaId,
      this.publicationDate,
      @required this.createdAt,
      @required this.updatedAt});
  factory Volume.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final intType = db.typeSystem.forDartType<int>();
    return Volume(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      number:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}number']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      ean13:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}ean13']),
      cover:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}cover']),
      pageCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}page_count']),
      mangaId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}manga_id']),
      publicationDate: $VolumesTable.$converter0.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}publication_date'])),
      createdAt: $VolumesTable.$converter1.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])),
      updatedAt: $VolumesTable.$converter2.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<double>(number);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || ean13 != null) {
      map['ean13'] = Variable<String>(ean13);
    }
    if (!nullToAbsent || cover != null) {
      map['cover'] = Variable<String>(cover);
    }
    if (!nullToAbsent || pageCount != null) {
      map['page_count'] = Variable<int>(pageCount);
    }
    if (!nullToAbsent || mangaId != null) {
      map['manga_id'] = Variable<String>(mangaId);
    }
    if (!nullToAbsent || publicationDate != null) {
      final converter = $VolumesTable.$converter0;
      map['publication_date'] =
          Variable<int>(converter.mapToSql(publicationDate));
    }
    if (!nullToAbsent || createdAt != null) {
      final converter = $VolumesTable.$converter1;
      map['created_at'] = Variable<int>(converter.mapToSql(createdAt));
    }
    if (!nullToAbsent || updatedAt != null) {
      final converter = $VolumesTable.$converter2;
      map['updated_at'] = Variable<int>(converter.mapToSql(updatedAt));
    }
    return map;
  }

  VolumesCompanion toCompanion(bool nullToAbsent) {
    return VolumesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      ean13:
          ean13 == null && nullToAbsent ? const Value.absent() : Value(ean13),
      cover:
          cover == null && nullToAbsent ? const Value.absent() : Value(cover),
      pageCount: pageCount == null && nullToAbsent
          ? const Value.absent()
          : Value(pageCount),
      mangaId: mangaId == null && nullToAbsent
          ? const Value.absent()
          : Value(mangaId),
      publicationDate: publicationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publicationDate),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Volume.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Volume(
      id: serializer.fromJson<String>(json['id']),
      number: serializer.fromJson<double>(json['number']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      ean13: serializer.fromJson<String>(json['ean13']),
      cover: serializer.fromJson<String>(json['cover']),
      pageCount: serializer.fromJson<int>(json['pageCount']),
      mangaId: serializer.fromJson<String>(json['mangaId']),
      publicationDate: serializer.fromJson<DateTime>(json['publicationDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'number': serializer.toJson<double>(number),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'ean13': serializer.toJson<String>(ean13),
      'cover': serializer.toJson<String>(cover),
      'pageCount': serializer.toJson<int>(pageCount),
      'mangaId': serializer.toJson<String>(mangaId),
      'publicationDate': serializer.toJson<DateTime>(publicationDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Volume copyWith(
          {String id,
          double number,
          String title,
          String description,
          String ean13,
          String cover,
          int pageCount,
          String mangaId,
          DateTime publicationDate,
          DateTime createdAt,
          DateTime updatedAt}) =>
      Volume(
        id: id ?? this.id,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        ean13: ean13 ?? this.ean13,
        cover: cover ?? this.cover,
        pageCount: pageCount ?? this.pageCount,
        mangaId: mangaId ?? this.mangaId,
        publicationDate: publicationDate ?? this.publicationDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Volume(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('ean13: $ean13, ')
          ..write('cover: $cover, ')
          ..write('pageCount: $pageCount, ')
          ..write('mangaId: $mangaId, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          number.hashCode,
          $mrjc(
              title.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      ean13.hashCode,
                      $mrjc(
                          cover.hashCode,
                          $mrjc(
                              pageCount.hashCode,
                              $mrjc(
                                  mangaId.hashCode,
                                  $mrjc(
                                      publicationDate.hashCode,
                                      $mrjc(createdAt.hashCode,
                                          updatedAt.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Volume &&
          other.id == this.id &&
          other.number == this.number &&
          other.title == this.title &&
          other.description == this.description &&
          other.ean13 == this.ean13 &&
          other.cover == this.cover &&
          other.pageCount == this.pageCount &&
          other.mangaId == this.mangaId &&
          other.publicationDate == this.publicationDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VolumesCompanion extends UpdateCompanion<Volume> {
  final Value<String> id;
  final Value<double> number;
  final Value<String> title;
  final Value<String> description;
  final Value<String> ean13;
  final Value<String> cover;
  final Value<int> pageCount;
  final Value<String> mangaId;
  final Value<DateTime> publicationDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const VolumesCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.ean13 = const Value.absent(),
    this.cover = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.mangaId = const Value.absent(),
    this.publicationDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VolumesCompanion.insert({
    @required String id,
    @required double number,
    @required String title,
    @required String description,
    this.ean13 = const Value.absent(),
    this.cover = const Value.absent(),
    @required int pageCount,
    @required String mangaId,
    this.publicationDate = const Value.absent(),
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : id = Value(id),
        number = Value(number),
        title = Value(title),
        description = Value(description),
        pageCount = Value(pageCount),
        mangaId = Value(mangaId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Volume> custom({
    Expression<String> id,
    Expression<double> number,
    Expression<String> title,
    Expression<String> description,
    Expression<String> ean13,
    Expression<String> cover,
    Expression<int> pageCount,
    Expression<String> mangaId,
    Expression<int> publicationDate,
    Expression<int> createdAt,
    Expression<int> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (ean13 != null) 'ean13': ean13,
      if (cover != null) 'cover': cover,
      if (pageCount != null) 'page_count': pageCount,
      if (mangaId != null) 'manga_id': mangaId,
      if (publicationDate != null) 'publication_date': publicationDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VolumesCompanion copyWith(
      {Value<String> id,
      Value<double> number,
      Value<String> title,
      Value<String> description,
      Value<String> ean13,
      Value<String> cover,
      Value<int> pageCount,
      Value<String> mangaId,
      Value<DateTime> publicationDate,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return VolumesCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      title: title ?? this.title,
      description: description ?? this.description,
      ean13: ean13 ?? this.ean13,
      cover: cover ?? this.cover,
      pageCount: pageCount ?? this.pageCount,
      mangaId: mangaId ?? this.mangaId,
      publicationDate: publicationDate ?? this.publicationDate,
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
    if (number.present) {
      map['number'] = Variable<double>(number.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ean13.present) {
      map['ean13'] = Variable<String>(ean13.value);
    }
    if (cover.present) {
      map['cover'] = Variable<String>(cover.value);
    }
    if (pageCount.present) {
      map['page_count'] = Variable<int>(pageCount.value);
    }
    if (mangaId.present) {
      map['manga_id'] = Variable<String>(mangaId.value);
    }
    if (publicationDate.present) {
      final converter = $VolumesTable.$converter0;
      map['publication_date'] =
          Variable<int>(converter.mapToSql(publicationDate.value));
    }
    if (createdAt.present) {
      final converter = $VolumesTable.$converter1;
      map['created_at'] = Variable<int>(converter.mapToSql(createdAt.value));
    }
    if (updatedAt.present) {
      final converter = $VolumesTable.$converter2;
      map['updated_at'] = Variable<int>(converter.mapToSql(updatedAt.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VolumesCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('ean13: $ean13, ')
          ..write('cover: $cover, ')
          ..write('pageCount: $pageCount, ')
          ..write('mangaId: $mangaId, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $VolumesTable extends Volumes with TableInfo<$VolumesTable, Volume> {
  final GeneratedDatabase _db;
  final String _alias;
  $VolumesTable(this._db, [this._alias]);
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

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  GeneratedRealColumn _number;
  @override
  GeneratedRealColumn get number => _number ??= _constructNumber();
  GeneratedRealColumn _constructNumber() {
    return GeneratedRealColumn(
      'number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ean13Meta = const VerificationMeta('ean13');
  GeneratedTextColumn _ean13;
  @override
  GeneratedTextColumn get ean13 => _ean13 ??= _constructEan13();
  GeneratedTextColumn _constructEan13() {
    return GeneratedTextColumn(
      'ean13',
      $tableName,
      true,
    );
  }

  final VerificationMeta _coverMeta = const VerificationMeta('cover');
  GeneratedTextColumn _cover;
  @override
  GeneratedTextColumn get cover => _cover ??= _constructCover();
  GeneratedTextColumn _constructCover() {
    return GeneratedTextColumn(
      'cover',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pageCountMeta = const VerificationMeta('pageCount');
  GeneratedIntColumn _pageCount;
  @override
  GeneratedIntColumn get pageCount => _pageCount ??= _constructPageCount();
  GeneratedIntColumn _constructPageCount() {
    return GeneratedIntColumn(
      'page_count',
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

  final VerificationMeta _publicationDateMeta =
      const VerificationMeta('publicationDate');
  GeneratedIntColumn _publicationDate;
  @override
  GeneratedIntColumn get publicationDate =>
      _publicationDate ??= _constructPublicationDate();
  GeneratedIntColumn _constructPublicationDate() {
    return GeneratedIntColumn(
      'publication_date',
      $tableName,
      true,
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
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedIntColumn _updatedAt;
  @override
  GeneratedIntColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedIntColumn _constructUpdatedAt() {
    return GeneratedIntColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        number,
        title,
        description,
        ean13,
        cover,
        pageCount,
        mangaId,
        publicationDate,
        createdAt,
        updatedAt
      ];
  @override
  $VolumesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'volumes';
  @override
  final String actualTableName = 'volumes';
  @override
  VerificationContext validateIntegrity(Insertable<Volume> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number'], _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('ean13')) {
      context.handle(
          _ean13Meta, ean13.isAcceptableOrUnknown(data['ean13'], _ean13Meta));
    }
    if (data.containsKey('cover')) {
      context.handle(
          _coverMeta, cover.isAcceptableOrUnknown(data['cover'], _coverMeta));
    }
    if (data.containsKey('page_count')) {
      context.handle(_pageCountMeta,
          pageCount.isAcceptableOrUnknown(data['page_count'], _pageCountMeta));
    } else if (isInserting) {
      context.missing(_pageCountMeta);
    }
    if (data.containsKey('manga_id')) {
      context.handle(_mangaIdMeta,
          mangaId.isAcceptableOrUnknown(data['manga_id'], _mangaIdMeta));
    } else if (isInserting) {
      context.missing(_mangaIdMeta);
    }
    context.handle(_publicationDateMeta, const VerificationResult.success());
    context.handle(_createdAtMeta, const VerificationResult.success());
    context.handle(_updatedAtMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Volume map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Volume.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $VolumesTable createAlias(String alias) {
    return $VolumesTable(_db, alias);
  }

  static TypeConverter<DateTime, int> $converter0 = const DateTimeConverter();
  static TypeConverter<DateTime, int> $converter1 = const DateTimeConverter();
  static TypeConverter<DateTime, int> $converter2 = const DateTimeConverter();
}

class Chapter extends DataClass implements Insertable<Chapter> {
  final String id;
  final double number;
  final String description;
  final DateTime publicationDate;
  final String cover;
  final bool isLicensed;
  final int pageCount;
  final String mangaId;
  final String volumeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  Chapter(
      {this.id,
      @required this.number,
      this.description,
      this.publicationDate,
      this.cover,
      @required this.isLicensed,
      @required this.pageCount,
      @required this.mangaId,
      this.volumeId,
      @required this.createdAt,
      @required this.updatedAt});
  factory Chapter.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Chapter(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      number:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}number']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      publicationDate: $ChaptersTable.$converter0.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}publication_date'])),
      cover:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}cover']),
      isLicensed: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_licensed']),
      pageCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}page_count']),
      mangaId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}manga_id']),
      volumeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}volume_id']),
      createdAt: $ChaptersTable.$converter1.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])),
      updatedAt: $ChaptersTable.$converter2.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<double>(number);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || publicationDate != null) {
      final converter = $ChaptersTable.$converter0;
      map['publication_date'] =
          Variable<int>(converter.mapToSql(publicationDate));
    }
    if (!nullToAbsent || cover != null) {
      map['cover'] = Variable<String>(cover);
    }
    if (!nullToAbsent || isLicensed != null) {
      map['is_licensed'] = Variable<bool>(isLicensed);
    }
    if (!nullToAbsent || pageCount != null) {
      map['page_count'] = Variable<int>(pageCount);
    }
    if (!nullToAbsent || mangaId != null) {
      map['manga_id'] = Variable<String>(mangaId);
    }
    if (!nullToAbsent || volumeId != null) {
      map['volume_id'] = Variable<String>(volumeId);
    }
    if (!nullToAbsent || createdAt != null) {
      final converter = $ChaptersTable.$converter1;
      map['created_at'] = Variable<int>(converter.mapToSql(createdAt));
    }
    if (!nullToAbsent || updatedAt != null) {
      final converter = $ChaptersTable.$converter2;
      map['updated_at'] = Variable<int>(converter.mapToSql(updatedAt));
    }
    return map;
  }

  ChaptersCompanion toCompanion(bool nullToAbsent) {
    return ChaptersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      publicationDate: publicationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publicationDate),
      cover:
          cover == null && nullToAbsent ? const Value.absent() : Value(cover),
      isLicensed: isLicensed == null && nullToAbsent
          ? const Value.absent()
          : Value(isLicensed),
      pageCount: pageCount == null && nullToAbsent
          ? const Value.absent()
          : Value(pageCount),
      mangaId: mangaId == null && nullToAbsent
          ? const Value.absent()
          : Value(mangaId),
      volumeId: volumeId == null && nullToAbsent
          ? const Value.absent()
          : Value(volumeId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Chapter.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Chapter(
      id: serializer.fromJson<String>(json['id']),
      number: serializer.fromJson<double>(json['number']),
      description: serializer.fromJson<String>(json['description']),
      publicationDate: serializer.fromJson<DateTime>(json['publicationDate']),
      cover: serializer.fromJson<String>(json['cover']),
      isLicensed: serializer.fromJson<bool>(json['isLicensed']),
      pageCount: serializer.fromJson<int>(json['pageCount']),
      mangaId: serializer.fromJson<String>(json['mangaId']),
      volumeId: serializer.fromJson<String>(json['volumeId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'number': serializer.toJson<double>(number),
      'description': serializer.toJson<String>(description),
      'publicationDate': serializer.toJson<DateTime>(publicationDate),
      'cover': serializer.toJson<String>(cover),
      'isLicensed': serializer.toJson<bool>(isLicensed),
      'pageCount': serializer.toJson<int>(pageCount),
      'mangaId': serializer.toJson<String>(mangaId),
      'volumeId': serializer.toJson<String>(volumeId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Chapter copyWith(
          {String id,
          double number,
          String description,
          DateTime publicationDate,
          String cover,
          bool isLicensed,
          int pageCount,
          String mangaId,
          String volumeId,
          DateTime createdAt,
          DateTime updatedAt}) =>
      Chapter(
        id: id ?? this.id,
        number: number ?? this.number,
        description: description ?? this.description,
        publicationDate: publicationDate ?? this.publicationDate,
        cover: cover ?? this.cover,
        isLicensed: isLicensed ?? this.isLicensed,
        pageCount: pageCount ?? this.pageCount,
        mangaId: mangaId ?? this.mangaId,
        volumeId: volumeId ?? this.volumeId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Chapter(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('description: $description, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('cover: $cover, ')
          ..write('isLicensed: $isLicensed, ')
          ..write('pageCount: $pageCount, ')
          ..write('mangaId: $mangaId, ')
          ..write('volumeId: $volumeId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          number.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  publicationDate.hashCode,
                  $mrjc(
                      cover.hashCode,
                      $mrjc(
                          isLicensed.hashCode,
                          $mrjc(
                              pageCount.hashCode,
                              $mrjc(
                                  mangaId.hashCode,
                                  $mrjc(
                                      volumeId.hashCode,
                                      $mrjc(createdAt.hashCode,
                                          updatedAt.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Chapter &&
          other.id == this.id &&
          other.number == this.number &&
          other.description == this.description &&
          other.publicationDate == this.publicationDate &&
          other.cover == this.cover &&
          other.isLicensed == this.isLicensed &&
          other.pageCount == this.pageCount &&
          other.mangaId == this.mangaId &&
          other.volumeId == this.volumeId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ChaptersCompanion extends UpdateCompanion<Chapter> {
  final Value<String> id;
  final Value<double> number;
  final Value<String> description;
  final Value<DateTime> publicationDate;
  final Value<String> cover;
  final Value<bool> isLicensed;
  final Value<int> pageCount;
  final Value<String> mangaId;
  final Value<String> volumeId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ChaptersCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.description = const Value.absent(),
    this.publicationDate = const Value.absent(),
    this.cover = const Value.absent(),
    this.isLicensed = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.mangaId = const Value.absent(),
    this.volumeId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ChaptersCompanion.insert({
    this.id = const Value.absent(),
    @required double number,
    this.description = const Value.absent(),
    this.publicationDate = const Value.absent(),
    this.cover = const Value.absent(),
    @required bool isLicensed,
    @required int pageCount,
    @required String mangaId,
    this.volumeId = const Value.absent(),
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : number = Value(number),
        isLicensed = Value(isLicensed),
        pageCount = Value(pageCount),
        mangaId = Value(mangaId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Chapter> custom({
    Expression<String> id,
    Expression<double> number,
    Expression<String> description,
    Expression<int> publicationDate,
    Expression<String> cover,
    Expression<bool> isLicensed,
    Expression<int> pageCount,
    Expression<String> mangaId,
    Expression<String> volumeId,
    Expression<int> createdAt,
    Expression<int> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (description != null) 'description': description,
      if (publicationDate != null) 'publication_date': publicationDate,
      if (cover != null) 'cover': cover,
      if (isLicensed != null) 'is_licensed': isLicensed,
      if (pageCount != null) 'page_count': pageCount,
      if (mangaId != null) 'manga_id': mangaId,
      if (volumeId != null) 'volume_id': volumeId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ChaptersCompanion copyWith(
      {Value<String> id,
      Value<double> number,
      Value<String> description,
      Value<DateTime> publicationDate,
      Value<String> cover,
      Value<bool> isLicensed,
      Value<int> pageCount,
      Value<String> mangaId,
      Value<String> volumeId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return ChaptersCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      description: description ?? this.description,
      publicationDate: publicationDate ?? this.publicationDate,
      cover: cover ?? this.cover,
      isLicensed: isLicensed ?? this.isLicensed,
      pageCount: pageCount ?? this.pageCount,
      mangaId: mangaId ?? this.mangaId,
      volumeId: volumeId ?? this.volumeId,
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
    if (number.present) {
      map['number'] = Variable<double>(number.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (publicationDate.present) {
      final converter = $ChaptersTable.$converter0;
      map['publication_date'] =
          Variable<int>(converter.mapToSql(publicationDate.value));
    }
    if (cover.present) {
      map['cover'] = Variable<String>(cover.value);
    }
    if (isLicensed.present) {
      map['is_licensed'] = Variable<bool>(isLicensed.value);
    }
    if (pageCount.present) {
      map['page_count'] = Variable<int>(pageCount.value);
    }
    if (mangaId.present) {
      map['manga_id'] = Variable<String>(mangaId.value);
    }
    if (volumeId.present) {
      map['volume_id'] = Variable<String>(volumeId.value);
    }
    if (createdAt.present) {
      final converter = $ChaptersTable.$converter1;
      map['created_at'] = Variable<int>(converter.mapToSql(createdAt.value));
    }
    if (updatedAt.present) {
      final converter = $ChaptersTable.$converter2;
      map['updated_at'] = Variable<int>(converter.mapToSql(updatedAt.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChaptersCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('description: $description, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('cover: $cover, ')
          ..write('isLicensed: $isLicensed, ')
          ..write('pageCount: $pageCount, ')
          ..write('mangaId: $mangaId, ')
          ..write('volumeId: $volumeId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ChaptersTable extends Chapters with TableInfo<$ChaptersTable, Chapter> {
  final GeneratedDatabase _db;
  final String _alias;
  $ChaptersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  GeneratedRealColumn _number;
  @override
  GeneratedRealColumn get number => _number ??= _constructNumber();
  GeneratedRealColumn _constructNumber() {
    return GeneratedRealColumn(
      'number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _publicationDateMeta =
      const VerificationMeta('publicationDate');
  GeneratedIntColumn _publicationDate;
  @override
  GeneratedIntColumn get publicationDate =>
      _publicationDate ??= _constructPublicationDate();
  GeneratedIntColumn _constructPublicationDate() {
    return GeneratedIntColumn(
      'publication_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _coverMeta = const VerificationMeta('cover');
  GeneratedTextColumn _cover;
  @override
  GeneratedTextColumn get cover => _cover ??= _constructCover();
  GeneratedTextColumn _constructCover() {
    return GeneratedTextColumn(
      'cover',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isLicensedMeta = const VerificationMeta('isLicensed');
  GeneratedBoolColumn _isLicensed;
  @override
  GeneratedBoolColumn get isLicensed => _isLicensed ??= _constructIsLicensed();
  GeneratedBoolColumn _constructIsLicensed() {
    return GeneratedBoolColumn(
      'is_licensed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pageCountMeta = const VerificationMeta('pageCount');
  GeneratedIntColumn _pageCount;
  @override
  GeneratedIntColumn get pageCount => _pageCount ??= _constructPageCount();
  GeneratedIntColumn _constructPageCount() {
    return GeneratedIntColumn(
      'page_count',
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

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedIntColumn _createdAt;
  @override
  GeneratedIntColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedIntColumn _constructCreatedAt() {
    return GeneratedIntColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedIntColumn _updatedAt;
  @override
  GeneratedIntColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedIntColumn _constructUpdatedAt() {
    return GeneratedIntColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        number,
        description,
        publicationDate,
        cover,
        isLicensed,
        pageCount,
        mangaId,
        volumeId,
        createdAt,
        updatedAt
      ];
  @override
  $ChaptersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chapters';
  @override
  final String actualTableName = 'chapters';
  @override
  VerificationContext validateIntegrity(Insertable<Chapter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number'], _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    context.handle(_publicationDateMeta, const VerificationResult.success());
    if (data.containsKey('cover')) {
      context.handle(
          _coverMeta, cover.isAcceptableOrUnknown(data['cover'], _coverMeta));
    }
    if (data.containsKey('is_licensed')) {
      context.handle(
          _isLicensedMeta,
          isLicensed.isAcceptableOrUnknown(
              data['is_licensed'], _isLicensedMeta));
    } else if (isInserting) {
      context.missing(_isLicensedMeta);
    }
    if (data.containsKey('page_count')) {
      context.handle(_pageCountMeta,
          pageCount.isAcceptableOrUnknown(data['page_count'], _pageCountMeta));
    } else if (isInserting) {
      context.missing(_pageCountMeta);
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
    context.handle(_createdAtMeta, const VerificationResult.success());
    context.handle(_updatedAtMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chapter map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Chapter.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ChaptersTable createAlias(String alias) {
    return $ChaptersTable(_db, alias);
  }

  static TypeConverter<DateTime, int> $converter0 = const DateTimeConverter();
  static TypeConverter<DateTime, int> $converter1 = const DateTimeConverter();
  static TypeConverter<DateTime, int> $converter2 = const DateTimeConverter();
}

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
  $MangasTable _mangas;
  $MangasTable get mangas => _mangas ??= $MangasTable(this);
  $VolumesTable _volumes;
  $VolumesTable get volumes => _volumes ??= $VolumesTable(this);
  $ChaptersTable _chapters;
  $ChaptersTable get chapters => _chapters ??= $ChaptersTable(this);
  $ReadingProgressionsTable _readingProgressions;
  $ReadingProgressionsTable get readingProgressions =>
      _readingProgressions ??= $ReadingProgressionsTable(this);
  MangasDao _mangasDao;
  MangasDao get mangasDao => _mangasDao ??= MangasDao(this as Database);
  VolumesDao _volumesDao;
  VolumesDao get volumesDao => _volumesDao ??= VolumesDao(this as Database);
  ChaptersDao _chaptersDao;
  ChaptersDao get chaptersDao => _chaptersDao ??= ChaptersDao(this as Database);
  ReadingProgressionsDao _readingProgressionsDao;
  ReadingProgressionsDao get readingProgressionsDao =>
      _readingProgressionsDao ??= ReadingProgressionsDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [mangas, volumes, chapters, readingProgressions];
}
