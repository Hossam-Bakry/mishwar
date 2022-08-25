import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mishwar/Model/NotificationModel.dart';
import 'package:mishwar/Screens/Register.dart';

import 'GlobalVariables.dart';

class UserServices {
  String baseURL = GlobalVariables.URL;
  String GlobalURL = GlobalVariables.url;

  Future<Map<String, dynamic>> LoginServicesTest(
    String username,
    String password,
    String token,
  ) async {
    try {
      final responce = await http.post(
        Uri.parse(
            'http://www.mishwar.elmasren.com/api/Users/Login?username=${username}&password=${password}'),
      );
      // final responce = await http.post(uri);

      print('Responce => ${responce.body}');
      print("responce code => ${responce.statusCode}");
      print("0000000000000000000000000111111111111111111111111");

      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(' Error => ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> RegisterServices(
    var username,
    var email,
    var password,
    var verifyPassword,
    var phone,
    var token,
  ) async {
    String url = baseURL + "/user/Register";
    print(url);
    var body = {
      "username": username,
      "email": email,
      "password": password,
      "verifypassword": verifyPassword,
      "phone": phone,
      "platform": "Android",
      "token": token
    };
    print(body);
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

  Future<Map<String, dynamic>> mobileActivation(var phone, var code) async {
    String url = baseURL + "/user/mobileActivation";
    print(url);
    var body = {"email": phone, "activcode": code};
    print(body);
    try {
      final responce = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> getUserData(var user_id) async {
    // String url = baseURL + "/user/profile";
    String url = GlobalURL + "/users/GetProfile?UserId=${user_id}";
    var body = {"user_id": user_id};
    try {

      final response = await http.get(Uri.parse(url));

      print('get profile response: ${response.body}');
      if (response.body.isNotEmpty) {
        print(response.body);
        return json.decode(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> updateProfile(
      var user_id, var username, var email, var phone) async {
    String url = baseURL + "/user/updateProfile";
    var body = {
      "user_id": user_id,
      "username": username,
      "email": email,
      "phone": phone
    };
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

  Future<Map<String, dynamic>> sendCode(var phone) async {
    String url = baseURL + "/userForgetPassword/sendCode";
    print(url);
    var body = {
      "email": phone,
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

  Future<Map<String, dynamic>> CheckCode(var phone, var code) async {
    String url = baseURL + "/userForgetPassword/checkCode";
    print(url);
    var body = {
      "email": phone,
      "activecode": code,
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

  Future<Map<String, dynamic>> changeForgetPassword(
      var phone, var code, var password, var verifyPassword) async {
    String url = baseURL + "/Userforgetpassword/change";
    print(url);
    print("ssssssssssssss");
    var body = {
      "email": phone,
      "activecode": code,
      "password": password,
      "verifypassword": verifyPassword
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

  Future<List<NotificationDetail>> GetNotifiction(var user_id) async {
    var url = "${GlobalVariables.URL}/notification/all";
    var body = {"user_id": user_id};
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(response.body);
      print("responceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      if (response.statusCode == 200 && response.body != null) {
        List slideritems =
            json.decode(utf8.decode(response.bodyBytes))["Message"];
        return slideritems.map((e) => NotificationDetail.fromJson(e)).toList();
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }
}

/* Future<Map<String, dynamic>> LoginServices(
    var username,
    var password,
    var token,
  ) async {
    String url = baseURL + "/user/login";

    var body = {
      "username": username,
      "password": password,
      "platform": "Android",
      "token": token
    };

    print(body);
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
        print(json.decode(responce.body));
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }*/
