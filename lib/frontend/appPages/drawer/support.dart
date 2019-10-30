import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tabdeel/frontend/appPages/messages/message.dart';
import 'package:tabdeel/frontend/appPages/notifications/notify.dart';
import 'package:tabdeel/frontend/appPages/offers/offer.dart';
import 'package:tabdeel/frontend/appPages/orders/order_page.dart';
import 'package:tabdeel/frontend/appPages/stores/stores.dart';


class Support extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Support> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(116, 189, 242, 1.0),
          title: ImageIcon(AssetImage('assets/only icon logo.png'), size: 100),
          centerTitle: true,
        ),
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.rtl,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(116, 189, 242, 1.0),
                  icon: ImageIcon(AssetImage('assets/home icon.png')),
                  title: new Text('الرئيسية')),
              BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(116, 189, 242, 1.0),
                  icon: ImageIcon(AssetImage('assets/store.png')),
                  title: new Text('المتاجر')),
              BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(116, 189, 242, 1.0),
                  icon: ImageIcon(AssetImage('assets/request.png')),
                  title: new Text('الطلبات')),
              BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(116, 189, 242, 1.0),
                  icon: ImageIcon(AssetImage('assets/offer.png')),
                  title: new Text('العروض')),
              BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(116, 189, 242, 1.0),
                  icon: Icon(Icons.notifications),
                  title: new Text('تنبيهات')),
              BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(116, 189, 242, 1.0),
                  icon: ImageIcon(AssetImage('assets/message.png')),
                  title: new Text('رسائل')),
            ],
          ),
        ),
        body: (_selectedIndex == 0)
            ? HomeWidget()
            : (_selectedIndex == 1)
                ? Stores()
                : (_selectedIndex == 2)
                    ? OrderPage()
                    : (_selectedIndex == 3)
                        ? Offer()
                        : (_selectedIndex == 4)
                            ? Notify()
                            : (_selectedIndex == 5) ? Msg() : Container());
  }
}

int homeIndex = 0;

//FirstHomeWidget
class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int radioVal = 0;
    return (homeIndex == 0)
        ? Container(
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: <Widget>[
                    ListTile(
                        leading: Image.asset('assets/product.png'),
                        title: Text(
                          'لاب توب ديل 6565',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                        subtitle: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.date_range,
                              color: Colors.black54,
                              size: 15,
                            ),
                            Text(
                              ' تاريخ التسليم المتوقع:25-9-2019',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            )
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              size: 20,
                            ),
                            Text(
                              'عبدالله كمال',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 30, 20, 0),
                            color: Colors.white,
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.black87,
                                        ),
                                        Text(
                                          'من (موقعك) :الرياض حي الرياض :السعودية',
                                          style:
                                              TextStyle(color: Colors.black54),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.black87,
                                        ),
                                        Text(
                                          'الى : جدة-السعودية',
                                          style:
                                              TextStyle(color: Colors.black54),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.mode_edit,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'ملاحظات :المنزل بجوار صيدلية ',
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            height: 25,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'تفاصيل الطلب',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(8, 30, 20, 0),
                            color: Colors.white,
                            height: 90,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.local_offer,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      ' 30.00 ر.س / 5 كيلو',
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            height: 25,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'تكلفة التوصيل',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('قبول'),
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RaisedButton(
                          child: Text('رفض'),
                          color: Colors.red,
                          textColor: Colors.white,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    )
                 
                 ,Expanded(

                   child: Align(

                     alignment: Alignment.bottomLeft,
                     child: Container(
                       padding: EdgeInsets.all(10),
                       child: FloatingActionButton(
                      
                       onPressed: (){},
                       backgroundColor: Color.fromRGBO(116, 189, 242, 1.0),
                       child: Icon(Icons.chat),
                     )
                  ,
                     )
                  
                   ),
                 )
                  ],
                )))
        : (homeIndex == 1)
            ? MapFirstWidget(this)
            : (homeIndex == 2)
                ? MapSecondWidget(this)
                : (homeIndex == 3)
                    ? SecondPageData1(this)
                    : (homeIndex == 4) ? OrderDetails(this) : Container();
  }
}

//SecondHomeWidget
class MapFirstWidget extends StatefulWidget {
  var homeWidget;
  MapFirstWidget(this.homeWidget);
  @override
  _MapFirstWidgetState createState() => _MapFirstWidgetState(homeWidget);
}

