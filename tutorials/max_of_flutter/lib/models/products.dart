import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? uid; 
  final String name;
  final String imageUrl;
  final double price;

  const Product({
    this.uid,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    return Product(
      uid: snapshot['uid'] ?? '',
      name: snapshot['name'] ?? '',
      imageUrl: snapshot['imageUrl'] ?? '',
      price: snapshot['price']?.toDouble() ?? 0.0,
    );
  }
  // static const List<Product> products = [
  //     Product(
  //       name: "Apple",
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1600423115367-87ea7661688f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
  //       price: 5.99),
  //     Product(
  //       name: "Banana",
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1528825871115-3581a5387919?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80',
  //       price: 2.29),
  //     Product(
  //       name: "Cherry",
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1528821128474-27f963b062bf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  //       price: 1.69),
  // ];

  Product copyWith({
    String? uid,
    String? name,
    String? imageUrl,
    double? price,
  }) {
    return Product(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      uid: map['uid'],
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(uid: $uid, name: $name, imageUrl: $imageUrl, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.uid == uid &&
      other.name == name &&
      other.imageUrl == imageUrl &&
      other.price == price;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      name.hashCode ^
      imageUrl.hashCode ^
      price.hashCode;
  }
}
