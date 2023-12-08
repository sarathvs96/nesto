import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nesto/models/product.dart';
import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../models/customer.dart';


class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  DBEmployeeManager dbEmoployeeManager = DBEmployeeManager();

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final response = await Dio()
        .get('http://62.72.44.247/api/products/');
    final List<Product> fetchedEmployees =
    (response.data['data'] as List).map((e) => Product.fromJson(e)).toList();
    _products = fetchedEmployees;
    notifyListeners();
    await dbEmoployeeManager.storeDataInDatabase1(fetchedEmployees);
  }

  Future<void> searchProducts(String txt) async {
    final Database database = await openDatabase('product.db');

    final List<Map<String, dynamic>> results;
    if (txt.isNotEmpty) {
      results = await database.query(
        'Product',
        where: 'name LIKE ?',
        whereArgs: ['%$txt%'],
      );
    } else {
      results = await database.query('Product');
    }
    _products = results.map((map) => Product.fromJson(map)).toList();
    notifyListeners();
  }
}
