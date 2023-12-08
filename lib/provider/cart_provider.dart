
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    _quantity--;
    notifyListeners();
  }
}