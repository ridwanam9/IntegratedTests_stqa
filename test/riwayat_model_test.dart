// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:finalproject/model/riwayat_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RiwayatModel', () {
    test('should create a valid RiwayatModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'id': 1,
        'user_id': 2,
        'menu_id': 3,
        'jumlah': 4,
        'total': 5,
        'status': 'pending',
      };
      // act
      final result = RiwayatModel.fromMap(map);
      // assert
      expect(result, isA<RiwayatModel>());
      expect(result.id, 1);
      expect(result.user_id, 2);
      expect(result.menu_id, 3);
      expect(result.jumlah, 4);
      expect(result.total, 5);
      expect(result.status, 'pending');
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = RiwayatModel(
        id: 1,
        user_id: 2,
        menu_id: 3,
        jumlah: 4,
        total: 5,
        status: 'pending',
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'id': '1',
        'user_id': '2',
        'menu_id': '3',
        'jumlah': '4',
        'total': '5',
        'status': 'pending',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = RiwayatModel(
        id: 1,
        user_id: 2,
        menu_id: 3,
        jumlah: 4,
        total: 5,
        status: 'pending',
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson =
          '{"id":"1","user_id":"2","menu_id":"3","jumlah":"4","total":"5","status":"pending"}';
      expect(result, expectedJson);
    });

    test('should create a valid RiwayatModel from a JSON string', () {
      // arrange
      final json =
          '{"id":1,"user_id":2,"menu_id":3,"jumlah":4,"total":5,"status":"pending"}';
      // act
      final result = RiwayatModel.fromJson(json);
      // assert
      expect(result, isA<RiwayatModel>());
      expect(result.id, 1);
      expect(result.user_id, 2);
      expect(result.menu_id, 3);
      expect(result.jumlah, 4);
      expect(result.total, 5);
      expect(result.status, 'pending');
    });

    test('should return a new RiwayatModel instance with updated fields', () {
      // arrange
      final model = RiwayatModel(
        id: 1,
        user_id: 2,
        menu_id: 3,
        jumlah: 4,
        total: 5,
        status: 'pending',
      );
      // act
      final result = model.copyWith(
        id: 6,
        user_id: 7,
        menu_id: 8,
        jumlah: 9,
        total: 10,
        status: 'completed',
      );
      // assert
      expect(result, isA<RiwayatModel>());
      expect(result.id, 6);
      expect(result.user_id, 7);
      expect(result.menu_id, 8);
      expect(result.jumlah, 9);
      expect(result.total, 10);
      expect(result.status, 'completed');
    });

    test('should override toString and return a proper string representation of the model', () {
      // arrange
      final model = RiwayatModel(
        id: 1,
        user_id: 2,
        menu_id: 3,
        jumlah: 4,
        total: 5,
        status: 'pending',
      );
      // act
      final result = model.toString();
      // assert
      final expectedString =
          'RiwayatModel(id: 1, user_id: 2, menu_id: 3, jumlah: 4, total: 5, status: pending)';
      expect(result, expectedString);
    });

    test('should override == operator and return true if two models are equal', () {
      // arrange
      final model1 = RiwayatModel(
        id: 1,
        user_id: 2,
        menu_id: 3,
        jumlah: 4,
        total: 5,
        status: 'pending',
      );
      final model2 = RiwayatModel(
        id: 1,
        user_id: 2,
        menu_id: 3,
        jumlah: 4,
        total: 5,
        status: 'pending',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, true);
    });

    test('should override == operator and return false if two models are not equal', () {
      // arrange
      final model1 = RiwayatModel(
        id: 1,
        user_id: 2,
        menu_id: 3,
        jumlah: 4,
        total: 5,
        status: 'pending',
      );
      final model2 = RiwayatModel(
        id: 6,
        user_id: 7,
        menu_id: 8,
        jumlah: 9,
        total: 10,
        status: 'completed',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, false);
    });

    test('should override hashCode and return a proper hash code', () {
      // arrange
      final model = RiwayatModel(
        id: 1,
        user_id: 2,
        menu_id: 3,
        jumlah: 4,
        total: 5,
        status: 'pending',
      );
      // act
      final result = model.hashCode;
      // assert
      final expectedHashCode = model.id.hashCode ^
          model.user_id.hashCode ^
          model.menu_id.hashCode ^
          model.jumlah.hashCode ^
          model.total.hashCode ^
          model.status.hashCode;
      expect(result, expectedHashCode);
    });
  });
}
