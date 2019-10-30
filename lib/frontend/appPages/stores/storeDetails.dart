import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tabdeel/backend/Users/Model/shop_model.dart';

class StoreDetails extends StatefulWidget {
  ShopModel shopModel;

  StoreDetails(this.shopModel);

  @override
  _StoreDetailsState createState() => _StoreDetailsState(shopModel);
}

class _StoreDetailsState extends State<StoreDetails> {
  ShopModel shopModel;
  _StoreDetailsState(this.shopModel) {
    pos = LatLng(
        double.parse(shopModel.ShoptLat), double.parse(shopModel.ShopLon));
  }
  GoogleMapController mapController;

  LatLng pos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(116, 189, 242, 1.0),
        title: Text(widget.shopModel.shop_name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.black,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        widget.shopModel.shop_name,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Opacity(
                      opacity: .7,
                      child: Image.network(
                        widget.shopModel.img,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
           Card(
             child:  Container(
              padding: EdgeInsets.only(right: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text(':صاحب المحل '),
                      Text(' ${widget.shopModel.name}  ')
                    ],
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text(':البريد الألكتروني '),
                      Text(' ${widget.shopModel.email}  ')
                    ],
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text(':رقم التليفون '),
                      Text(' ${widget.shopModel.mobile}  ')
                    ],
                  ),
                ],
              ),
            ),
           
           ), Card(
              child: Container(
                width: double.infinity,
                height: 200,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: pos,
                    zoom: 11.0,
                  ),
                  markers: _createMarker(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(markerId: MarkerId("marker_1"), position: pos),
    ].toSet();
  }
}
