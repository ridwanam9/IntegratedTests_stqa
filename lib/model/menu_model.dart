// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MenuModel {
  int? id;
  String? name;
  String? price;
  String? image;
  String? description;
  String? category;
  int? is_available;
  MenuModel({
    this.id,
    this.name,
    this.price,
    this.image,
    this.description,
    this.category,
    this.is_available,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id.toString(),
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'category': category,
      'is_available': is_available.toString(),
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      is_available:
          map['is_available'] != null ? map['is_available'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) =>
      MenuModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MenuModel copyWith({
    int? id,
    String? name,
    String? price,
    String? image,
    String? description,
    String? category,
    int? is_available,
  }) {
    return MenuModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      category: category ?? this.category,
      is_available: is_available ?? this.is_available,
    );
  }

  @override
  String toString() {
    return 'MenuModel(id: $id, name: $name, price: $price, image: $image, description: $description, category: $category, is_available: $is_available)';
  }

  @override
  bool operator ==(covariant MenuModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.image == image &&
        other.description == description &&
        other.category == category &&
        other.is_available == is_available;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        image.hashCode ^
        description.hashCode ^
        category.hashCode ^
        is_available.hashCode;
  }
}
