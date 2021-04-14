///
//  Generated code. Do not modify.
//  source: library.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;

class Manga extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Manga', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..pPS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'otherTitles')
    ..pPS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastChapter')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastVolume')
    ..hasRequiredFields = false
  ;

  Manga._() : super();
  factory Manga({
    $core.String? id,
    $core.String? cover,
    $core.String? description,
    $core.String? title,
    $core.Iterable<$core.String>? otherTitles,
    $core.Iterable<$core.String>? authors,
    $core.String? lastChapter,
    $core.String? lastVolume,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (description != null) {
      _result.description = description;
    }
    if (title != null) {
      _result.title = title;
    }
    if (otherTitles != null) {
      _result.otherTitles.addAll(otherTitles);
    }
    if (authors != null) {
      _result.authors.addAll(authors);
    }
    if (lastChapter != null) {
      _result.lastChapter = lastChapter;
    }
    if (lastVolume != null) {
      _result.lastVolume = lastVolume;
    }
    return _result;
  }
  factory Manga.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Manga.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Manga clone() => Manga()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Manga copyWith(void Function(Manga) updates) => super.copyWith((message) => updates(message as Manga)) as Manga; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Manga create() => Manga._();
  Manga createEmptyInstance() => create();
  static $pb.PbList<Manga> createRepeated() => $pb.PbList<Manga>();
  @$core.pragma('dart2js:noInline')
  static Manga getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Manga>(create);
  static Manga? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cover => $_getSZ(1);
  @$pb.TagNumber(2)
  set cover($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCover() => $_has(1);
  @$pb.TagNumber(2)
  void clearCover() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get otherTitles => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get authors => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get lastChapter => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastChapter($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastChapter() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastChapter() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get lastVolume => $_getSZ(7);
  @$pb.TagNumber(8)
  set lastVolume($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLastVolume() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastVolume() => clearField(8);
}

class Chapter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Chapter', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number', $pb.PbFieldType.OF)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicationDate', subBuilder: $0.Timestamp.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isLicensed')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageCount', $pb.PbFieldType.O3)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mangaId')
    ..hasRequiredFields = false
  ;

  Chapter._() : super();
  factory Chapter({
    $core.String? id,
    $core.double? number,
    $core.String? title,
    $core.String? description,
    $0.Timestamp? publicationDate,
    $core.String? cover,
    $core.bool? isLicensed,
    $core.int? pageCount,
    $core.String? mangaId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (number != null) {
      _result.number = number;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (publicationDate != null) {
      _result.publicationDate = publicationDate;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (isLicensed != null) {
      _result.isLicensed = isLicensed;
    }
    if (pageCount != null) {
      _result.pageCount = pageCount;
    }
    if (mangaId != null) {
      _result.mangaId = mangaId;
    }
    return _result;
  }
  factory Chapter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chapter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Chapter clone() => Chapter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Chapter copyWith(void Function(Chapter) updates) => super.copyWith((message) => updates(message as Chapter)) as Chapter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Chapter create() => Chapter._();
  Chapter createEmptyInstance() => create();
  static $pb.PbList<Chapter> createRepeated() => $pb.PbList<Chapter>();
  @$core.pragma('dart2js:noInline')
  static Chapter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chapter>(create);
  static Chapter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get number => $_getN(1);
  @$pb.TagNumber(2)
  set number($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $0.Timestamp get publicationDate => $_getN(4);
  @$pb.TagNumber(5)
  set publicationDate($0.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPublicationDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearPublicationDate() => clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensurePublicationDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get cover => $_getSZ(5);
  @$pb.TagNumber(6)
  set cover($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCover() => $_has(5);
  @$pb.TagNumber(6)
  void clearCover() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isLicensed => $_getBF(6);
  @$pb.TagNumber(7)
  set isLicensed($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsLicensed() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsLicensed() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get pageCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set pageCount($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPageCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearPageCount() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get mangaId => $_getSZ(8);
  @$pb.TagNumber(9)
  set mangaId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMangaId() => $_has(8);
  @$pb.TagNumber(9)
  void clearMangaId() => clearField(9);
}

class Page extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Page', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapterId')
    ..hasRequiredFields = false
  ;

  Page._() : super();
  factory Page({
    $core.String? id,
    $core.int? number,
    $core.String? url,
    $core.String? chapterId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (number != null) {
      _result.number = number;
    }
    if (url != null) {
      _result.url = url;
    }
    if (chapterId != null) {
      _result.chapterId = chapterId;
    }
    return _result;
  }
  factory Page.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Page.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Page clone() => Page()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Page copyWith(void Function(Page) updates) => super.copyWith((message) => updates(message as Page)) as Page; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Page create() => Page._();
  Page createEmptyInstance() => create();
  static $pb.PbList<Page> createRepeated() => $pb.PbList<Page>();
  @$core.pragma('dart2js:noInline')
  static Page getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Page>(create);
  static Page? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get number => $_getIZ(1);
  @$pb.TagNumber(2)
  set number($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get chapterId => $_getSZ(3);
  @$pb.TagNumber(4)
  set chapterId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChapterId() => $_has(3);
  @$pb.TagNumber(4)
  void clearChapterId() => clearField(4);
}

class MangaRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MangaRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  MangaRequest._() : super();
  factory MangaRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory MangaRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MangaRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MangaRequest clone() => MangaRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MangaRequest copyWith(void Function(MangaRequest) updates) => super.copyWith((message) => updates(message as MangaRequest)) as MangaRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MangaRequest create() => MangaRequest._();
  MangaRequest createEmptyInstance() => create();
  static $pb.PbList<MangaRequest> createRepeated() => $pb.PbList<MangaRequest>();
  @$core.pragma('dart2js:noInline')
  static MangaRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MangaRequest>(create);
  static MangaRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class MangasRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MangasRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MangasRequest._() : super();
  factory MangasRequest() => create();
  factory MangasRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MangasRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MangasRequest clone() => MangasRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MangasRequest copyWith(void Function(MangasRequest) updates) => super.copyWith((message) => updates(message as MangasRequest)) as MangasRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MangasRequest create() => MangasRequest._();
  MangasRequest createEmptyInstance() => create();
  static $pb.PbList<MangasRequest> createRepeated() => $pb.PbList<MangasRequest>();
  @$core.pragma('dart2js:noInline')
  static MangasRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MangasRequest>(create);
  static MangasRequest? _defaultInstance;
}

class MangasReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MangasReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..pc<Manga>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mangas', $pb.PbFieldType.PM, subBuilder: Manga.create)
    ..hasRequiredFields = false
  ;

  MangasReply._() : super();
  factory MangasReply({
    $core.Iterable<Manga>? mangas,
  }) {
    final _result = create();
    if (mangas != null) {
      _result.mangas.addAll(mangas);
    }
    return _result;
  }
  factory MangasReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MangasReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MangasReply clone() => MangasReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MangasReply copyWith(void Function(MangasReply) updates) => super.copyWith((message) => updates(message as MangasReply)) as MangasReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MangasReply create() => MangasReply._();
  MangasReply createEmptyInstance() => create();
  static $pb.PbList<MangasReply> createRepeated() => $pb.PbList<MangasReply>();
  @$core.pragma('dart2js:noInline')
  static MangasReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MangasReply>(create);
  static MangasReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Manga> get mangas => $_getList(0);
}

class ChapterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChapterRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  ChapterRequest._() : super();
  factory ChapterRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory ChapterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChapterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChapterRequest clone() => ChapterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChapterRequest copyWith(void Function(ChapterRequest) updates) => super.copyWith((message) => updates(message as ChapterRequest)) as ChapterRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChapterRequest create() => ChapterRequest._();
  ChapterRequest createEmptyInstance() => create();
  static $pb.PbList<ChapterRequest> createRepeated() => $pb.PbList<ChapterRequest>();
  @$core.pragma('dart2js:noInline')
  static ChapterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChapterRequest>(create);
  static ChapterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class FindNextChapterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FindNextChapterRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  FindNextChapterRequest._() : super();
  factory FindNextChapterRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory FindNextChapterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindNextChapterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindNextChapterRequest clone() => FindNextChapterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindNextChapterRequest copyWith(void Function(FindNextChapterRequest) updates) => super.copyWith((message) => updates(message as FindNextChapterRequest)) as FindNextChapterRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FindNextChapterRequest create() => FindNextChapterRequest._();
  FindNextChapterRequest createEmptyInstance() => create();
  static $pb.PbList<FindNextChapterRequest> createRepeated() => $pb.PbList<FindNextChapterRequest>();
  @$core.pragma('dart2js:noInline')
  static FindNextChapterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindNextChapterRequest>(create);
  static FindNextChapterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ChaptersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChaptersRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mangaId')
    ..hasRequiredFields = false
  ;

  ChaptersRequest._() : super();
  factory ChaptersRequest({
    $core.String? mangaId,
  }) {
    final _result = create();
    if (mangaId != null) {
      _result.mangaId = mangaId;
    }
    return _result;
  }
  factory ChaptersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChaptersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChaptersRequest clone() => ChaptersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChaptersRequest copyWith(void Function(ChaptersRequest) updates) => super.copyWith((message) => updates(message as ChaptersRequest)) as ChaptersRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChaptersRequest create() => ChaptersRequest._();
  ChaptersRequest createEmptyInstance() => create();
  static $pb.PbList<ChaptersRequest> createRepeated() => $pb.PbList<ChaptersRequest>();
  @$core.pragma('dart2js:noInline')
  static ChaptersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChaptersRequest>(create);
  static ChaptersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mangaId => $_getSZ(0);
  @$pb.TagNumber(1)
  set mangaId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMangaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMangaId() => clearField(1);
}

class ChaptersReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChaptersReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..pc<Chapter>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapters', $pb.PbFieldType.PM, subBuilder: Chapter.create)
    ..hasRequiredFields = false
  ;

  ChaptersReply._() : super();
  factory ChaptersReply({
    $core.Iterable<Chapter>? chapters,
  }) {
    final _result = create();
    if (chapters != null) {
      _result.chapters.addAll(chapters);
    }
    return _result;
  }
  factory ChaptersReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChaptersReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChaptersReply clone() => ChaptersReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChaptersReply copyWith(void Function(ChaptersReply) updates) => super.copyWith((message) => updates(message as ChaptersReply)) as ChaptersReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChaptersReply create() => ChaptersReply._();
  ChaptersReply createEmptyInstance() => create();
  static $pb.PbList<ChaptersReply> createRepeated() => $pb.PbList<ChaptersReply>();
  @$core.pragma('dart2js:noInline')
  static ChaptersReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChaptersReply>(create);
  static ChaptersReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Chapter> get chapters => $_getList(0);
}

class ChapterPagesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChapterPagesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapterId')
    ..hasRequiredFields = false
  ;

  ChapterPagesRequest._() : super();
  factory ChapterPagesRequest({
    $core.String? chapterId,
  }) {
    final _result = create();
    if (chapterId != null) {
      _result.chapterId = chapterId;
    }
    return _result;
  }
  factory ChapterPagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChapterPagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChapterPagesRequest clone() => ChapterPagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChapterPagesRequest copyWith(void Function(ChapterPagesRequest) updates) => super.copyWith((message) => updates(message as ChapterPagesRequest)) as ChapterPagesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChapterPagesRequest create() => ChapterPagesRequest._();
  ChapterPagesRequest createEmptyInstance() => create();
  static $pb.PbList<ChapterPagesRequest> createRepeated() => $pb.PbList<ChapterPagesRequest>();
  @$core.pragma('dart2js:noInline')
  static ChapterPagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChapterPagesRequest>(create);
  static ChapterPagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chapterId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chapterId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChapterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChapterId() => clearField(1);
}

class ChapterPagesReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChapterPagesReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grpc.library'), createEmptyInstance: create)
    ..pc<Page>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pages', $pb.PbFieldType.PM, subBuilder: Page.create)
    ..hasRequiredFields = false
  ;

  ChapterPagesReply._() : super();
  factory ChapterPagesReply({
    $core.Iterable<Page>? pages,
  }) {
    final _result = create();
    if (pages != null) {
      _result.pages.addAll(pages);
    }
    return _result;
  }
  factory ChapterPagesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChapterPagesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChapterPagesReply clone() => ChapterPagesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChapterPagesReply copyWith(void Function(ChapterPagesReply) updates) => super.copyWith((message) => updates(message as ChapterPagesReply)) as ChapterPagesReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChapterPagesReply create() => ChapterPagesReply._();
  ChapterPagesReply createEmptyInstance() => create();
  static $pb.PbList<ChapterPagesReply> createRepeated() => $pb.PbList<ChapterPagesReply>();
  @$core.pragma('dart2js:noInline')
  static ChapterPagesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChapterPagesReply>(create);
  static ChapterPagesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Page> get pages => $_getList(0);
}

