// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeleponModel {
  String? status;
  String? no_telp;
  TeleponModel({
    this.status,
    this.no_telp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'no_telp': no_telp,
    };
  }

  factory TeleponModel.fromMap(Map<String, dynamic> map) {
    return TeleponModel(
      status: map['status'] != null ? map['status'] as String : null,
      no_telp: map['no_telp'] != null ? map['no_telp'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeleponModel.fromJson(String source) => TeleponModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TeleponModel copyWith({
    String? status,
    String? no_telp,
  }) {
    return TeleponModel(
      status: status ?? this.status,
      no_telp: no_telp ?? this.no_telp,
    );
  }

  @override
  String toString() => 'TeleponModel(status: $status, no_telp: $no_telp)';

  @override
  bool operator ==(covariant TeleponModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.no_telp == no_telp;
  }

  @override
  int get hashCode => status.hashCode ^ no_telp.hashCode;
}
