import 'dart:convert';
import 'package:finalproject/model/tokenfirebase_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TokenFirebaseModel', () {
    test('should create a valid TokenFirebaseModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'token': 'fcm-token',
      };
      // act
      final result = TokenFirebaseModel.fromMap(map);
      // assert
      expect(result, isA<TokenFirebaseModel>());
      expect(result.token, 'fcm-token');
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = TokenFirebaseModel(
        token: 'fcm-token',
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'token': 'fcm-token',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = TokenFirebaseModel(
        token: 'fcm-token',
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson = '{"token":"fcm-token"}';
      expect(result, expectedJson);
    });

    test('should create a valid TokenFirebaseModel from a JSON string', () {
      // arrange
      final json = '{"token":"fcm-token"}';
      // act
      final result = TokenFirebaseModel.fromJson(json);
      // assert
      expect(result, isA<TokenFirebaseModel>());
      expect(result.token, 'fcm-token');
    });

    test('should return a new TokenFirebaseModel instance with updated fields', () {
      // arrange
      final model = TokenFirebaseModel(
        token: 'fcm-token',
      );
      // act
      final result = model.copyWith(
        token: 'new-token',
      );
      // assert
      expect(result, isA<TokenFirebaseModel>());
      expect(result.token, 'new-token');
    });

    test('should override toString and return a proper string representation of the model', () {
      // arrange
      final model = TokenFirebaseModel(
        token: 'fcm-token',
      );
      // act
      final result = model.toString();
      // assert
      final expectedString = 'TokenFirebaseModel(token: fcm-token)';
      expect(result, expectedString);
    });

    test('should override == operator and return true if two models are equal', () {
      // arrange
      final model1 = TokenFirebaseModel(
        token: 'fcm-token',
      );
      final model2 = TokenFirebaseModel(
        token: 'fcm-token',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, true);
    });

    test('should override == operator and return false if two models are not equal', () {
      // arrange
      final model1 = TokenFirebaseModel(
        token: 'fcm-token',
      );
      final model2 = TokenFirebaseModel(
        token: 'new-token',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, false);
    });

    test('should override hashCode and return a proper hash code', () {
      // arrange
      final model = TokenFirebaseModel(
        token: 'fcm-token',
      );
      // act
      final result = model.hashCode;
      // assert
      final expectedHashCode = model.token.hashCode;
      expect(result, expectedHashCode);
    });
  });
}
