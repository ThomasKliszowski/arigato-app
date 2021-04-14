///
//  Generated code. Do not modify.
//  source: library.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use mangaDescriptor instead')
const Manga$json = const {
  '1': 'Manga',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'cover', '3': 2, '4': 1, '5': 9, '10': 'cover'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'other_titles', '3': 5, '4': 3, '5': 9, '10': 'otherTitles'},
    const {'1': 'authors', '3': 6, '4': 3, '5': 9, '10': 'authors'},
    const {'1': 'last_chapter', '3': 7, '4': 1, '5': 9, '10': 'lastChapter'},
    const {'1': 'last_volume', '3': 8, '4': 1, '5': 9, '10': 'lastVolume'},
  ],
};

/// Descriptor for `Manga`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mangaDescriptor = $convert.base64Decode('CgVNYW5nYRIOCgJpZBgBIAEoCVICaWQSFAoFY292ZXIYAiABKAlSBWNvdmVyEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIUCgV0aXRsZRgEIAEoCVIFdGl0bGUSIQoMb3RoZXJfdGl0bGVzGAUgAygJUgtvdGhlclRpdGxlcxIYCgdhdXRob3JzGAYgAygJUgdhdXRob3JzEiEKDGxhc3RfY2hhcHRlchgHIAEoCVILbGFzdENoYXB0ZXISHwoLbGFzdF92b2x1bWUYCCABKAlSCmxhc3RWb2x1bWU=');
@$core.Deprecated('Use chapterDescriptor instead')
const Chapter$json = const {
  '1': 'Chapter',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'number', '3': 2, '4': 1, '5': 2, '10': 'number'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'publication_date', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'publicationDate'},
    const {'1': 'cover', '3': 6, '4': 1, '5': 9, '10': 'cover'},
    const {'1': 'is_licensed', '3': 7, '4': 1, '5': 8, '10': 'isLicensed'},
    const {'1': 'page_count', '3': 8, '4': 1, '5': 5, '10': 'pageCount'},
    const {'1': 'manga_id', '3': 9, '4': 1, '5': 9, '10': 'mangaId'},
  ],
};

/// Descriptor for `Chapter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chapterDescriptor = $convert.base64Decode('CgdDaGFwdGVyEg4KAmlkGAEgASgJUgJpZBIWCgZudW1iZXIYAiABKAJSBm51bWJlchIUCgV0aXRsZRgDIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9uEkUKEHB1YmxpY2F0aW9uX2RhdGUYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg9wdWJsaWNhdGlvbkRhdGUSFAoFY292ZXIYBiABKAlSBWNvdmVyEh8KC2lzX2xpY2Vuc2VkGAcgASgIUgppc0xpY2Vuc2VkEh0KCnBhZ2VfY291bnQYCCABKAVSCXBhZ2VDb3VudBIZCghtYW5nYV9pZBgJIAEoCVIHbWFuZ2FJZA==');
@$core.Deprecated('Use pageDescriptor instead')
const Page$json = const {
  '1': 'Page',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'number', '3': 2, '4': 1, '5': 5, '10': 'number'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'chapter_id', '3': 4, '4': 1, '5': 9, '10': 'chapterId'},
  ],
};

/// Descriptor for `Page`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pageDescriptor = $convert.base64Decode('CgRQYWdlEg4KAmlkGAEgASgJUgJpZBIWCgZudW1iZXIYAiABKAVSBm51bWJlchIQCgN1cmwYAyABKAlSA3VybBIdCgpjaGFwdGVyX2lkGAQgASgJUgljaGFwdGVySWQ=');
@$core.Deprecated('Use mangaRequestDescriptor instead')
const MangaRequest$json = const {
  '1': 'MangaRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `MangaRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mangaRequestDescriptor = $convert.base64Decode('CgxNYW5nYVJlcXVlc3QSDgoCaWQYASABKAlSAmlk');
@$core.Deprecated('Use mangasRequestDescriptor instead')
const MangasRequest$json = const {
  '1': 'MangasRequest',
};

/// Descriptor for `MangasRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mangasRequestDescriptor = $convert.base64Decode('Cg1NYW5nYXNSZXF1ZXN0');
@$core.Deprecated('Use mangasReplyDescriptor instead')
const MangasReply$json = const {
  '1': 'MangasReply',
  '2': const [
    const {'1': 'mangas', '3': 1, '4': 3, '5': 11, '6': '.grpc.library.Manga', '10': 'mangas'},
  ],
};

/// Descriptor for `MangasReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mangasReplyDescriptor = $convert.base64Decode('CgtNYW5nYXNSZXBseRIrCgZtYW5nYXMYASADKAsyEy5ncnBjLmxpYnJhcnkuTWFuZ2FSBm1hbmdhcw==');
@$core.Deprecated('Use chapterRequestDescriptor instead')
const ChapterRequest$json = const {
  '1': 'ChapterRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `ChapterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chapterRequestDescriptor = $convert.base64Decode('Cg5DaGFwdGVyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use findNextChapterRequestDescriptor instead')
const FindNextChapterRequest$json = const {
  '1': 'FindNextChapterRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `FindNextChapterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findNextChapterRequestDescriptor = $convert.base64Decode('ChZGaW5kTmV4dENoYXB0ZXJSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');
@$core.Deprecated('Use chaptersRequestDescriptor instead')
const ChaptersRequest$json = const {
  '1': 'ChaptersRequest',
  '2': const [
    const {'1': 'manga_id', '3': 1, '4': 1, '5': 9, '10': 'mangaId'},
  ],
};

/// Descriptor for `ChaptersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chaptersRequestDescriptor = $convert.base64Decode('Cg9DaGFwdGVyc1JlcXVlc3QSGQoIbWFuZ2FfaWQYASABKAlSB21hbmdhSWQ=');
@$core.Deprecated('Use chaptersReplyDescriptor instead')
const ChaptersReply$json = const {
  '1': 'ChaptersReply',
  '2': const [
    const {'1': 'chapters', '3': 1, '4': 3, '5': 11, '6': '.grpc.library.Chapter', '10': 'chapters'},
  ],
};

/// Descriptor for `ChaptersReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chaptersReplyDescriptor = $convert.base64Decode('Cg1DaGFwdGVyc1JlcGx5EjEKCGNoYXB0ZXJzGAEgAygLMhUuZ3JwYy5saWJyYXJ5LkNoYXB0ZXJSCGNoYXB0ZXJz');
@$core.Deprecated('Use chapterPagesRequestDescriptor instead')
const ChapterPagesRequest$json = const {
  '1': 'ChapterPagesRequest',
  '2': const [
    const {'1': 'chapter_id', '3': 1, '4': 1, '5': 9, '10': 'chapterId'},
  ],
};

/// Descriptor for `ChapterPagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chapterPagesRequestDescriptor = $convert.base64Decode('ChNDaGFwdGVyUGFnZXNSZXF1ZXN0Eh0KCmNoYXB0ZXJfaWQYASABKAlSCWNoYXB0ZXJJZA==');
@$core.Deprecated('Use chapterPagesReplyDescriptor instead')
const ChapterPagesReply$json = const {
  '1': 'ChapterPagesReply',
  '2': const [
    const {'1': 'pages', '3': 1, '4': 3, '5': 11, '6': '.grpc.library.Page', '10': 'pages'},
  ],
};

/// Descriptor for `ChapterPagesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chapterPagesReplyDescriptor = $convert.base64Decode('ChFDaGFwdGVyUGFnZXNSZXBseRIoCgVwYWdlcxgBIAMoCzISLmdycGMubGlicmFyeS5QYWdlUgVwYWdlcw==');
