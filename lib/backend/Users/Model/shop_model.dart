import 'package:flutter/foundation.dart';

class ShopModel {
  String shop_id,
      name,
      password,
      DeviceID,
      mobile,
      email,
      ShoptLat,
      ShopLon,
      privacy,
      img,
      shop_name,
      commerical_record,
      subtype;

  ShopModel(
      {@required this.ShoptLat,
      @required this.ShopLon,
      @required this.DeviceID,
      @required this.email,
      @required this.img,
      @required this.mobile,
      @required this.name,
      @required this.password,
      @required this.privacy,
      @required this.shop_name,
      @required this.commerical_record,
      @required this.subtype});

  ShopModel.getALL({
    @required this.shop_name,
    @required this.shop_id,
    @required this.name,
    @required this.email,
    @required this.mobile,
    @required this.ShoptLat,
    @required this.ShopLon,
    @required this.img,
    @required this.DeviceID,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "password": password,
      "DeviceID": DeviceID,
      "mobile": mobile,
      "email": email,
      "ShopLat": ShoptLat,
      "ShopLon": ShopLon,
      "privacy": privacy,
      "img": img,
      "commercial_record": commerical_record,
      "subType": subtype,
      "shop_name": shop_name
    };
  }

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel.getALL(
      name: json['name'],
      email: json['email'],
      img: json['image'],
      mobile: json['mobile'],
      shop_id: json['shopID'],
      shop_name: json['ShopName'],
      ShopLon: json['longitude'],
      ShoptLat: json['latitude'],
      DeviceID: json['deviceID']
    );
  }
}
