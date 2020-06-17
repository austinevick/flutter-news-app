class NewsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String name;
  final String publishedAt;

  NewsArticle({this.title,this.publishedAt, this.name, this.description, this.urlToImage, this.url});

  factory NewsArticle.fromJson(Map<String, dynamic>map){
    return NewsArticle(
      title: map['title'],
      name: map['source']['name'],
      description: map['description'],
      urlToImage: map['urlToImage'],
      url: map['url'],
      publishedAt: map['publishedAt']
    );
  }
}