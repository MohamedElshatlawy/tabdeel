import 'package:flutter/material.dart';

class Offer extends StatefulWidget {
  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  'assets/offer photo.png',
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('عنوان رئيسي يمكن ان يستبدل في نفس المساحة'),
                            Text(
                              'عنوان فرعي',style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  'assets/offer photo.png',
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('عنوان رئيسي يمكن ان يستبدل في نفس المساحة'),
                            Text(
                              'عنوان فرعي',style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  'assets/offer photo.png',
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('عنوان رئيسي يمكن ان يستبدل في نفس المساحة'),
                            Text(
                              'عنوان فرعي',style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
