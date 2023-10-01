import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TokenFirebaseModel {
  String? token;
  TokenFirebaseModel({
    this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory TokenFirebaseModel.fromMap(Map<String, dynamic> map) {
    return TokenFirebaseModel(
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenFirebaseModel.fromJson(String source) =>
      TokenFirebaseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TokenFirebaseModel copyWith({
    String? token,
  }) {
    return TokenFirebaseModel(
      token: token ?? this.token,
    );
  }

  @override
  String toString() => 'TokenFirebaseModel(token: $token)';

  @override
  bool operator ==(covariant TokenFirebaseModel other) {
    if (identical(this, other)) return true;

    return other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
