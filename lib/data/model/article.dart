import 'dart:convert';

import 'package:flutter/cupertino.dart';

ArticlesResult welcomeFromJson(String str) =>
    ArticlesResult.fromJson(json.decode(str));

// String welcomeToJson(ArticlesResult data) => json.encode(data.toJson());

class ArticlesResult {
  ArticlesResult({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory ArticlesResult.fromJson(Map<String, dynamic> json) => ArticlesResult(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(
        json["articles"].map((x) => Article.fromJson(x))
        .where((article) =>
    article.author != null &&
        article.urlToImage != null &&
        article.publishedAt != null &&
        article.content != null),
    ));
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"] == null ? null : json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"] ?? "",
  );
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  dynamic id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );
}