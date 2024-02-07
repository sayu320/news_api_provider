// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  List<Article> articles;

  Post({
    required this.articles,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
      };
}
