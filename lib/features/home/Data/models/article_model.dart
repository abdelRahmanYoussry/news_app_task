class ArticleModel {
  final Source? source;
  final String? author;
  final String? title;
  // final dynamic description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  // final dynamic content;

  ArticleModel({
    this.source,
    this.author,
    this.title,
    // this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    // this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: Source.fromJson(json["source"]),
      author: json["author"],
      title: json["title"],
      // description: dynamic.fromJson(json["description"]),
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.parse(json["publishedAt"]),
      // content: dynamic.fromJson(json["content"]),
    );
  }
//
}

class Source {
  final String? id;
  final String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"],
      name: json["name"],
    );
  }
//
}
