// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:finalproject/model/menu_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MenuModel', () {
    test('should create a valid MenuModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'id': 1,
        'name': 'Pizza',
        'price': '10.00',
        'image': 'pizza.jpg',
        'description': 'A delicious pizza with cheese and tomato sauce',
        'category': 'Italian',
        'is_available': 1,
      };
      // act
      final result = MenuModel.fromMap(map);
      // assert
      expect(result, isA<MenuModel>());
      expect(result.id, 1);
      expect(result.name, 'Pizza');
      expect(result.price, '10.00');
      expect(result.image, 'pizza.jpg');
      expect(result.description,
          'A delicious pizza with cheese and tomato sauce');
      expect(result.category, 'Italian');
      expect(result.is_available, 1);
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = MenuModel(
        id: 1,
        name: 'Pizza',
        price: '10.00',
        image: 'pizza.jpg',
        description: 'A delicious pizza with cheese and tomato sauce',
        category: 'Italian',
        is_available: 1,
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'id': '1',
        'name': 'Pizza',
        'price': '10.00',
        'image': 'pizza.jpg',
        'description': 'A delicious pizza with cheese and tomato sauce',
        'category': 'Italian',
        'is_available': '1',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = MenuModel(
        id: 1,
        name: 'Pizza',
        price: '10.00',
        image: 'pizza.jpg',
        description: 'A delicious pizza with cheese and tomato sauce',
        category: 'Italian',
        is_available: 1,
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson =
          '{"id":"1","name":"Pizza","price":"10.00","image":"pizza.jpg","description":"A delicious pizza with cheese and tomato sauce","category":"Italian","is_available":"1"}';
      expect(result, expectedJson);
    });

    test('should create a valid MenuModel from a JSON string', () {
      // arrange
      final json =
          '{"id":1,"name":"Pizza","price":"10.00","image":"pizza.jpg","description":"A delicious pizza with cheese and tomato sauce","category":"Italian","is_available":1}';
      // act
      final result = MenuModel.fromJson(json);
      // assert
      expect(result, isA<MenuModel>());
      expect(result.id, 1);
      expect(result.name, 'Pizza');
      expect(result.price, '10.00');
      expect(result.image, 'pizza.jpg');
      expect(result.description,
          'A delicious pizza with cheese and tomato sauce');
      expect(result.category, 'Italian');
      expect(result.is_available, 1);
    });

    test('should return a new MenuModel instance with updated fields', () {
      // arrange
      final model = MenuModel(
        id: 1,
        name: 'Pizza',
        price: '10.00',
        image: 'pizza.jpg',
        description: 'A delicious pizza with cheese and tomato sauce',
        category: 'Italian',
        is_available: 1,
      );
      // act
      final result = model.copyWith(
        id: 2,
        name: 'Burger',
        price: '5.00',
        image: 'burger.jpg',
        description: 'A juicy burger with lettuce and cheese',
        category: 'American',
        is_available: 0,
      );
      // assert
      expect(result, isA<MenuModel>());
      expect(result.id, 2);
      expect(result.name, 'Burger');
      expect(result.price, '5.00');
      expect(result.image, 'burger.jpg');
      expect(result.description, 'A juicy burger with lettuce and cheese');
      expect(result.category, 'American');
      expect(result.is_available, 0);
    });

    test('should override toString and return a proper string representation of the model', () {
      // arrange
      final model = MenuModel(
        id: 1,
        name: 'Pizza',
        price: '10.00',
        image: 'pizza.jpg',
        description: 'A delicious pizza with cheese and tomato sauce',
        category: 'Italian',
        is_available: 1,
      );
      // act
      final result = model.toString();
      // assert
      final expectedString =
          'MenuModel(id: 1, name: Pizza, price: 10.00, image: pizza.jpg, description: A delicious pizza with cheese and tomato sauce, category: Italian, is_available: 1)';
      expect(result, expectedString);
    });

    test('should override == operator and return true if two models are equal', () {
      // arrange
      final model1 = MenuModel(
        id: 1,
        name: 'Pizza',
        price: '10.00',
        image: 'pizza.jpg',
        description: 'A delicious pizza with cheese and tomato sauce',
        category: 'Italian',
        is_available: 1,
      );
      final model2 = MenuModel(
        id: 1,
        name: 'Pizza',
        price: '10.00',
        image: 'pizza.jpg',
        description: 'A delicious pizza with cheese and tomato sauce',
        category: 'Italian',
        is_available: 1,
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, true);
    });

    test('should override == operator and return false if two models are not equal', () {
      // arrange
      final model1 = MenuModel(
        id: 1,
        name: 'Pizza',
        price: '10.00',
        image: 'pizza.jpg',
        description: 'A delicious pizza with cheese and tomato sauce',
        category: 'Italian',
        is_available: 1,
      );
      final model2 = MenuModel(
        id: 2,
        name: 'Burger',
        price: '5.00',
        image: 'burger.jpg',
        description: 'A juicy burger with lettuce and cheese',
        category: 'American',
        is_available: 0,
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, false);
    });

    test('should override hashCode and return a proper hash code', () {
      // arrange
      final model = MenuModel(
        id: 1,
        name: 'Pizza',
        price: '10.00',
        image: 'pizza.jpg',
        description: 'A delicious pizza with cheese and tomato sauce',
        category: 'Italian',
        is_available: 1,
      );
      // act
      final result = model.hashCode;
      // assert
      final expectedHashCode = model.id.hashCode ^
          model.name.hashCode ^
          model.price.hashCode ^
          model.image.hashCode ^
          model.description.hashCode ^
          model.category.hashCode ^
          model.is_available.hashCode;
      expect(result, expectedHashCode);
    });
  });
}
