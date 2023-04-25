import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mishwar/Model/CategoryModel.dart';
import 'package:mishwar/Model/ProductModel.dart';
import 'package:mishwar/Model/PromotionItemsModel.dart';
import 'package:mishwar/Model/SubProductModel.dart';
import 'GlobalVariables.dart';
import 'package:mishwar/app/AppConfig.dart';

class ProductServices {

  var baseURL = GlobalVariables.url;

  getCategory() async {
    try {
      final response = await http.get(
        Uri.parse('${baseURL}/foodCategory/GetFoodCategories'),
        headers: await getHeader(),
      );

      if (response.statusCode == 200 && response.body != null) {

        List categoryItems = json.decode(utf8.decode(response.bodyBytes));

        // var Response = CategoryModel.fromJson(jsonDecode(response.body));

        appConfig.dApp.mainCategoryListFetch(categoryItems.map((e) => CategoryDetail.fromJson(e)).toList());
        // appConfig.dApp.mainCategoryListFetch(Response.categoryDetail);
        appConfig.dApp.setSelectedCategory(appConfig.dApp.mainCategoryList[0]);

      }
    } catch (e) {
      print('$e,,,,error main Products');
      // print('$e,,,,error main Products again');
    }
  }

  getProduct(var id, var page) async {
    print('${appConfig.dApp.selectedCategory},,selectedCategory');

    try {
      final response = await http.get(
        Uri.parse('${baseURL}/FoodItem/GetFoodItemsByCategoryID?categoryId=$id'),
        headers: await getHeader(),
      );
      if (response.statusCode == 200 && response.body != null) {

        List listOfProducts = jsonDecode(response.body);
        List<ProductDetail> l = listOfProducts.map((e) => ProductDetail.fromJson(e)).toList();
        appConfig.dApp.mainProductsListFetch(l);

        // var Response = ProductModel.fromJson(jsonDecode(response.body));
        // appConfig.dApp.mainProductsListFetch(Response.message);

      }
    } catch (e) {
      print('$e,,,,error main products');
    }
  }

