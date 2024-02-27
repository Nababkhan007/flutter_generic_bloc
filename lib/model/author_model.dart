import 'dart:convert';

List<AuthorModel> authorModelFromJson(String response) =>
    List<AuthorModel>.from(json.decode(response).map((data) => AuthorModel.fromJson(data)));

AuthorModel authorItemModelFromJson(String str) => AuthorModel.fromJson(json.decode(str));

String authorModelToJson(List<AuthorModel> data) => json.encode(List<dynamic>.from(data.map((data) => data.toJson())));

class AuthorModel {
  final int? id;
  final String? title;
  final String? content;
  final String? image;
  final String? thumbnail;
  final int? userId;
  final int? quantity;

  AuthorModel({
    this.id,
    this.title,
    this.content,
    this.image,
    this.thumbnail,
    this.userId,
    this.quantity,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        content: json["content"] ?? "",
        image: json["image"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
        userId: json["userId"] ?? 0,
        quantity: json["quantity"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "title": title ?? "",
        "content": content ?? "",
        "image": image ?? "",
        "thumbnail": thumbnail ?? "",
        "userId": userId ?? 0,
        "quantity": quantity ?? 0,
      };
}
