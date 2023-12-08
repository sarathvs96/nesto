import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/customer_creation.dart';

class CustomerCreationProvider extends ChangeNotifier {
  CustomerCreation _customer = CustomerCreation(
    name: '',
    profilePic: '',
    mobileNumber: '',
    email: '',
    street: '',
    streetTwo: '',
    city: '',
    pincode: '',
    country: '',
    state: '',
  );

  CustomerCreation get customer => _customer;

  void updateCustomer(CustomerCreation newCustomer) {
    _customer = newCustomer;
    notifyListeners();
  }

  Future<void> createCustomer() async {
    final apiUrl = "YOUR_API_ENDPOINT"; // Replace with your API endpoint

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: _customerToJson(),
    );

    if (response.statusCode == 201) {
      print("Customer created successfully!");
    } else {
      print("Failed to create customer. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }

  String _customerToJson() {
    return '''
      {
        "name": "${_customer.name}",
        "profile_pic": "${_customer.profilePic}",
        "mobile_number": "${_customer.mobileNumber}",
        "email": "${_customer.email}",
        "street": "${_customer.street}",
        "street_two": "${_customer.streetTwo}",
        "city": "${_customer.city}",
        "pincode": "${_customer.pincode}",
        "country": "${_customer.country}",
        "state": "${_customer.state}"
      }
    ''';
  }
}
