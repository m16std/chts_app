// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Coin {
  final String name;
  final double price;

  Coin({
    required this.name,
    required this.price,
  });

  Coin copyWith({
    String? name,
    double? price,
  }) {
    return Coin(
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
    };
  }

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coin.fromJson(String source) =>
      Coin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Coins(name: $name, price: $price)';

  @override
  bool operator ==(covariant Coin other) {
    if (identical(this, other)) return true;

    return other.name == name && other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
