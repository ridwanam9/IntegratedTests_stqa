// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:finalproject/model/email_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailModel', () {
    test('should create a valid EmailModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'status': 'success',
        'email': 'foo@bar.com',
      };
      // act
      final result = EmailModel.fromMap(map);
      // assert
      expect(result, isA<EmailModel>());
      expect(result.status, 'success');
      expect(result.email, 'foo@bar.com');
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = EmailModel(
        status: 'success',
        email: 'foo@bar.com',
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'status': 'success',
        'email': 'foo@bar.com',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = EmailModel(
        status: 'success',
        email: 'foo@bar.com',
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson = '{"status":"success","email":"foo@bar.com"}';
      expect(result, expectedJson);
    });

    test('should create a valid EmailModel from a JSON string', () {
      // arrange
      final json = '{"status":"success","email":"foo@bar.com"}';
      // act
      final result = EmailModel.fromJson(json);
      // assert
      expect(result, isA<EmailModel>());
      expect(result.status, 'success');
      expect(result.email, 'foo@bar.com');
    });

    test('should return a new EmailModel instance with updated fields', () {
      // arrange
      final model = EmailModel(
        status: 'success',
        email: 'foo@bar.com',
      );
      // act
      final result = model.copyWith(
        status: 'failure',
        email: 'bar@foo.com',
      );
      // assert
      expect(result, isA<EmailModel>());
      expect(result.status, 'failure');
      expect(result.email, 'bar@foo.com');
    });

    test('should override toString and return a proper string representation of the model', () {
      // arrange
      final model = EmailModel(
        status: 'success',
        email: 'foo@bar.com',
      );
      // act
      final result = model.toString();
      // assert
      final expectedString = 'EmailModel(status: success, email: foo@bar.com)';
      expect(result, expectedString);
    });

    test('should override == operator and return true if two models are equal', () {
      // arrange
      final model1 = EmailModel(
        status: 'success',
        email: 'foo@bar.com',
      );
      final model2 = EmailModel(
        status: 'success',
        email: 'foo@bar.com',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, true);
    });

    test('should override == operator and return false if two models are not equal', () {
      // arrange
      final model1 = EmailModel(
        status: 'success',
        email: 'foo@bar.com',
      );
      final model2 = EmailModel(
        status: 'failure',
        email: 'bar@foo.com',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, false);
    });

    test('should override hashCode and return a proper hash code', () {
      // arrange
      final model = EmailModel(
        status: 'success',
        email: 'foo@bar.com',
      );
      // act
      final result = model.hashCode;
      // assert
      final expectedHashCode = model.status.hashCode ^ model.email.hashCode;
      expect(result, expectedHashCode);
    });
  });
}
