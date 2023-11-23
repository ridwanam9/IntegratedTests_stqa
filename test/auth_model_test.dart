// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:finalproject/model/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthModel', () {
    test('should create a valid AuthModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'status': 'success',
        'token_type': 'Bearer',
        'access_token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      };
      // act
      final result = AuthModel.fromMap(map);
      // assert
      expect(result, isA<AuthModel>());
      expect(result.status, 'success');
      expect(result.token_type, 'Bearer');
      expect(result.access_token,
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9');
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = AuthModel(
        status: 'success',
        token_type: 'Bearer',
        access_token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'status': 'success',
        'token_type': 'Bearer',
        'access_token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = AuthModel(
        status: 'success',
        token_type: 'Bearer',
        access_token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson =
          '{"status":"success","token_type":"Bearer","access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"}';
      expect(result, expectedJson);
    });

    test('should create a valid AuthModel from a JSON string', () {
      // arrange
      final json =
          '{"status":"success","token_type":"Bearer","access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"}';
      // act
      final result = AuthModel.fromJson(json);
      // assert
      expect(result, isA<AuthModel>());
      expect(result.status, 'success');
      expect(result.token_type, 'Bearer');
      expect(result.access_token,
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9');
    });

    test('should return a new AuthModel instance with updated fields', () {
      // arrange
      final model = AuthModel(
        status: 'success',
        token_type: 'Bearer',
        access_token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      );
      // act
      final result = model.copyWith(
        status: 'failure',
        token_type: 'Basic',
        access_token: 'Zm9vOmJhcg==',
      );
      // assert
      expect(result, isA<AuthModel>());
      expect(result.status, 'failure');
      expect(result.token_type, 'Basic');
      expect(result.access_token, 'Zm9vOmJhcg==');
    });

    test('should override toString and return a proper string representation of the model', () {
      // arrange
      final model = AuthModel(
        status: 'success',
        token_type: 'Bearer',
        access_token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      );
      // act
      final result = model.toString();
      // assert
      final expectedString =
          'AuthModel(status: success, token_type: Bearer, access_token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9)';
      expect(result, expectedString);
    });

    test('should override == operator and return true if two models are equal', () {
      // arrange
      final model1 = AuthModel(
        status: 'success',
        token_type: 'Bearer',
        access_token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      );
      final model2 = AuthModel(
        status: 'success',
        token_type: 'Bearer',
        access_token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, true);
    });

    test('should override == operator and return false if two models are not equal', () {
      // arrange
      final model1 = AuthModel(
        status: 'success',
        token_type: 'Bearer',
        access_token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      );
      final model2 = AuthModel(
        status: 'failure',
        token_type: 'Basic',
        access_token: 'Zm9vOmJhcg==',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, false);
    });

    test('should override hashCode and return a proper hash code', () {
      // arrange
      final model = AuthModel(
        status: 'success',
        token_type: 'Bearer',
        access_token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      );
      // act
      final result = model.hashCode;
      // assert
      final expectedHashCode = model.status.hashCode ^
          model.token_type.hashCode ^
          model.access_token.hashCode;
      expect(result, expectedHashCode);
    });
  });
}
