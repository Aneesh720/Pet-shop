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
}
