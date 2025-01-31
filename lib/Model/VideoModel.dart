class Videomodel {
  final String title;
  final String description;
  final bool isPublic;
  final url;
  final thumbnail;
  final String author;
  final String username;
  final int views;

  Videomodel({
    required this.title,
    required this.description,
    required this.isPublic,
    required this.thumbnail,
    required this.author,
    required this.url,
    required this.username,
    required this.views,
  });

  Map<String, dynamic> tomap() {
    return {
      'title': title,
      'description': description,
      'isPublic': isPublic,
      'thumbnail': thumbnail,
      'author': author,
      'url': url,
      'username': username,
      'views': views,
    };
  }

  factory Videomodel.fromJson(Map<String, dynamic> json) {
    return Videomodel(
        title: json['title'] as String,
        description: json['description'] as String,
        isPublic: json['isPublic'] as bool,
        thumbnail: json['thumbnail'],
        author: json['author'] as String,
        url: json['url'],
        username: json['username'],
        views: json['views']);
  }
}
