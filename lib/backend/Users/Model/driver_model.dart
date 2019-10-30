import 'package:flutter/foundation.dart';

class DriverModel {
  String name,
      password,
      DeviceID,
      mobile,
      email,
      DriverLat,
      DriverLon,
      privacy,
      img,
      
      nationality,
      id_number,
      id_img,
      car_front_img,
      car_rear_img,
      license_img;



  DriverModel(
      {
      @required this.DriverLat,
      @required this.DriverLon,
      @required this.DeviceID,
      @required this.email,
      @required this.img,
      @required this.mobile,
      @required this.name,
      @required this.password,
      @required this.privacy,
      @required this.nationality,
      @required this.id_number,
      @required this.id_img,
      @required this.car_front_img,
      @required this.car_rear_img,
      @required this.license_img
      
      });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "password": password,
      "DeviceID": DeviceID,
      "mobile": mobile,
      "email": email,
      "DriverLat": DriverLat,
      "DriverLon": DriverLon,
      "privacy": privacy,
      "img": img,

      "nationality":nationality,
      "id_image":id_img,
      "car_front_image":car_front_img,
      "car_rear_image":car_rear_img,
      "id_number":id_number,
      "license_image":license_img
    };
  }
}
