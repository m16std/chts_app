// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Coin {
  final String name;
  final double price;
  final String imageUrl;

  Coin({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  Coin copyWith({
    String? name,
    double? price,
    String? imageUrl,
  }) {
    return Coin(
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      name: map['name'] as String,
      price: map['price'] as double,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coin.fromJson(String source) =>
      Coin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Coin(name: $name, price: $price, imageUrl: $imageUrl)';

  @override
  bool operator ==(covariant Coin other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ imageUrl.hashCode;
}
