// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class KeranjangModel {
  String? user_id;
  String? menu_id;
  String? jumlah;
  String? total;
  String? status;
  String? name;
  String? price;
  KeranjangModel({
    this.user_id,
    this.menu_id,
    this.jumlah,
    this.total,
    this.status,
    this.name,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': user_id,
      'menu_id': menu_id,
      'jumlah': jumlah,
      'total': total,
      'status': status,
      'name': name,
      'price': price,
    };
  }

  factory KeranjangModel.fromMap(Map<String, dynamic> map) {
    return KeranjangModel(
      user_id: map['user_id'] != null ? map['user_id'] as String : null,
      menu_id: map['menu_id'] != null ? map['menu_id'] as String : null,
      jumlah: map['jumlah'] != null ? map['jumlah'] as String : null,
      total: map['total'] != null ? map['total'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory KeranjangModel.fromJson(String source) =>
      KeranjangModel.fromMap(json.decode(source) as Map<String, dynamic>);

  KeranjangModel copyWith({
    String? user_id,
    String? menu_id,
    String? jumlah,
    String? total,
    String? status,
    String? name,
    String? price,
  }) {
    return KeranjangModel(
      user_id: user_id ?? this.user_id,
      menu_id: menu_id ?? this.menu_id,
      jumlah: jumlah ?? this.jumlah,
      total: total ?? this.total,
      status: status ?? this.status,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  @override
  String toString() {
    return 'KeranjangModel(user_id: $user_id, menu_id: $menu_id, jumlah: $jumlah, total: $total, status: $status, name: $name, price: $price)';
  }

  @override
  bool operator ==(covariant KeranjangModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.user_id == user_id &&
      other.menu_id == menu_id &&
      other.jumlah == jumlah &&
      other.total == total &&
      other.status == status &&
      other.name == name &&
      other.price == price;
  }

  @override
  int get hashCode {
    return user_id.hashCode ^
      menu_id.hashCode ^
      jumlah.hashCode ^
      total.hashCode ^
      status.hashCode ^
      name.hashCode ^
      price.hashCode;
  }
}
