import 'package:flutter/cupertino.dart';

class GetDeliveryValueProvider extends ChangeNotifier {

  double priceDelivery;

  void getDeliveryValue(double id) {

    priceDelivery = id;
    notifyListeners();


  }
}
