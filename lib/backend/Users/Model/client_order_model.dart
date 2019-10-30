
import 'package:flutter/foundation.dart';

class ClientOrder{
  
  String
  clientLat,
  clientLng,
  clientID,
  shopLat,
  shopLng;
  

  List<ClientOrderDetails> orders;

  ClientOrder(
    {
      @required this.clientLat,
      @required this.clientLng,
      @required this.shopLat,
      @required this.shopLng,
      @required this.clientID,
      @required this.orders
    }
  );


  Map<String,dynamic> toMap(){

      List<Map<String,dynamic>> myOrders=[];

      this.orders.forEach((order){
      myOrders.add(order.toMap());  
      });

    return {
      "clientLat":this.clientLat,
      "clientLon":this.clientLng,
      "clientID":this.clientID,
      "shopLat":this.shopLat,
      "shopLon":this.shopLng,
      "orderDetails":myOrders
    };
  }
}


class ClientOrderDetails{
  String product_name,
  order_type,
  deserved_money,
  notes,
  old_size,
  new_size,
  bill_image;


  ClientOrderDetails(
    {
      @required this.bill_image,
      @required this.deserved_money,
      @required this.new_size,
      @required this.notes,
      @required this.old_size,
      @required this.order_type,
      @required this.product_name,
      
    }
  );


   Map<String,dynamic> toMap(){
     return {
       "product_name":this.product_name,
       "order_type":this.order_type,
       "deserved_money":this.deserved_money,
       "notes":this.notes,
       "old_size":this.old_size,
       "new_size":this.new_size,
       "bill_image":this.bill_image
     };
   }


}