class _MapFirstWidgetState extends State<MapFirstWidget> {
  var homeWidget;

  _MapFirstWidgetState(this.homeWidget);

  GoogleMapController mapController;
  BitmapDescriptor _markerIcon;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'حدد موقعك على الخريطة او اكتب العنوان هنا',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: _createMarker(),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: <Widget>[
                Image.asset('assets/banner.png'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'حدد موقعك على الخريطة',
                  style: TextStyle(color: Colors.black45),
                ),
                Container(
                  width: 130,
                  child: RaisedButton(
                    child: Text('التالي'),
                    onPressed: () {
                      homeWidget.setState(() {
                        homeIndex = 2;
                      });
                    },
                    textColor: Colors.white,
                    color: Color.fromRGBO(116, 189, 242, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Set<Marker> _createMarker() {
    // TODO(iskakaushik): Remove this when collection literals makes it to stable.
    // https://github.com/flutter/flutter/issues/28312
    // ignore: prefer_collection_literals
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: _center,
        icon: _markerIcon,
      ),
    ].toSet();
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/hold icon map.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }
}

//ThirdHomeWidget
class MapSecondWidget extends StatefulWidget {
  var homeWidget;
  MapSecondWidget(this.homeWidget);
  @override
  _MapSecondWidgetState createState() => _MapSecondWidgetState(homeWidget);
}

class _MapSecondWidgetState extends State<MapSecondWidget> {
  GoogleMapController mapController;
  BitmapDescriptor _markerIcon;
  var homeWidget;

  _MapSecondWidgetState(this.homeWidget);
  final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'حدد مكان وصول الطلب',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: _createMarker(),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: <Widget>[
                Image.asset('assets/banner.png'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'حدد مكان وصول الطلبات',
                  style: TextStyle(color: Colors.black45),
                ),
                Container(
                  width: 130,
                  child: RaisedButton(
                    child: Text('التالي'),
                    onPressed: () {
                      homeWidget.setState(() {
                        homeIndex = 3;
                      });
                    },
                    textColor: Colors.white,
                    color: Color.fromRGBO(116, 189, 242, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Set<Marker> _createMarker() {
    // TODO(iskakaushik): Remove this when collection literals makes it to stable.
    // https://github.com/flutter/flutter/issues/28312
    // ignore: prefer_collection_literals
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: _center,
        icon: _markerIcon,
      ),
    ].toSet();
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/hold icon map.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }
}

//FourthHomeWidget
class SecondPageData1 extends StatefulWidget {
  var homeWidget;
  SecondPageData1(this.homeWidget);
  @override
  _SecondPageData1State createState() => _SecondPageData1State(homeWidget);
}

class _SecondPageData1State extends State<SecondPageData1> {
  var homeWidget;
  _SecondPageData1State(this.homeWidget);
  int radioVal = 0;
  String dropdownValue = 'المقاس';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'اسم المنتج',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[300]),
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 0,
                        onChanged: (val) {
                          radioVal = val;
                          setState(() {});
                        },
                        groupValue: radioVal,
                        activeColor: Color.fromRGBO(116, 189, 242, 1.0),
                      ),
                      Text(
                        'استبدال',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Radio(
                        value: 1,
                        onChanged: (val) {
                          radioVal = val;
                          setState(() {});
                        },
                        groupValue: radioVal,
                        activeColor: Color.fromRGBO(116, 189, 242, 1.0),
                      ),
                      Text(
                        'استرجاع',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  (radioVal == 1)
                      ? TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: 'المبلغ المستحق',
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey[300]),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '   سيتم استبدال: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: RaisedButton(
                                    color: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    onPressed: () {},
                                    child: DropdownButton<String>(
                                      iconEnabledColor: Colors.grey,
                                      value: dropdownValue,
                                      isExpanded: true,
                                      icon: Icon(Icons.arrow_drop_down),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'المقاس',
                                        'المنتج',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'ادخل المقاس',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.grey[300]),
                            )
                          ],
                        ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Colors.grey[300],
                          textColor: Colors.grey,
                          child: Text(
                            'ارفاق صورة الفاتورة',
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                  TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'ملاحظات',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[300]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Icon(
                          Icons.add_circle_outline,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      Text(
                        ' اضافة منتج اخر',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                  Container(
                    width: 130,
                    child: RaisedButton(
                      child: Text('التالي'),
                      onPressed: () {
                        homeWidget.setState(() {
                          homeIndex = 4;
                        });
                      },
                      textColor: Colors.white,
                      color: Color.fromRGBO(116, 189, 242, 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  )
                ],
              ),
            )));
  }
}

