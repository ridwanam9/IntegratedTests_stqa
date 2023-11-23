// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:finalproject/model/keranjang_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockKeranjangModel extends Mock implements KeranjangModel {}

void main() {
  group('KeranjangModel', () {
    test('should create a valid KeranjangModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'user_id': '1',
        'menu_id': '2',
        'jumlah': '3',
        'total': '4',
        'status': '5',
        'name': '6',
        'price': '7',
      };
      // act
      final result = KeranjangModel.fromMap(map);
      // assert
      expect(result, isA<KeranjangModel>());
      expect(result.user_id, '1');
      expect(result.menu_id, '2');
      expect(result.jumlah, '3');
      expect(result.total, '4');
      expect(result.status, '5');
      expect(result.name, '6');
      expect(result.price, '7');
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = KeranjangModel(
        user_id: '1',
        menu_id: '2',
        jumlah: '3',
        total: '4',
        status: '5',
        name: '6',
        price: '7',
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'user_id': '1',
        'menu_id': '2',
        'jumlah': '3',
        'total': '4',
        'status': '5',
        'name': '6',
        'price': '7',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = KeranjangModel(
        user_id: '1',
        menu_id: '2',
        jumlah: '3',
        total: '4',
        status: '5',
        name: '6',
        price: '7',
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson =
          '{"user_id":"1","menu_id":"2","jumlah":"3","total":"4","status":"5","name":"6","price":"7"}';
      expect(result, expectedJson);
    });

    test('should create a valid KeranjangModel from a JSON string', () {
      // arrange
      final json =
          '{"user_id":"1","menu_id":"2","jumlah":"3","total":"4","status":"5","name":"6","price":"7"}';
      // act
      final result = KeranjangModel.fromJson(json);
      // assert
      expect(result, isA<KeranjangModel>());
      expect(result.user_id, '1');
      expect(result.menu_id, '2');
      expect(result.jumlah, '3');
      expect(result.total, '4');
      expect(result.status, '5');
      expect(result.name, '6');
      expect(result.price, '7');
    });

    test('should return a new KeranjangModel instance with updated fields', () {
      // arrange
      final model = KeranjangModel(
        user_id: '1',
        menu_id: '2',
        jumlah: '3',
        total: '4',
        status: '5',
        name: '6',
        price: '7',
      );
      // act
      final result = model.copyWith(
        user_id: '8',
        menu_id: '9',
        jumlah: '10',
        total: '11',
        status: '12',
        name: '13',
        price: '14',
      );
      // assert
      expect(result, isA<KeranjangModel>());
      expect(result.user_id, '8');
      expect(result.menu_id, '9');
      expect(result.jumlah, '10');
      expect(result.total, '11');
      expect(result.status, '12');
      expect(result.name, '13');
      expect(result.price, '14');
    });

    test('should override toString and return a proper string representation of the model', () {
      // arrange
      final model = KeranjangModel(
        user_id: '1',
        menu_id: '2',
        jumlah: '3',
        total: '4',
        status: '5',
        name: '6',
        price: '7',
      );
      // act
      final result = model.toString();
      // assert
      final expectedString =
          'KeranjangModel(user_id: 1, menu_id: 2, jumlah: 3, total: 4, status: 5, name: 6, price: 7)';
      expect(result, expectedString);
    });

    test('should override == operator and return true if two models are equal', () {
      // arrange
      final model1 = KeranjangModel(
        user_id: '1',
        menu_id: '2',
        jumlah: '3',
        total: '4',
        status: '5',
        name: '6',
        price: '7',
      );
      final model2 = KeranjangModel(
        user_id: '1',
        menu_id: '2',
        jumlah: '3',
        total: '4',
        status: '5',
        name: '6',
        price: '7',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, true);
    });

    test('should override == operator and return false if two models are not equal', () {
      // arrange
      final model1 = KeranjangModel(
        user_id: '1',
        menu_id: '2',
        jumlah: '3',
        total: '4',
        status: '5',
        name: '6',
        price: '7',
      );
      final model2 = KeranjangModel(
        user_id: '8',
        menu_id: '9',
        jumlah: '10',
        total: '11',
        status: '12',
        name: '13',
        price: '14',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, false);
    });

    test('should override hashCode and return a proper hash code', () {
      // arrange
      final model = KeranjangModel(
        user_id: '1',
        menu_id: '2',
        jumlah: '3',
        total: '4',
        status: '5',
        name: '6',
        price: '7',
      );
      // act
      final result = model.hashCode;
      // assert
      final expectedHashCode = model.user_id.hashCode ^
          model.menu_id.hashCode ^
          model.jumlah.hashCode ^
          model.total.hashCode ^
          model.status.hashCode ^
          model.name.hashCode ^
          model.price.hashCode;
      expect(result, expectedHashCode);
    });
  });
}
