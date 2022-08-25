/// StatusCode : 200
/// MessageCode : "SUCCESS"
/// List : [{"OrderID":31584,"OrderNumber":"21","OrderDate":"2022-03-14T22:07:00","SubTotal":44,"Discount":0,"Tax":0,"DeliveryValue":7,"TotalValue":44,"AllQuantity":4,"Longitude":null,"Latitude":null,"DriverID":120,"DriverLat":null,"DriverLong":null,"OrderStatusId":7,"PaymentType":2,"Details":[{"orderDetailsId":79685,"OrderId":31584,"ItemName":"صحن فتوش","ItemId":1,"UnitId":null,"Quantity":4,"Price":11,"SubTotal":50.6,"Discount":0,"DiscountPercent":0,"TotalValue":44,"Notes":null,"IsEdit":false,"EditQuantity":null,"MasterId":0,"IsReady":null}]},{"OrderID":31611,"OrderNumber":"21","OrderDate":"2022-03-23T12:46:00","SubTotal":47.86,"Discount":0,"Tax":7.14,"DeliveryValue":7,"TotalValue":62,"AllQuantity":5,"Longitude":null,"Latitude":null,"DriverID":120,"DriverLat":null,"DriverLong":null,"OrderStatusId":7,"PaymentType":1,"Details":[{"orderDetailsId":79730,"OrderId":31611,"ItemName":"صحن فتوش","ItemId":1,"UnitId":null,"Quantity":5,"Price":11,"SubTotal":63.25,"Discount":0,"DiscountPercent":0,"TotalValue":55,"Notes":null,"IsEdit":false,"EditQuantity":null,"MasterId":0,"IsReady":null}]},{"OrderID":31612,"OrderNumber":"28","OrderDate":"2022-03-23T15:49:00","SubTotal":146.995,"Discount":0,"Tax":22.005,"DeliveryValue":7,"TotalValue":176,"AllQuantity":7,"Longitude":null,"Latitude":null,"DriverID":120,"DriverLat":null,"DriverLong":null,"OrderStatusId":7,"PaymentType":2,"Details":[{"orderDetailsId":79731,"OrderId":31612,"ItemName":"صحن فتوش","ItemId":1,"UnitId":null,"Quantity":3,"Price":11,"SubTotal":37.95,"Discount":0,"DiscountPercent":0,"TotalValue":33,"Notes":"","IsEdit":false,"EditQuantity":null,"MasterId":0,"IsReady":null},{"orderDetailsId":79732,"OrderId":31612,"ItemName":"سلطة خضراء ","ItemId":3,"UnitId":null,"Quantity":2,"Price":10,"SubTotal":23,"Discount":0,"DiscountPercent":0,"TotalValue":20,"Notes":"","IsEdit":false,"EditQuantity":null,"MasterId":0,"IsReady":null},{"orderDetailsId":79733,"OrderId":31612,"ItemName":"1/2 كيلو مشكل كباب","ItemId":545,"UnitId":null,"Quantity":2,"Price":58,"SubTotal":133.4,"Discount":0,"DiscountPercent":0,"TotalValue":116,"Notes":"","IsEdit":false,"EditQuantity":null,"MasterId":0,"IsReady":null}]},{"OrderID":31613,"OrderNumber":"29","OrderDate":"2022-03-23T15:53:00","SubTotal":38.288,"Discount":0,"Tax":5.712,"DeliveryValue":7,"TotalValue":51,"AllQuantity":4,"Longitude":null,"Latitude":null,"DriverID":120,"DriverLat":null,"DriverLong":null,"OrderStatusId":7,"PaymentType":2,"Details":[{"orderDetailsId":79734,"OrderId":31613,"ItemName":"صحن فتوش","ItemId":1,"UnitId":null,"Quantity":4,"Price":11,"SubTotal":50.6,"Discount":0,"DiscountPercent":0,"TotalValue":44,"Notes":"","IsEdit":false,"EditQuantity":null,"MasterId":0,"IsReady":null}]}]

class OrderModelNew {
  OrderModelNew({
    this.statusCode,
    this.messageCode,
    this.list,
  });

  OrderModelNew.fromJson(dynamic json) {
    statusCode = json['StatusCode'];
    messageCode = json['MessageCode'];
    if (json['List'] != null) {
      list = [];
      json['List'].forEach((v) {
        list.add(OrderList.fromJson(v));
      });
    }
  }

