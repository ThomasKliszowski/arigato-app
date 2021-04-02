import 'dart:convert';

import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:protobuf/protobuf.dart';

import '../../protos/library.pb.dart';

class BackendLibrary {
  PhoenixChannel _channel;

  Future<void> join(PhoenixSocket socket) {
    _channel?.close();
    _channel = socket.addChannel(topic: 'library');
    return _channel.join().future;
  }

  Future<Manga> getManga(String id) async {
    return _request('getManga', MangaRequest(id: id), Manga.create());
  }

  Future<MangasReply> getMangas() async {
    return _request('getMangas', MangasRequest(), MangasReply.create());
  }

  Future<Chapter> getChapter(String chapterId) async {
    return _request(
        'getChapter', ChapterRequest(id: chapterId), Chapter.create());
  }

  Future<ChaptersReply> getChapters(String mangaId) async {
    return _request('getChapters', ChaptersRequest(mangaId: mangaId),
        ChaptersReply.create());
  }

  Future<ChapterPagesReply> getChapterPages(String chapterId) async {
    return _request('getChapterPages',
        ChapterPagesRequest(chapterId: chapterId), ChapterPagesReply.create());
  }

  // -----

  Future<E> _request<T extends GeneratedMessage, E extends GeneratedMessage>(
      String action, T request, E response) async {
    final push = _channel.push(action, {
      'payload': base64Encode(request.writeToBuffer()),
    });
    final result = await _channel.onPushReply(push.replyEvent);
    final payload = result.payload['response']['payload'];
    response.mergeFromBuffer(base64.decode(payload).toList(growable: false));
    return response;
  }
}
