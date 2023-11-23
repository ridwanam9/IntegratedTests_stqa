// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:finalproject/model/telepon_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TeleponModel', () {
    test('should create a valid TeleponModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'status': 'success',
        'no_telp': '08123456789',
      };
      // act
      final result = TeleponModel.fromMap(map);
      // assert
      expect(result, isA<TeleponModel>());
      expect(result.status, 'success');
      expect(result.no_telp, '08123456789');
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = TeleponModel(
        status: 'success',
        no_telp: '08123456789',
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'status': 'success',
        'no_telp': '08123456789',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = TeleponModel(
        status: 'success',
        no_telp: '08123456789',
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson = '{"status":"success","no_telp":"08123456789"}';
      expect(result, expectedJson);
    });

    test('should create a valid TeleponModel from a JSON string', () {
      // arrange
      final json = '{"status":"success","no_telp":"08123456789"}';
      // act
      final result = TeleponModel.fromJson(json);
      // assert
      expect(result, isA<TeleponModel>());
      expect(result.status, 'success');
      expect(result.no_telp, '08123456789');
    });

    test('should return a new TeleponModel instance with updated fields', () {
      // arrange
      final model = TeleponModel(
        status: 'success',
        no_telp: '08123456789',
      );
      // act
      final result = model.copyWith(
        status: 'failure',
        no_telp: '09876543210',
      );
      // assert
      expect(result, isA<TeleponModel>());
      expect(result.status, 'failure');
      expect(result.no_telp, '09876543210');
    });

    test('should override toString and return a proper string representation of the model', () {
      // arrange
      final model = TeleponModel(
        status: 'success',
        no_telp: '08123456789',
      );
      // act
      final result = model.toString();
      // assert
      final expectedString = 'TeleponModel(status: success, no_telp: 08123456789)';
      expect(result, expectedString);
    });

    test('should override == operator and return true if two models are equal', () {
      // arrange
      final model1 = TeleponModel(
        status: 'success',
        no_telp: '08123456789',
      );
      final model2 = TeleponModel(
        status: 'success',
        no_telp: '08123456789',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, true);
    });

    test('should override == operator and return false if two models are not equal', () {
      // arrange
      final model1 = TeleponModel(
        status: 'success',
        no_telp: '08123456789',
      );
      final model2 = TeleponModel(
        status: 'failure',
        no_telp: '09876543210',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, false);
    });

    test('should override hashCode and return a proper hash code', () {
      // arrange
      final model = TeleponModel(
        status: 'success',
        no_telp: '08123456789',
      );
      // act
      final result = model.hashCode;
      // assert
      final expectedHashCode = model.status.hashCode ^ model.no_telp.hashCode;
      expect(result, expectedHashCode);
    });
  });
}