  int statusCode;
  String messageCode;
  List<OrderList> list;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = statusCode;
    map['MessageCode'] = messageCode;
    if (list != null) {
      map['List'] = list.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// OrderID : 31584
/// OrderNumber : "21"
/// OrderDate : "2022-03-14T22:07:00"
/// SubTotal : 44
/// Discount : 0
/// Tax : 0
/// DeliveryValue : 7
/// TotalValue : 44
/// AllQuantity : 4
/// Longitude : null
/// Latitude : null
/// DriverID : 120
/// DriverLat : null
/// DriverLong : null
/// OrderStatusId : 7
/// PaymentType : 2
/// Details : [{"orderDetailsId":79685,"OrderId":31584,"ItemName":"صحن فتوش","ItemId":1,"UnitId":null,"Quantity":4,"Price":11,"SubTotal":50.6,"Discount":0,"DiscountPercent":0,"TotalValue":44,"Notes":null,"IsEdit":false,"EditQuantity":null,"MasterId":0,"IsReady":null}]

class OrderList {
  OrderList({
    this.orderID,
    this.orderNumber,
    this.orderDate,
    this.subTotal,
    this.discount,
    this.tax,
    this.deliveryValue,
    this.totalValue,
    this.allQuantity,
    this.longitude,
    this.latitude,
    this.driverID,
    this.driverLat,
    this.driverLong,
    this.orderStatusId,
    this.paymentType,
    this.details,
  });

  OrderList.fromJson(dynamic json) {
    orderID = json['OrderID'];
    orderNumber = json['OrderNumber'];
    orderDate = json['OrderDate'];
    subTotal = json['SubTotal'];
    discount = json['Discount'];
    tax = json['Tax'];
    deliveryValue = json['DeliveryValue'];
    totalValue = json['TotalValue'];
    allQuantity = json['AllQuantity'];
    longitude = json['Longitude'];
    latitude = json['Latitude'];
    driverID = json['DriverID'];
    driverLat = json['DriverLat'];
    driverLong = json['DriverLong'];
    orderStatusId = json['OrderStatusId'];
    paymentType = json['PaymentType'];
    if (json['Details'] != null) {
      details = [];
      json['Details'].forEach((v) {
        details.add(Details.fromJson(v));
      });
    }
  }

  int orderID;
  String orderNumber;
  String orderDate;
  int subTotal;
  int discount;
  int tax;
  int deliveryValue;
  int totalValue;
  int allQuantity;
  dynamic longitude;
  dynamic latitude;
  int driverID;
  dynamic driverLat;
  dynamic driverLong;
  int orderStatusId;
  int paymentType;
  List<Details> details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OrderID'] = orderID;
    map['OrderNumber'] = orderNumber;
    map['OrderDate'] = orderDate;
    map['SubTotal'] = subTotal;
    map['Discount'] = discount;
    map['Tax'] = tax;
    map['DeliveryValue'] = deliveryValue;
    map['TotalValue'] = totalValue;
    map['AllQuantity'] = allQuantity;
    map['Longitude'] = longitude;
    map['Latitude'] = latitude;
    map['DriverID'] = driverID;
    map['DriverLat'] = driverLat;
    map['DriverLong'] = driverLong;
    map['OrderStatusId'] = orderStatusId;
    map['PaymentType'] = paymentType;
    if (details != null) {
      map['Details'] = details.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// orderDetailsId : 79685
/// OrderId : 31584
/// ItemName : "صحن فتوش"
/// ItemId : 1
/// UnitId : null
/// Quantity : 4
/// Price : 11
/// SubTotal : 50.6
/// Discount : 0
/// DiscountPercent : 0
/// TotalValue : 44
/// Notes : null
/// IsEdit : false
/// EditQuantity : null
/// MasterId : 0
/// IsReady : null

class Details {

  Details.fromJson(dynamic json) {
    orderDetailsId = json['orderDetailsId'];
    orderId = json['OrderId'];
    itemName = json['ItemName'];
    image = json['Image'];
    itemId = json['ItemId'];
    unitId = json['UnitId'];
    quantity = json['Quantity'];
    price = json['Price'];
    subTotal = json['SubTotal'];
    discount = json['Discount'];
    discountPercent = json['DiscountPercent'];
    totalValue = json['TotalValue'];
    notes = json['Notes'];
    isEdit = json['IsEdit'];
    editQuantity = json['EditQuantity'];
    masterId = json['MasterId'];
    isReady = json['IsReady'];
  }

  int orderDetailsId;
  int orderId;
  String itemName;
  String image;
  int itemId;
  dynamic unitId;
  int quantity;
  int price;
  double subTotal;
  int discount;
  int discountPercent;
  int totalValue;
  dynamic notes;
  bool isEdit;
  dynamic editQuantity;
  int masterId;
  dynamic isReady;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderDetailsId'] = orderDetailsId;
    map['OrderId'] = orderId;
    map['ItemName'] = itemName;
    map['Image'] = image;
    map['ItemId'] = itemId;
    map['UnitId'] = unitId;
    map['Quantity'] = quantity;
    map['Price'] = price;
    map['SubTotal'] = subTotal;
    map['Discount'] = discount;
    map['DiscountPercent'] = discountPercent;
    map['TotalValue'] = totalValue;
    map['Notes'] = notes;
    map['IsEdit'] = isEdit;
    map['EditQuantity'] = editQuantity;
    map['MasterId'] = masterId;
    map['IsReady'] = isReady;
    return map;
  }
}
