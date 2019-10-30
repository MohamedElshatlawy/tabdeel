import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Column(
        mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
     
      children: <Widget>[
        Image.asset('assets/sec page.png'),
        Text('تابع استرجاع المنتجات من خلال لوحة التحكم',style: TextStyle(color: Colors.white,
        fontSize: 15,
        decoration: TextDecoration.none
        ),
        
        textAlign: TextAlign.center,)
      ],
    );
   
  }
}