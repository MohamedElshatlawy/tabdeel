import 'package:flutter/material.dart';

class Msg extends StatefulWidget {
  @override
  _MsgState createState() => _MsgState();
}

class _MsgState extends State<Msg> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: <Widget>[
            ListTile(
              leading: Image.asset('assets/person2.png'),
              title: Text('محمد مصطفى'),
              subtitle: Text('تمام مافي مشكلة'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text(' AM '), Text('22:10')],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Image.asset('assets/person2.png'),
              title: Text('محمد مصطفى'),
              subtitle: Text('تمام مافي مشكلة'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text(' AM '), Text('22:10')],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Image.asset('assets/person2.png'),
              title: Text('محمد مصطفى'),
              subtitle: Text('تمام مافي مشكلة'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text(' AM '), Text('22:10')],
              ),
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
