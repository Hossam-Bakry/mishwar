import 'package:flutter/cupertino.dart';

class GetDeliveryValueProvider extends ChangeNotifier {

  double priceDelivery = 0;

  void getDeliveryValue(double id) {

    priceDelivery = id;
    notifyListeners();


  }
}
