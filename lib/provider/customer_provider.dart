import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../models/customer.dart';


class CustomerProvider extends ChangeNotifier {
  List<Customer> _customers = [];
  DBEmployeeManager dbEmoployeeManager = DBEmployeeManager();

  List<Customer> get customers => _customers;

  Future<void> fetchCustomers() async {
    final response = await Dio()
        .get('http://62.72.44.247/api/customers/');
    final List<Customer> fetchedEmployees =
    (response.data['data'] as List).map((e) => Customer.fromJson(e)).toList();
    _customers = fetchedEmployees;
    notifyListeners();
    await dbEmoployeeManager.storeDataInDatabase(fetchedEmployees);
  }

  Future<void> searchCustomers(String txt) async {
    final Database database = await openDatabase('customer.db');

    final List<Map<String, dynamic>> results;
    if (txt.isNotEmpty) {
      results = await database.query(
        'Customers',
        where: 'name LIKE ?',
        whereArgs: ['%$txt%'],
      );
    } else {
      results = await database.query('Customers');
    }

    _customers = results.map((map) => Customer.fromJson(map)).toList();
    notifyListeners();
  }
}
