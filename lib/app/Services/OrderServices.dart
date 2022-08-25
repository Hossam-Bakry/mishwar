import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mishwar/Model/CancelOrder.dart';
import 'package:mishwar/Model/HomeDeliveryOrderModel.dart';
import 'package:mishwar/Model/OrderDeliveryModel.dart';
import 'package:mishwar/Model/OrderDetailUpdate.dart';

import 'package:mishwar/Model/OrderStatusModel.dart';
import 'package:mishwar/Model/OrdersModel.dart';
import 'GlobalVariables.dart';

class OrderServices {
  String baseURL = GlobalVariables.URL;

  Future<Map<String, dynamic>> MakeOrder(var body) async {
    String url = baseURL + "/Order/Create";
    try {
      final responce = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: await getHeader(),
      );
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> MakeOrderUpdate(
      var body, String userId, String branchId) async {
    try {
      final responce = await http.post(
        Uri.parse(
            'http://www.mishwar.elmasren.com/api/order/CreateOrder?userId=$userId&branchId=$branchId'),
        body: json.encode(body),
        headers: await getHeader(),
      );
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<OrderStatusDetail>> GetOrderStatusUser() async {
    var url = "${GlobalVariables.URL}/Order/UserStatuses";
    print(url);
    try {
      final response =
          await http.post(Uri.parse(url), headers: await getHeader());
      print(response.body);
      print("00000000000000000000000000");
      if (response.statusCode == 200 && response.body != null) {
        List slideritems =
            json.decode(utf8.decode(response.bodyBytes))["Message"];
        return slideritems.map((e) => OrderStatusDetail.fromJson(e)).toList();
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

  Future<List<OrderStatusDetail>> GetOrderStatusDelevery() async {

    String url = "${GlobalVariables.URL}/delivery/statuses";

    print(url);
    print(await getHeader());
    try {
      final response =
          await http.post(Uri.parse(url), headers: await getHeader());
      print(response.body);
      print("00000000000000000000000000");
      if (response.statusCode == 200 && response.body != null) {
        List slideritems =
            json.decode(utf8.decode(response.bodyBytes))["Message"];
        return slideritems.map((e) => OrderStatusDetail.fromJson(e)).toList();
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

  Future<List<OrdersList>> GetOrdersUpdate(
      String user_id, String status_id) async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://www.mishwar.elmasren.com/api/Order/GetOrdersByStatus?userid=$user_id&statusid=$status_id'),
        headers: await getHeader(),
      );

      if (response.statusCode == 200 && response.body != null) {
        List slideritems = json.decode(response.body)["list"];

        return slideritems.map((e) => OrdersList.fromJson(e)).toList();
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

  Future<OrderDetailNew> GetOrdersDetailsUpdate(String order_Id) async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://www.mishwar.elmasren.com/api/Order/GetOrderProducts?orderId=31584'),
        headers: await getHeader(),
      );

      if (response.statusCode == 200 && response.body != null) {
        print(response.body);

        var Response = OrderDetailNew.fromJson(jsonDecode(response.body));
        List slideritems = json.decode(response.body)["List"];

        return Response;
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

  Future<OrderCancel> cancelOrder(int orderId) async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://www.mishwar.elmasren.com/api/Order/CancellOrderByOrderId?orderId=$orderId'),
        headers: await getHeader(),
      );
      if (response.statusCode == 200) {
        print(response.body);
        var Response = OrderCancel.fromJson(jsonDecode(response.body));

        return Response;
      }
    } catch (e) {
      print('$e,,,,error cancel order');
    }
  }

  Future<List<DeliveryOrderDetail>> GetOrdersDelivery(
      var user_id, var status_id) async {
    var url = "${GlobalVariables.URL}/delivery/All?page=1";
    print(url);
    var body = {"driver_id": user_id, "status_id": status_id};
    print(body);
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(response.body);
      if (response.statusCode == 200 && response.body != null) {
        List slideritems =
            json.decode(utf8.decode(response.bodyBytes))["Message"];
        return slideritems.map((e) => DeliveryOrderDetail.fromJson(e)).toList();
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

  Future<List<HomeDeliveryOrderDetail>> GetDeliveryHome(var user_id) async {
    var url = "${GlobalVariables.URL}/delivery/Home";
    print(url);
    var body = {"driver_id": user_id};
    print('${body},,,,,,,,,,,,body main driver');
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(response.body);
      print("responceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      if (response.statusCode == 200 && response.body != null) {
        List slideritems =
            json.decode(utf8.decode(response.bodyBytes))["Message"];
        return slideritems
            .map((e) => HomeDeliveryOrderDetail.fromJson(e))
            .toList();
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

  Future<Map<String, dynamic>> EndOrder(var driver_id, var order_id) async {
    String url = baseURL + "/delivery/EndDelivery";
    print(url);
    var body = {"driver_id": driver_id, "order_id": order_id};
    print(body);
    print("000000000000000000000000000000000000000000000000000000000000000");
    try {
      final responce = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> StartOrder(var driver_id, var order_id) async {
    String url = baseURL + "/delivery/StartDelivery";
    var body = {"driver_id": driver_id, "order_id": order_id};
    try {
      final responce = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> CancelOrder(
      var driver_id, var order_id, var cancel_reason) async {
    String url = baseURL + "/delivery/CancelDelivery";
    print(url);
    var body = {
      "driver_id": driver_id,
      "order_id": order_id,
      "cancel_reason": "Aaaaaaa"
    };
    print(body);

    try {
      final responce = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> CancelDeliveryAfterConfirm(
      var driver_id, var order_id, var cancel_reason) async {
    String url = baseURL + "/delivery/CancelDeliveryAfterConfirm";
    print(url);
    var body = {
      "driver_id": driver_id,
      "order_id": order_id,
      "cancel_reason": "Aaaaaaa"
    };
    print(body);

    try {
      final responce = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

/*
Future<List<OrderDetailModel>> GetOrders(var user_id, var status_id) async {
  var url = "${GlobalVariables.URL}/Order/All?page=1";
  print(url);

  var body = {"user_id": user_id, "status_id": status_id};

  print("444=$user_id");
  print("555=$status_id");
  print(body);
  try {
    final response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: await getHeader());
    print(response.body);
    if (response.statusCode == 200 && response.body != null) {
      List slideritems =
      json.decode(utf8.decode(response.bodyBytes))["Message"];
      return slideritems.map((e) => OrderDetailModel.fromJson(e)).toList();
    }
  } catch (e) {
    print('$e,,,,error search doctors');
  }
}
*/
