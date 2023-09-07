class SongModel {
  String id;
  String name;
  List<Artist> artists;
  Album album;
  int durationMs;
  int popularity;
  bool explicit;
  String previewUrl;
  ExternalUrls externalUrls;
  List<ImageData> images;
  String releaseDate;

  SongModel({
    required this.id,
    required this.name,
    required this.artists,
    required this.album,
    required this.durationMs,
    required this.popularity,
    required this.explicit,
    required this.previewUrl,
    required this.externalUrls,
    required this.images,
    required this.releaseDate,
  });
}

class Album {
  String id;
  String name;
  String releaseDate;
  int totalTracks;

  Album({
    required this.id,
    required this.name,
    required this.releaseDate,
    required this.totalTracks,
  });
}

class Artist {
  String id;
  String name;

  Artist({
    required this.id,
    required this.name,
  });
}

class ExternalUrls {
  String spotify;

  ExternalUrls({
    required this.spotify,
  });
}

class ImageData {
  int height;
  int width;
  String url;

  ImageData({
    required this.height,
    required this.width,
    required this.url,
  });
}
