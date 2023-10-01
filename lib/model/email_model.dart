// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EmailModel {
  String? status;
  String? email;
  EmailModel({
    this.status,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'email': email,
    };
  }

  factory EmailModel.fromMap(Map<String, dynamic> map) {
    return EmailModel(
      status: map['status'] != null ? map['status'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmailModel.fromJson(String source) => EmailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  EmailModel copyWith({
    String? status,
    String? email,
  }) {
    return EmailModel(
      status: status ?? this.status,
      email: email ?? this.email,
    );
  }

  @override
  String toString() => 'EmailModel(status: $status, email: $email)';

  @override
  bool operator ==(covariant EmailModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.email == email;
  }

  @override
  int get hashCode => status.hashCode ^ email.hashCode;
}
