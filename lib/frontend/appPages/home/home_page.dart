import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tabdeel/backend/Users/Model/client_model.dart';
import 'package:tabdeel/backend/Users/Model/client_order_model.dart';
import 'package:tabdeel/backend/Users/orders/createOrder.dart';
import 'package:tabdeel/frontend/appPages/drawer/pay.dart';
import 'package:tabdeel/frontend/appPages/drawer/settings.dart';
import 'package:tabdeel/frontend/appPages/drawer/support.dart';
import 'package:tabdeel/frontend/appPages/home/products_list.dart';
import 'package:tabdeel/frontend/appPages/messages/message.dart';
import 'package:tabdeel/frontend/appPages/notifications/notify.dart';
import 'package:tabdeel/frontend/appPages/offers/offer.dart';
import 'package:tabdeel/frontend/appPages/orders/order_page.dart';
import 'package:tabdeel/frontend/appPages/stores/stores.dart';

class HomePage extends StatefulWidget {
  ClientModel model;

  ClientOrder newOrder = ClientOrder(
      clientID: null,
      clientLat: null,
      clientLng: null,
      orders: null,
      shopLat: null,
      shopLng: null);

  HomePage(this.model) {
    newOrder.clientID = model.clientID.toString();
  }

  @override
  _HomePageState createState() => _HomePageState(this.model, this.newOrder);
}

class _HomePageState extends State<HomePage> {
  ClientOrder order;

  ClientModel model;

  _HomePageState(this.model, this.order);

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
        drawer: Drawer(
          child: Container(
            color: Color.fromRGBO(116, 189, 242, 1.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/user.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'عبدالله كمال',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SmoothStarRating(
                          allowHalfRating: false,
                          starCount: 4,
                          rating: 1.5,
                          size: 27.0,
                          color: Colors.yellow,
                          borderColor: Colors.yellow,
                          spacing: 0.0),
                    ],
                  ),
                ),
                Divider(
                  endIndent: 30,
                  indent: 30,
                  color: Colors.black54,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext ctx) => Pay()));
                    },
                    leading: Image.asset(
                      'assets/pay.png',
                      width: 35,
                      height: 35,
                    ),
                    title: Text(
                      'طرق الدفع',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
                Divider(
                  endIndent: 30,
                  indent: 30,
                  color: Colors.black54,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext ctx) => Settings()));
                    },
                    leading: Image.asset(
                      'assets/setting.png',
                      width: 35,
                      height: 35,
                    ),
                    title: Text(
                      'اعدادات الحساب',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
                Divider(
                  endIndent: 30,
                  indent: 30,
                  color: Colors.black54,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext ctx) => Support()));
                    },
                    leading: Image.asset(
                      'assets/support.png',
                      width: 35,
                      height: 35,
                    ),
                    title: Text(
                      'الدعم',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
                Divider(
                  endIndent: 30,
                  indent: 30,
                  color: Colors.black54,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    leading: Image.asset(
                      'assets/logout.png',
                      width: 35,
                      height: 35,
                    ),
                    title: Text(
                      'تسجيل الخروج',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(116, 189, 242, 1.0),
          title: ImageIcon(AssetImage('assets/only icon logo.png'), size: 100),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            )
          ],
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
            ? HomeWidget(this.model, this.order)
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
  ClientModel model;
  ClientOrder order;

  HomeWidget(this.model, this.order);
  @override
  _HomeWidgetState createState() => _HomeWidgetState(this.model, this.order);
}

