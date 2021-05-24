// To parse this JSON data, do
//
//     final card = cardFromMap(jsonString);

import 'dart:convert';

Cards cardFromMap(String str) => Cards.fromMap(json.decode(str));

String cardToMap(Cards data) => json.encode(data.toMap());

class Cards {
  Cards({
    this.cards,
  });

  List<CardElement> cards;

  factory Cards.fromMap(Map<String, dynamic> json) => Cards(
    cards: json["cards"] == null ? null : List<CardElement>.from(json["cards"].map((x) => CardElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "cards": cards == null ? null : List<dynamic>.from(cards.map((x) => x.toMap())),
  };
}

class CardElement {
  CardElement({
    this.discount,
    this.description,
    this.regularPrice,
    this.phone,
    this.valid,
    this.subType,
    this.company,
    this.source,
    this.title,
    this.type,
    this.location,
    this.redemptionId,
    this.refer,
    this.reducedPrice,
    this.country,
    this.bezcentiveId,
    this.email,
    this.isCardSaved,
    this.isCardRejected,
    this.isCardAccepted,
  });

  String discount;
  String description;
  String regularPrice;
  String phone;
  String valid;
  String subType;
  String company;
  String source;
  String title;
  String type;
  String location;
  String redemptionId;
  String refer;
  String reducedPrice;
  String country;
  String bezcentiveId;
  String email;
  bool isCardSaved;
  bool isCardRejected;
  bool isCardAccepted;

  factory CardElement.fromMap(Map<String, dynamic> json) => CardElement(
    discount: json["discount"] == null ? null : json["discount"],
    description: json["description"] == null ? null : json["description"],
    regularPrice: json["regularPrice"] == null ? null : json["regularPrice"],
    phone: json["phone"] == null ? null : json["phone"],
    valid: json["valid"] == null ? null : json["valid"],
    subType: json["subType"] == null ? null : json["subType"],
    company: json["company"] == null ? null : json["company"],
    source: json["source"] == null ? null : json["source"],
    title: json["title"] == null ? null : json["title"],
    type: json["type"] == null ? null : json["type"],
    location: json["location"] == null ? null : json["location"],
    redemptionId: json["redemptionID"] == null ? null : json["redemptionID"],
    refer: json["refer"] == null ? null : json["refer"],
    reducedPrice: json["reducedPrice"] == null ? null : json["reducedPrice"],
    country: json["country"] == null ? null : json["country"],
    bezcentiveId: json["bezcentiveID"] == null ? null : json["bezcentiveID"],
    email: json["email"] == null ? null : json["email"],
    isCardSaved: json["isCardSaved"] == null ? null : json["isCardSaved"],
    isCardRejected: json["isCardRejected"] == null ? null : json["isCardRejected"],
    isCardAccepted: json["isCardAccepted"] == null ? null : json["isCardAccepted"],
  );

  Map<String, dynamic> toMap() => {
    "discount": discount == null ? null : discount,
    "description": description == null ? null : description,
    "regularPrice": regularPrice == null ? null : regularPrice,
    "phone": phone == null ? null : phone,
    "valid": valid == null ? null : valid,
    "subType": subType == null ? null : subType,
    "company": company == null ? null : company,
    "source": source == null ? null : source,
    "title": title == null ? null : title,
    "type": type == null ? null : type,
    "location": location == null ? null : location,
    "redemptionID": redemptionId == null ? null : redemptionId,
    "refer": refer == null ? null : refer,
    "reducedPrice": reducedPrice == null ? null : reducedPrice,
    "country": country == null ? null : country,
    "bezcentiveID": bezcentiveId == null ? null : bezcentiveId,
    "email": email == null ? null : email,
    "isCardSaved": isCardSaved == null ? null : isCardSaved,
    "isCardRejected": isCardRejected == null ? null : isCardRejected,
    "isCardAccepted": isCardAccepted == null ? null : isCardAccepted,
  };
}
