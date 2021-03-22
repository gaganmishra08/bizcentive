import 'package:flutter/material.dart';

class CardViewModel {
  final String title;
  final String description;
  final String id;
  final String fullFiledBy;
  final String company;
  final String phone;
  final String email;
  final String location;
  final String cost;
  final String category;
  final Color cardColor;

  CardViewModel(this.title, this.description,
      {this.id,
        this.fullFiledBy,
        this.company,
        this.phone,
        this.email,
        this.location,
        this.cost,
        this.category,
        this.cardColor});
}