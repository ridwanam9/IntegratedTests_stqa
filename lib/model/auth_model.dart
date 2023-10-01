import 'dart:convert';

class AuthModel {
  String? status;
  String? token_type;
  String? access_token;
  AuthModel({
    this.status,
    this.token_type,
    this.access_token,
  });

  AuthModel copyWith({
    String? status,
    String? token_type,
    String? access_token,
  }) {
    return AuthModel(
      status: status ?? this.status,
      token_type: token_type ?? this.token_type,
      access_token: access_token ?? this.access_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'token_type': token_type,
      'access_token': access_token,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      status: map['status'] as String,
      token_type: map['token_type'] as String,
      access_token: map['access_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AuthModel(status: $status, token_type: $token_type, access_token: $access_token)';

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.token_type == token_type &&
        other.access_token == access_token;
  }

  @override
  int get hashCode =>
      status.hashCode ^ token_type.hashCode ^ access_token.hashCode;
}
