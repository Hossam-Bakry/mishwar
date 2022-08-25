import 'package:meta/meta.dart';

class ProductModel {
  ProductModel({
    @required this.statusCode,
    @required this.message,
    @required this.messageCode,
  });

  final int statusCode;
  final List<ProductDetail> message;
  final String messageCode;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        message: json["message"] == null
            ? null
            : List<ProductDetail>.from(
                json["message"].map((x) => ProductDetail.fromJson(x))),
        messageCode: json["messageCode"] == null ? null : json["messageCode"],
      );
}

class ProductDetail {
  ProductDetail({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.foodCategoryId,
    @required this.price,
    @required this.price2,
    @required this.image,
    @required this.haveChilds,
    @required this.subItems,
    @required this.haveOffers,
    @required this.offerItems,
  });

  final String id;
  final String name;
  final String description;
  final String foodCategoryId;
  final String price;
  final String price2;
  final String image;
  final bool haveChilds;
  final List<SubProductDetail1> subItems;
  final bool haveOffers;
  final List<SubProductDetail1> offerItems;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        foodCategoryId:
            json["foodCategoryId"] == null ? null : json["foodCategoryId"],
        price: json["price"] == null ? null : json["price"],
        price2: json["price2"] == null ? null : json["price2"],
        image: json["image"] == null ? null : json["image"],
        haveChilds: json["haveChilds"] == null ? null : json["haveChilds"],
        subItems: json["subItems"] == null
            ? null
            : List<SubProductDetail1>.from(
                json["subItems"].map((x) => SubProductDetail1.fromJson(x))),
        haveOffers: json["haveOffers"] == null ? null : json["haveOffers"],
        offerItems: json["offerItems"] == null
            ? null
            : List<SubProductDetail1>.from(
                json["offerItems"].map((x) => SubProductDetail1.fromJson(x))),
      );
}

class SubProductDetail1 {

  SubProductDetail1({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.foodCategoryId,
    @required this.price,
    @required this.price2,
    @required this.image,
  });

  final String id;
  final String name;
  final String description;
  final String foodCategoryId;
  final String price;
  final String price2;
  final String image;

  factory SubProductDetail1.fromJson(Map<String, dynamic> json) =>
      SubProductDetail1(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        foodCategoryId:
            json["foodCategoryId"] == null ? null : json["foodCategoryId"],
        price: json["price"] == null ? null : json["price"],
        price2: json["price2"] == null ? null : json["price2"],
        image: json["image"] == null ? null : json["image"],
      );
}
