class Statically {
  static const HOST = 'cdn.statically.io';

  /// Convert an URL to an Statically enabled URL.
  /// The output URL is an optimized version of the source one.
  static String buildUrl(
    String url, {
    int width,
    int height,
    int q = 90,
  }) {
    final uri = Uri.parse(url);
    final segments = [
      'img',
      uri.host,
      _encodeParams(width: width, height: height, q: q),
      ...uri.pathSegments,
    ];
    final optimizedUri = uri.replace(
      scheme: 'https',
      host: HOST,
      pathSegments: segments,
    );
    return optimizedUri.toString();
  }

  static String _encodeParams({int width, int height, int q}) {
    return [
      'f=auto',
      'q=$q',
      if (width != null) 'w=$width',
      if (height != null) 'w=$height',
    ].join(',');
  }
}
