import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {

  String _paymentType = "";
  String _paymentMethod;

  String get paymentType => _paymentType;
  String get paymentMetthod => _paymentMethod;

  void setPaymentMethod(String v){
    _paymentMethod = v;
    notifyListeners();
  }

  void setPaymentType(String v) {
    _paymentType = v;
    notifyListeners();
  }
}
