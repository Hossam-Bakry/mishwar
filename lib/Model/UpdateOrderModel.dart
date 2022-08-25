//
// class UpdateOrderModel {
//
//   UpdateOrderModel.fromJson(dynamic json) {
//     statusCode = json['statusCode'];
//     messageCode = json['messageCode'];
//     if (json['list'] != null) {
//       list = [];
//       json['list'].forEach((v) {
//         list.add(OrderList.fromJson(v));
//       });
//     }
//   }
//
//   int statusCode;
//   String messageCode;
//   List<OrderList> list;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['statusCode'] = statusCode;
//     map['messageCode'] = messageCode;
//     if (list != null) {
//       map['List'] = list.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }
//
// class OrderList {
//
//   int userID;
//   int orderID;
//   String orderNumber;
//   String orderDate;
//   double subTotal;
//   double discount;
//   double tax;
//   dynamic deliveryValue;
//   double totalValue;
//   double allQuantity;
//   dynamic longitude;
//   dynamic latitude;
//   int addressID;
//   int driverID;
//   dynamic driverLat;
//   dynamic driverLong;
//   int orderStatusId;
//   int paymentType;
//   int appDeliveryType;
//   int appPaymentType;
//   String region;
//   dynamic flat;
//   dynamic floor;
//   dynamic address;
//   dynamic phone;
//   dynamic addressLat;
//   dynamic addressLong;
//   String notes;
//   List<Items> items;
//
//   OrderList.fromJson(dynamic json) {
//     userID = json['userID'];
//     orderID = json['orderID'];
//     orderNumber = json['orderNumber'];
//     orderDate = json['orderDate'];
//     subTotal = json['subTotal'];
//     discount = json['discount'];
//     tax = json['tax'];
//     deliveryValue = json['deliveryValue'];
//     totalValue = json['totalValue'];
//     allQuantity = json['allQuantity'];
//     longitude = json['longitude'];
//     latitude = json['latitude'];
//     addressID = json['addressID'];
//     driverID = json['driverID'];
//     driverLat = json['driverLat'];
//     driverLong = json['driverLong'];
//     orderStatusId = json['orderStatusId'];
//     paymentType = json['paymentType'];
//     appDeliveryType = json['appDeliveryType'];
//     appPaymentType = json['appPaymentType'];
//     region = json['region'];
//     flat = json['flat'];
//     floor = json['floor'];
//     address = json['address'];
//     phone = json['phone'];
//     addressLat = json['addressLat'];
//     addressLong = json['addressLong'];
//     notes = json['notes'];
//     if (json['items'] != null) {
//       items = [];
//       json['items'].forEach((v) {
//         items.add(Items.fromJson(v));
//       });
//     }
//   }
//
//
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['userID'] = userID;
//     map['orderID'] = orderID;
//     map['orderNumber'] = orderNumber;
//     map['orderDate'] = orderDate;
//     map['subTotal'] = subTotal;
//     map['discount'] = discount;
//     map['tax'] = tax;
//     map['deliveryValue'] = deliveryValue;
//     map['totalValue'] = totalValue;
//     map['allQuantity'] = allQuantity;
//     map['longitude'] = longitude;
//     map['latitude'] = latitude;
//     map['addressID'] = addressID;
//     map['driverID'] = driverID;
//     map['driverLat'] = driverLat;
//     map['driverLong'] = driverLong;
//     map['orderStatusId'] = orderStatusId;
//     map['paymentType'] = paymentType;
//     map['appDeliveryType'] = appDeliveryType;
//     map['appPaymentType'] = appPaymentType;
//     map['region'] = region;
//     map['flat'] = flat;
//     map['floor'] = floor;
//     map['address'] = address;
//     map['phone'] = phone;
//     map['addressLat'] = addressLat;
//     map['addressLong'] = addressLong;
//     map['notes'] = notes;
//     if (items != null) {
//       map['items'] = items.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }
//
// /// orderDetailsId : 79686
// /// OrderId : 31585
// /// ItemName : "صحن فتوش"
// /// Image : "http://195.181.247.217/Content/images/1.jpg"
// /// ItemId : 1
// /// UnitId : null
// /// Quantity : 4
// /// Price : 11
// /// SubTotal : 50.6
// /// Discount : 0
// /// DiscountPercent : 0
// /// TotalValue : 44
// /// Notes : null
// /// IsEdit : false
// /// EditQuantity : null
// /// MasterId : 0
// /// IsReady : null
//
// class Items {
//
//   Items.fromJson(dynamic json) {
//     orderDetailsId = json['orderDetailsId'];
//     orderId = json['orderId'];
//     itemName = json['itemName'];
//     image = json['image'];
//     itemId = json['itemId'];
//     unitId = json['unitId'];
//     quantity = json['quantity'];
//     price = json['price'];
//     subTotal = json['subTotal'];
//     discount = json['discount'];
//     discountPercent = json['discountPercent'];
//     totalValue = json['totalValue'];
//     notes = json['notes'];
//     isEdit = json['isEdit'];
//     editQuantity = json['editQuantity'];
//     masterId = json['masterId'];
//     isReady = json['isReady'];
//   }
//
//   int orderDetailsId;
//   int orderId;
//   String itemName;
//   String image;
//   int itemId;
//   dynamic unitId;
//   int quantity;
//   dynamic price;
//   dynamic subTotal;
//   int discount;
//   int discountPercent;
//   int totalValue;
//   dynamic notes;
//   bool isEdit;
//   dynamic editQuantity;
//   int masterId;
//   dynamic isReady;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['orderDetailsId'] = orderDetailsId;
//     map['orderId'] = orderId;
//     map['itemName'] = itemName;
//     map['image'] = image;
//     map['itemId'] = itemId;
//     map['unitId'] = unitId;
//     map['quantity'] = quantity;
//     map['price'] = price;
//     map['subTotal'] = subTotal;
//     map['discount'] = discount;
//     map['discountPercent'] = discountPercent;
//     map['totalValue'] = totalValue;
//     map['notes'] = notes;
//     map['isEdit'] = isEdit;
//     map['editQuantity'] = editQuantity;
//     map['masterId'] = masterId;
//     map['isReady'] = isReady;
//     return map;
//   }
// }
