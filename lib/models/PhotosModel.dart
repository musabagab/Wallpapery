// To parse this JSON data, do
//
//     final photosModel = photosModelFromJson(jsonString);

import 'dart:convert';

PhotosModel photosModelFromJson(String str) =>
    PhotosModel.fromJson(json.decode(str));

String photosModelToJson(PhotosModel data) => json.encode(data.toJson());

class PhotosModel {
  int totalHits;
  List<Hit> hits;
  int total;

  PhotosModel({
    this.totalHits,
    this.hits,
    this.total,
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
        totalHits: json["totalHits"],
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "totalHits": totalHits,
        "hits": List<dynamic>.from(hits.map((x) => x.toJson())),
        "total": total,
      };
}

class Hit {
  String largeImageUrl;
  int webformatHeight;
  int webformatWidth;
  int likes;
  int imageWidth;
  int id;
  int userId;
  int views;
  int comments;
  String pageUrl;
  int imageHeight;
  String webformatUrl;
  String type;
  int previewHeight;
  String tags;
  int downloads;
  String user;
  int favorites;
  int imageSize;
  int previewWidth;
  String userImageUrl;
  String previewUrl;

  Hit({
    this.largeImageUrl,
    this.webformatHeight,
    this.webformatWidth,
    this.likes,
    this.imageWidth,
    this.id,
    this.userId,
    this.views,
    this.comments,
    this.pageUrl,
    this.imageHeight,
    this.webformatUrl,
    this.type,
    this.previewHeight,
    this.tags,
    this.downloads,
    this.user,
    this.favorites,
    this.imageSize,
    this.previewWidth,
    this.userImageUrl,
    this.previewUrl,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        largeImageUrl: json["largeImageURL"],
        webformatHeight: json["webformatHeight"],
        webformatWidth: json["webformatWidth"],
        likes: json["likes"],
        imageWidth: json["imageWidth"],
        id: json["id"],
        userId: json["user_id"],
        views: json["views"],
        comments: json["comments"],
        pageUrl: json["pageURL"],
        imageHeight: json["imageHeight"],
        webformatUrl: json["webformatURL"],
        type: json["type"],
        previewHeight: json["previewHeight"],
        tags: json["tags"],
        downloads: json["downloads"],
        user: json["user"],
        favorites: json["favorites"],
        imageSize: json["imageSize"],
        previewWidth: json["previewWidth"],
        userImageUrl: json["userImageURL"],
        previewUrl: json["previewURL"],
      );

  Map<String, dynamic> toJson() => {
        "largeImageURL": largeImageUrl,
        "webformatHeight": webformatHeight,
        "webformatWidth": webformatWidth,
        "likes": likes,
        "imageWidth": imageWidth,
        "id": id,
        "user_id": userId,
        "views": views,
        "comments": comments,
        "pageURL": pageUrl,
        "imageHeight": imageHeight,
        "webformatURL": webformatUrl,
        "type": type,
        "previewHeight": previewHeight,
        "tags": tags,
        "downloads": downloads,
        "user": user,
        "favorites": favorites,
        "imageSize": imageSize,
        "previewWidth": previewWidth,
        "userImageURL": userImageUrl,
        "previewURL": previewUrl,
      };
}