  Future<List<SubProductDetail>> GetSubProduct(var id) async {
    try {
      final response = await http.get(
        Uri.parse('${baseURL}/home/GetSubItems?product_id=$id'),
        headers: await getHeader(),
      );
      print("000000000000000");
      if (response.statusCode == 200 && response.body != null) {
        var Response = SubProductModel.fromJson(jsonDecode(response.body));
        print('Response => $Response');
        return Response.subProductDetail;
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }
  Future<List<ProductDetail>> GetAllPromosUpdate() async {

    try {
      final response = await http.get(
        Uri.parse('${baseURL}/FoodItem/GetFoodItemsByCategoryID?categoryId=0'),
        headers: await getHeader(),
      );
      print(' all promo => ${response.body}');
      print("000000000000000");
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);

        List slideritems =
        json.decode(response.body);
        return slideritems.map((e) => ProductDetail.fromJson(e)).toList();

      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

  Future<List<Message>> GetAllPromos() async {
    var url = "${GlobalVariables.URL}/config/AllPromos";
    print(url);

    try {
      final response =
          await http.post(Uri.parse(url), headers: await getHeader());
      print(response.body);
      print("000000000000000");
      if (response.statusCode == 200) {
        List slideritems =
            json.decode(utf8.decode(response.bodyBytes))["Message"];
        return slideritems.map((e) => Message.fromJson(e)).toList();
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

}

ProductServices productServices = ProductServices();

// getCategory() async {
//   // var url = "${GlobalVariables.URL}/food/AllCategories";
//   try {
//     // final response = await http.post(
//     //   Uri.parse(url),
//     //   headers: await getHeader(),
//     // );
//     final response = await http.get(
//       Uri.parse(
//           'http://www.mishwar.elmasren.com/api/home/GetAllCategories'),
//       headers: await getHeader(),
//     );
//     // print('Body => ${response.body}');
//
//     if (response.statusCode == 200 && response.body != null) {
//       print(' statusCode => ${response.statusCode}');
//       var Response = CategoryModel.fromJson(jsonDecode(response.body));
//       // List sliderItems = json.decode(
//       //     appConfig.cApp.appLocale.toString() == "ar"
//       //         ? utf8.decode(response.bodyBytes)
//       //         : response.body)["Message"];
//
//       // print(Response);
//
//       appConfig.dApp.mainCategoryListFetch(Response.categoryDetail);
//
//       // appConfig.dApp.mainCategoryListFetch(
//       //     sliderItems.map((e) => CategoryDetail.fromJson(e)).toList());
//       appConfig.dApp.setSelectedCategory(appConfig.dApp.mainCategoryList[0]);
//       // print('heeeeeeeeeeeeee');
//     }
//   } catch (e) {
//     print('$e,,,,error main Products');
//   }
// }

// getProduct(var id, var page) async {
//
//   var url = "${GlobalVariables.URL}/food/AllItems?page=$page";
//   // var body = {"category_id": id};
//   // print('${body},,daadad'); //appConfig.dApp
//
//   print('${appConfig.dApp.selectedCategory},,selectedCategory');
//
//   try {
//     /*final response = await http.post(Uri.parse(url),
//         body: json.encode(body), headers: await getHeader(),
//       );*/
//     final response = await http.get(
//       Uri.parse(
//         'http://www.mishwar.elmasren.com/api/home/GetFoodItemsByCategoryID?categoryId=$id',
//       ),
//       headers: await getHeader(),
//     );
//     if (response.statusCode == 200 && response.body != null) {
//
//       print(' statusCode => ${response.statusCode}');
//       var Response = ProductModel.fromJson(jsonDecode(response.body));
//
//       print(' Response => ${Response.message}');
//
//       List slideritems = json.decode(
//           appConfig.cApp.appLocale.toString() == "ar"
//               ? utf8.decode(response.bodyBytes)
//               : response.body)["Message"];
//
//
//       appConfig.dApp.mainProductsListFetch(Response.message);
//
//       print('db => ${appConfig.dApp.mainProductsList[0].image}');
//
//       appConfig.dApp.mainProductsListFetch(
//           slideritems.map((e) => ProductDetail.fromJson(e)).toList());
//
//       //  return slideritems.map((e) => ProductDetail.fromJson(e)).toList();
//     }
//   } catch (e) {
//     print('$e,,,,error main products');
//   }
// }

// Future<List<SubProductDetail>> GetSubProduct(var id) async {
//   var url = "${GlobalVariables.URL}/food/GetSubItems";
//   // var body = {"product_id": id};
//   // print(body);
//   try {
//     /*final response = await http.post(Uri.parse(url),
//           body: json.encode(body), headers: await getHeader());*/
//
//     final response = await http.get(
//       Uri.parse(
//         'http://www.mishwar.elmasren.com/api/home/GetSubItems?product_id=$id',
//       ),
//       headers: await getHeader(),
//     );
//
//     print(response.body);
//     print("000000000000000");
//     if (response.statusCode == 200 && response.body != null) {
//
//       var Response = SubProductDetail.fromJson(jsonDecode(response.body));
//       print(Response);
//
//       List slideritems =
//       json.decode(response.body)["Message"];
//       print('slider ${slideritems}');
//
//       return slideritems.map((e) => SubProductDetail.fromJson(e)).toList();
//     }
//   } catch (e) {
//     print('$e,,,,error search doctors');
//   }
// }

// Future<List<Message>> GetAllPromos() async {
//   var url = "${GlobalVariables.URL}/config/AllPromos";
//   print(url);
//
//   try {
//     final response =
//     await http.post(Uri.parse(url), headers: await getHeader());
//     print(response.body);
//     print("000000000000000");
//     if (response.statusCode == 200) {
//       List slideritems =
//       json.decode(utf8.decode(response.bodyBytes))["Message"];
//       return slideritems.map((e) => Message.fromJson(e)).toList();
//     }
//   } catch (e) {
//     print('$e,,,,error search doctors');
//   }
// }
