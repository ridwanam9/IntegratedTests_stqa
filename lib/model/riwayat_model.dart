// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RiwayatModel {
  int? id;
  int? user_id;
  int? menu_id;
  int? jumlah;
  int? total;
  String? status;
  RiwayatModel({
    this.id,
    this.user_id,
    this.menu_id,
    this.jumlah,
    this.total,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id.toString(),
      'user_id': user_id.toString(),
      'menu_id': menu_id.toString(),
      'jumlah': jumlah.toString(),
      'total': total.toString(),
      'status': status,
    };
  }

  factory RiwayatModel.fromMap(Map<String, dynamic> map) {
    return RiwayatModel(
      id: map['id'] != null ? map['id'] as int : null,
      user_id: map['user_id'] != null ? map['user_id'] as int : null,
      menu_id: map['menu_id'] != null ? map['menu_id'] as int : null,
      jumlah: map['jumlah'] != null ? map['jumlah'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RiwayatModel.fromJson(String source) =>
      RiwayatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  RiwayatModel copyWith({
    int? id,
    int? user_id,
    int? menu_id,
    int? jumlah,
    int? total,
    String? status,
  }) {
    return RiwayatModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      menu_id: menu_id ?? this.menu_id,
      jumlah: jumlah ?? this.jumlah,
      total: total ?? this.total,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'RiwayatModel(id: $id, user_id: $user_id, menu_id: $menu_id, jumlah: $jumlah, total: $total, status: $status)';
  }

  @override
  bool operator ==(covariant RiwayatModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user_id == user_id &&
        other.menu_id == menu_id &&
        other.jumlah == jumlah &&
        other.total == total &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        menu_id.hashCode ^
        jumlah.hashCode ^
        total.hashCode ^
        status.hashCode;
  }
}