class _HomeWidgetState extends State<HomeWidget> {
  ClientModel model;
  ClientOrder order;
  _HomeWidgetState(this.model, this.order);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (homeIndex == 0)
        ? Container(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/home page car.png'),
                  Text(
                    'جاهز لأستبدال طلبك؟',
                    style: TextStyle(color: Colors.black45),
                  ),
                  Container(
                    width: 130,
                    child: RaisedButton(
                      child: Text('ابدأ'),
                      onPressed: () {
                        setState(() {
                          homeIndex = 1;
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
            ),
          )
        : (homeIndex == 1)
            ? MapFirstWidget(this)
            : (homeIndex == 2)
                ? MapSecondWidget(this)
                : (homeIndex == 3)
                    ? SecondPageData1(this)
                    : (homeIndex == 4) ? OrderDetails(this) : Container();
  }
}

//SecondHomeWidget-ClientLocation
class MapFirstWidget extends StatefulWidget {
  var homeWidget;

  MapFirstWidget(this.homeWidget);
  @override
  _MapFirstWidgetState createState() => _MapFirstWidgetState(homeWidget);
}

class _MapFirstWidgetState extends State<MapFirstWidget> {
  var homeWidget;

  _MapFirstWidgetState(this.homeWidget);

  Completer<GoogleMapController> mapController = Completer();

  LatLng currentLocation;

  void _onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }

  Location location = new Location();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    location.getLocation().then((loc) {
      currentLocation = LatLng(loc.latitude, loc.longitude);

      print('CurrentLoc:${currentLocation.toString()}');
      markers.add(Marker(markerId: MarkerId('me'), position: currentLocation));

      mapController.future.then((controller) {
        controller.animateCamera(CameraUpdate.newLatLng(currentLocation));
      });

      setState(() {});
    });
  }

  Set<Marker> markers = Set.from([]);

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
              onTap: (pos) {
                markers.clear();
                markers.add(Marker(markerId: MarkerId('me'), position: pos));

                setState(() {});
              },
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(0, 0),
                zoom: 13.0,
              ),
              markers: markers,
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
                        homeWidget.order.clientLat =
                            currentLocation.latitude.toString();
                        homeWidget.order.clientLng =
                            currentLocation.longitude.toString();

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
}

//ThirdHomeWidget-ShopLocation
class MapSecondWidget extends StatefulWidget {
  var homeWidget;
  MapSecondWidget(this.homeWidget);
  @override
  _MapSecondWidgetState createState() => _MapSecondWidgetState(homeWidget);
}

class _MapSecondWidgetState extends State<MapSecondWidget> {
  var homeWidget;

  _MapSecondWidgetState(this.homeWidget);
  Completer<GoogleMapController> mapController = Completer();

  LatLng currentLocation;

  void _onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }

  Location location = new Location();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    location.getLocation().then((loc) {
      currentLocation = LatLng(loc.latitude, loc.longitude);

      print('CurrentLoc:${currentLocation.toString()}');
      markers
          .add(Marker(markerId: MarkerId('shop'), position: currentLocation));

      mapController.future.then((controller) {
        controller.animateCamera(CameraUpdate.newLatLng(currentLocation));
      });

      setState(() {});
    });
  }

  Set<Marker> markers = Set.from([]);

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
              onTap: (pos) {
                markers.clear();
                markers.add(Marker(markerId: MarkerId('shop'), position: pos));

                setState(() {});
              },
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(0, 0),
                zoom: 13.0,
              ),
              markers: markers,
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
                        homeWidget.order.shopLat =
                            currentLocation.latitude.toString();
                        homeWidget.order.shopLng =
                            currentLocation.longitude.toString();

                        print(
                            "LOC:${homeWidget.order.shopLng = currentLocation.longitude.toString()}");

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

  List<ProductsDetails> myProducts = [

    ProductsDetails(
      ClientOrderDetails(
        bill_image: null,
        deserved_money: null,
        new_size: null,
        notes: null,
        old_size: null,
        order_type: null,
        product_name: null))
  ];

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
                  //ListOfProducts

                  Container(
                    height: 400,
                    padding: EdgeInsets.only(top: 5),
                    child: ListView.builder(
                      itemCount: myProducts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            myProducts[index],
                            (index != myProducts.length - 1)
                                ? Divider()
                                : Container()
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              myProducts.add(ProductsDetails(ClientOrderDetails(
                                  bill_image: null,
                                  deserved_money: null,
                                  new_size: null,
                                  notes: null,
                                  old_size: null,
                                  order_type: null,
                                  product_name: null)));

                              setState(() {});
                            },
                            child: Icon(
                              Icons.add_circle_outline,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                          Text(
                            ' اضافة منتج ',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              myProducts.removeAt(myProducts.length - 1);

                              setState(() {});
                            },
                            child: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                          Text(
                            ' حذف منتج ',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 130,
                    child: RaisedButton(
                      child: Text('التالي'),
                      onPressed: () {

                        List<ClientOrderDetails> clientOrders=[];
                        myProducts.forEach((v){
                          clientOrders.add(v.orderDetails);
                        });
                        homeWidget.order.orders=clientOrders;

                          createOrder(homeWidget.order).then((val){
                            print('DoneDriveOrder:$val');
                          }).catchError((e){
                            print('ErrorOrder:$e');
                          });
                        
                        /*homeWidget.setState(() {
                          
                          
                          
                          homeIndex = 4;
                        });*/
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
