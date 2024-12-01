// import 'package:flutter/material.dart';

// class Article {
//   Source? source;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   DateTime? publishedAt;
//   String? content;
//   String? category;  // Add this line for category

//   Article({
//     this.source,
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//     this.category,  // Add this in the constructor
//   });

//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//     source: json["source"] == null ? null : Source.fromJson(json["source"]),
//     author: json["author"],
//     title: json["title"],
//     description: json["description"],
//     url: json["url"],
//     urlToImage: json["urlToImage"],
//     publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
//     content: json["content"],
//     category: json["category"], // Assuming the category is in the API response
//   );

//   Map<String, dynamic> toJson() => {
//     "source": source?.toJson(),
//     "author": author,
//     "title": title,
//     "description": description,
//     "url": url,
//     "urlToImage": urlToImage,
//     "publishedAt": publishedAt?.toIso8601String(),
//     "content": content,
//     "category": category,  // Add this field here as well
//   };
// }

import 'dart:convert';

Homescreenmodel catFactmodelFromJson(String str) =>
    Homescreenmodel.fromJson(json.decode(str));

String catFactmodelToJson(Homescreenmodel data) => json.encode(data.toJson());

class Homescreenmodel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  Homescreenmodel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory Homescreenmodel.fromJson(Map<String, dynamic> json) =>
      Homescreenmodel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
  String? category;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.category,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
        "category": category,
      };
}

class Source {
  dynamic id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
