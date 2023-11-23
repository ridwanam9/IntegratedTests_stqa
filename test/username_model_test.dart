// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:finalproject/model/username_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsernameModel', () {
    test('should create a valid UsernameModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'status': 'success',
        'username': 'foo',
      };
      // act
      final result = UsernameModel.fromMap(map);
      // assert
      expect(result, isA<UsernameModel>());
      expect(result.status, 'success');
      expect(result.username, 'foo');
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = UsernameModel(
        status: 'success',
        username: 'foo',
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'status': 'success',
        'username': 'foo',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = UsernameModel(
        status: 'success',
        username: 'foo',
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson = '{"status":"success","username":"foo"}';
      expect(result, expectedJson);
    });

    test('should create a valid UsernameModel from a JSON string', () {
      // arrange
      final json = '{"status":"success","username":"foo"}';
      // act
      final result = UsernameModel.fromJson(json);
      // assert
      expect(result, isA<UsernameModel>());
      expect(result.status, 'success');
      expect(result.username, 'foo');
    });

    test('should return a new UsernameModel instance with updated fields', () {
      // arrange
      final model = UsernameModel(
        status: 'success',
        username: 'foo',
      );
      // act
      final result = model.copyWith(
        status: 'failure',
        username: 'bar',
      );
      // assert
      expect(result, isA<UsernameModel>());
      expect(result.status, 'failure');
      expect(result.username, 'bar');
    });

    test('should override toString and return a proper string representation of the model', () {
      // arrange
      final model = UsernameModel(
        status: 'success',
        username: 'foo',
      );
      // act
      final result = model.toString();
      // assert
      final expectedString = 'UsernameModel(status: success, username: foo)';
      expect(result, expectedString);
    });

    test('should override == operator and return true if two models are equal', () {
      // arrange
      final model1 = UsernameModel(
        status: 'success',
        username: 'foo',
      );
      final model2 = UsernameModel(
        status: 'success',
        username: 'foo',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, true);
    });

    test('should override == operator and return false if two models are not equal', () {
      // arrange
      final model1 = UsernameModel(
        status: 'success',
        username: 'foo',
      );
      final model2 = UsernameModel(
        status: 'failure',
        username: 'bar',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, false);
    });

    test('should override hashCode and return a proper hash code', () {
      // arrange
      final model = UsernameModel(
        status: 'success',
        username: 'foo',
      );
      // act
      final result = model.hashCode;
      // assert
      final expectedHashCode = model.status.hashCode ^ model.username.hashCode;
      expect(result, expectedHashCode);
    });
  });
}
