// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsernameModel {
  String? status;
  String? username;
  UsernameModel({
    this.status,
    this.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'username': username,
    };
  }

  factory UsernameModel.fromMap(Map<String, dynamic> map) {
    return UsernameModel(
      status: map['status'] != null ? map['status'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsernameModel.fromJson(String source) => UsernameModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UsernameModel copyWith({
    String? status,
    String? username,
  }) {
    return UsernameModel(
      status: status ?? this.status,
      username: username ?? this.username,
    );
  }

  @override
  String toString() => 'UsernameModel(status: $status, username: $username)';

  @override
  bool operator ==(covariant UsernameModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.username == username;
  }

  @override
  int get hashCode => status.hashCode ^ username.hashCode;
}
