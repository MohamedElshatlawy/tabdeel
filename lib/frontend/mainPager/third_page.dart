import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget{
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Column(
        mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
     
      children: <Widget>[
        Image.asset('assets/thir page.png'),
        Text('تبديل يضمن لك حقوقك بنسبة %100 سواء للعميل او المندوب',style: TextStyle(color: Colors.white,
        fontSize: 15,
        decoration: TextDecoration.none
        ),
        
        textAlign: TextAlign.center,)
      ],
    );
   
  }
}