//FifthHomeWidget
class OrderDetails extends StatefulWidget {
  var homeWidget;

  OrderDetails(this.homeWidget);
  @override
  _OrderDetailsState createState() => _OrderDetailsState(homeWidget);
}

class _OrderDetailsState extends State<OrderDetails> {
  var homeWidget;
  _OrderDetailsState(this.homeWidget);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 4,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 30, 20, 0),
                        color: Colors.white,
                        height: 150,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'من (موقعك) :الرياض حي الرياض :السعودية',
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                ),
                                Text(
                                  'تعديل',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black54,
                                      fontSize: 17),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'الى : جدة-السعودية',
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                ),
                                Text(
                                  'تعديل',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black54,
                                      fontSize: 17),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.mode_edit,
                                  color: Colors.black87,
                                ),
                                Text(
                                  'ملاحظات :المنزل بجوار صيدلية ',
                                  style: TextStyle(color: Colors.black54),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        height: 25,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'تفاصيل الطلب',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 30, 20, 0),
                        color: Colors.white,
                        height: 90,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.local_offer,
                                  color: Colors.black87,
                                ),
                                Text(
                                  ' 30.00 ر.س / 5 كيلو',
                                  style: TextStyle(color: Colors.black54),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        height: 25,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'تكلفة التوصيل',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(8, 30, 5, 0),
                            color: Colors.white,
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  leading: CircleAvatar(
                                    child: Image.asset('assets/person.png'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  title: Text(
                                    'عبد الله كمال',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  subtitle: SmoothStarRating(
                                      allowHalfRating: false,
                                      starCount: 4,
                                      rating: 1.5,
                                      size: 27.0,
                                      color: Colors.yellow,
                                      borderColor: Colors.yellow,
                                      spacing: 0.0),
                                  trailing: RaisedButton(
                                    onPressed: () {},
                                    color: Color.fromRGBO(116, 189, 242, 1.0),
                                    textColor: Colors.white,
                                    child: Text('عرض السعر'),
                                  ),
                                ),
                                ListTile(
                                  leading: CircleAvatar(
                                    child: Image.asset('assets/person.png'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  title: Text(
                                    'عبد الله كمال',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  subtitle: SmoothStarRating(
                                      allowHalfRating: false,
                                      starCount: 4,
                                      rating: 1.5,
                                      size: 27.0,
                                      color: Colors.yellow,
                                      borderColor: Colors.yellow,
                                      spacing: 0.0),
                                  trailing: RaisedButton(
                                    onPressed: () {},
                                    textColor: Colors.white,
                                    color: Color.fromRGBO(116, 189, 242, 1.0),
                                    child: Text('عرض السعر'),
                                  ),
                                ),
                                ListTile(
                                  leading: CircleAvatar(
                                    child: Image.asset('assets/person.png'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  title: Text(
                                    'عبد الله كمال',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  subtitle: SmoothStarRating(
                                      allowHalfRating: false,
                                      starCount: 4,
                                      rating: 1.5,
                                      size: 27.0,
                                      color: Colors.yellow,
                                      borderColor: Colors.yellow,
                                      spacing: 0.0),
                                  trailing: RaisedButton(
                                    onPressed: () {},
                                    textColor: Colors.white,
                                    color: Color.fromRGBO(116, 189, 242, 1.0),
                                    child: Text('عرض السعر'),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          height: 25,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'المندوبين المتاحين',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: <Widget>[
                  Text(
                    'حدد مكان وصول الطلبات',
                    style: TextStyle(color: Colors.black54, fontSize: 23),
                  ),
                  Container(
                    width: 130,
                    child: RaisedButton(
                      child: Text('ارسل الطلبات'),
                      onPressed: () {},
                      textColor: Colors.white,
                      color: Color.fromRGBO(116, 189, 242, 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
