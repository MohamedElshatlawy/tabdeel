import 'package:flutter/material.dart';

class Notify extends StatefulWidget{
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: <Widget>[
            ListTile(
              leading: Image.asset('assets/product.png'),
              title: Text('تم توصيل الطلب'),
              subtitle: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.person,size: 15,),
                  Text(' محمد مصطفى')
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text(' AM '), Text('22:10')],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            
              ListTile(
              leading: Image.asset('assets/product.png'),
              title: Text('تم توصيل الطلب'),
              subtitle: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.person,size: 15,),
                  Text(' محمد مصطفى')
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text(' AM '), Text('22:10')],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
          
              ListTile(
              leading: Image.asset('assets/product.png'),
              title: Text('تم توصيل الطلب'),
              subtitle: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.person,size: 15,),
                  Text(' محمد مصطفى')
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text(' AM '), Text('22:10')],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
          
            
             ],
        ),
      ),
    );
 
  }
}