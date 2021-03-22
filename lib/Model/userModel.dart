import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.image,
    this.email,
    this.interest,
    this.category,
  });

  String id;
  String name;
  String image;
  String email;
  String interest;
  List<dynamic> category;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    email: json["email"],
    interest: json["interest"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "email":email,
    "interest":interest,
    "category":category,
  };
}
