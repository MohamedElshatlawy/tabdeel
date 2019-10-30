import 'package:flutter/foundation.dart';

class ClientModel {
  String name,
      password,
      DeviceID,
      mobile,
      email,
      ClientLat,
      ClientLon,
      privacy,
      img,
      img_url;
  int clientID;

  ClientModel(
      {@required this.ClientLat,
      @required this.ClientLon,
      @required this.DeviceID,
      @required this.email,
      @required this.img,
      @required this.mobile,
      @required this.name,
      @required this.password,
      @required this.privacy});

  ClientModel.fromMap(Map<String, dynamic> res) {
    this.name = res['name'];
    this.password = res['password'];
    this.mobile = res['Mobile'];
    this.email = res['email'];

    this.img_url = res['image'];

    if (res['ClientID'] is String) {
      this.clientID = int.parse(res['ClientID']);
    } else {
      this.clientID = res['ClientID'];
    }

    this.ClientLat = res['latitude'];
    this.ClientLon = res['longitude'];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "password": password,
      "DeviceID": DeviceID,
      "mobile": mobile,
      "email": email,
      "ClientLat": ClientLat,
      "ClientLon": ClientLon,
      "privacy": privacy,
      "img": img
    };
  }
}
