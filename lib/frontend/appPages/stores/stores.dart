import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tabdeel/backend/Users/Model/shop_model.dart';
import 'package:tabdeel/backend/Users/userAuthentication/shop_auth.dart';
import 'package:tabdeel/frontend/appPages/stores/storeDetails.dart';

class Stores extends StatefulWidget {
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            color: Colors.grey[300],
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: InputBorder.none,
                                  hintText: 'ابحث عن متجر',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  )),
                            ),
                          )),
                      Flexible(
                        flex: 1,
                        child: RaisedButton(
                          color: Color.fromRGBO(116, 189, 242, 1.0),
                          textColor: Colors.white,
                          child: Text(
                            'بحث',
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    child: StreamBuilder(
                  stream: Stream.fromFuture(getAllShops()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('لا يوجد اتصال بالانترنت'));
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: Text('جاري التحميل....'));

                      default:
                        Response rs = snapshot.data;
                        List jsonArray = json.decode(rs.body)['AllShops'];
                        List<ShopModel> shops = [];
                        jsonArray.forEach((shopJson) {
                          shops.add(ShopModel.fromJson(shopJson));
                        });
                        return ListView.builder(
                          itemCount: shops.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context)=>StoreDetails(shops[index])
                                    ));
                                    print(shops[index].shop_id);
                                  },
                                    child: ListTile(
                              leading: (shops[index].img == null)
                                  ? CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          Color.fromRGBO(116, 189, 242, 1.0),
                                      backgroundImage:
                                          AssetImage('assets/photo store.png'))
                                  : CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          Color.fromRGBO(116, 189, 242, 1.0),
                                      backgroundImage:
                                          NetworkImage(shops[index].img),
                                    ),
                              title: Text(shops[index].name),
                              subtitle: Text('ادوات اجهزة الكترونية'),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    '50',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromRGBO(116, 189, 242, 1.0)),
                                  ),
                                  Text('كم',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              116, 189, 242, 1.0)))
                                ],
                              ),
                            )));
                          },
                        );
                    }
                  },
                )),
              )
            ],
          ),
        ));
  }
}
