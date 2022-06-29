class Img {
  String urlString;

  Img({
    required this.urlString,
  });

  factory Img.fromJson(Map<String, dynamic> json) {
    return Img(
      urlString: json['url'],
    );
  }
}