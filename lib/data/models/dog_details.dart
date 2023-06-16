import 'dart:convert';

import 'package:flutter_template/utils/constant.dart';


class DogDetails {
  final String imageUrl;
  final double? price;
  const DogDetails({
    required this.imageUrl,
    this.price,
  });
  factory DogDetails.fromJson(Map<String, dynamic> json) {
    return DogDetails(
      imageUrl: json['message'],
      price: json['price'],
    );
  }
  static Map<String, dynamic> toMap(DogDetails dogDetails) => {
    'message': dogDetails.imageUrl,
    'price': dogDetails.price,
  };

  static String encode(List<DogDetails> dogDetails) => json.encode(
    dogDetails
        .map<Map<String, dynamic>>((music) => DogDetails.toMap(music))
        .toList(),
  );

  static List<DogDetails> decode(String dogDetailString) =>
      (json.decode(dogDetailString) as List<dynamic>)
          .map<DogDetails>((item) => DogDetails.fromJson(item))
          .toList();

}
