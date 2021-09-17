class NewsEntity {
  String? status;
  int? totalResults;
  List<ArticlesEntity>? articles;

  NewsEntity({
    this.status,
    this.totalResults,
    this.articles,
  });
}

class ArticlesEntity {
  SourceEntity? source;
  dynamic? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticlesEntity({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
}

class SourceEntity {
  dynamic? id;
  String? name;

  SourceEntity({
    this.id,
    this.name,
  });
}
