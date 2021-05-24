import 'package:flutter/material.dart';
import 'dart:convert';

CardViewModel cardsFromJson(String str) =>
    CardViewModel.fromJson(json.decode(str));

String userToJson(CardViewModel data) => json.encode(data.toJson());

class CardViewModel {
  String type;
  String subType;
  String source;
  String location;
  String title;
  String description;
  String regularPrice;
  String discount;
  String reducedPrice;
  String valid;
  String bezcentiveID;
  String redemptionID;
  String phone;
  String email;
  String refer;
  String company;
  String country;

  CardViewModel(
      this.type,
      this.subType,
      this.source,
      this.location,
      this.title,
      this.description,
      this.regularPrice,
      this.discount,
      this.reducedPrice,
      this.valid,
      this.bezcentiveID,
      this.redemptionID,
      this.phone,
      this.email,
      this.country,
      this.refer,
      this.company);

  factory CardViewModel.fromJson(Map<String, dynamic> json) => CardViewModel(
      json["type"],
      json["subType"],
      json["source"],
      json["location"],
      json["title"],
      json["description"],
      json["regularPrice"],
      json["discount"],
      json["reducedPrice"],
      json["valid"],
      json["bezcentiveID"],
      json["redemptionID"],
      json["phone"],
      json["email"],
      json["country"],
      json["refer"],
      json["company"]);

  Map<String, dynamic> toJson() => {
        "type": type,
        "subType": subType,
        "source": source,
        "location": location,
        "title": title,
        "description": description,
        "regularPrice": regularPrice,
        "discount": discount,
        "reducedPrice": reducedPrice,
        "valid": valid,
        "bezcentiveID": bezcentiveID,
        "redemptionID": redemptionID,
        "phone": phone,
        "email": email,
        "country": country,
        "refer": refer,
        "company": company,
      };
  factory CardViewModel.fromMap(Map<String, dynamic> json) => CardViewModel(
      json["type"],
      json["subType"],
      json["source"],
      json["location"],
      json["title"],
      json["description"],
      json["regularPrice"],
      json["discount"],
      json["reducedPrice"],
      json["valid"],
      json["bezcentiveID"],
      json["redemptionID"],
      json["phone"],
      json["email"],
      json["country"],
      json["refer"],
      json["company"]);

  Map<String, dynamic> toMap() => {
    "type": type,
    "subType": subType,
    "source": source,
    "location": location,
    "title": title,
    "description": description,
    "regularPrice": regularPrice,
    "discount": discount,
    "reducedPrice": reducedPrice,
    "valid": valid,
    "bezcentiveID": bezcentiveID,
    "redemptionID": redemptionID,
    "phone": phone,
    "email": email,
    "country": country,
    "refer": refer,
    "company": company,
  };
}
