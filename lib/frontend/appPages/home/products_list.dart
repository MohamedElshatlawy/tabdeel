import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabdeel/backend/Users/Model/client_order_model.dart';

class ProductsDetails extends StatefulWidget {
  ClientOrderDetails orderDetails;
  ProductsDetails(this.orderDetails);

  @override
  _ProductsDetailsState createState() =>
      _ProductsDetailsState(this.orderDetails);
}

class _ProductsDetailsState extends State<ProductsDetails> {
  int radioVal = 0;
  String dropdownValue = 'المقاس';

  ClientOrderDetails orderDetails;

  var productNameController = TextEditingController();
  String orderType = "0";
  var deservedMoneyController = TextEditingController();
  var notesController = TextEditingController();
  var oldSizeController = TextEditingController();
  var newSizeController = TextEditingController();
  String billImage = "";

  File billImageGalary;

  _ProductsDetailsState(this.orderDetails);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: productNameController,
          onChanged: (val){
            orderDetails.product_name=val;
          },
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

                if(val==0)
                  orderType="0";
                  else
                  orderType="1";
                  orderDetails.order_type=orderType;
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

                if(val==0)
                  orderType="0";
                  else
                  orderType="1";
                  orderDetails.order_type=orderType;
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
                controller: deservedMoneyController,
                onChanged: (val){
                  orderDetails.deserved_money=val;
                },
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
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.grey),
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
                    controller: oldSizeController,
                    onChanged: (val){
                      orderDetails.old_size=val;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'المقاس القديم',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[300]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: newSizeController,
                    onChanged: (val){
                      orderDetails.new_size=val;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'المقاس الجديد',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[300]),
                  )
                ],
              ),
        (billImageGalary == null)
            ? Row(
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
                      onPressed: () async {
                        await getBillImageFromGallery();

                        encodeImage(billImageGalary).then((myImg){
                          String encodedImg=base64Encode(myImg);
                          orderDetails.bill_image=encodedImg;
                        });
                      },
                    ),
                  )
                ],
              )
            : Container(
                width: 100,
                height: 100,
                child: Image.file(billImageGalary),
              ),
        TextField(
          controller: notesController,
          onChanged: (val){
            orderDetails.notes=val;
          },
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
      ],
    );
  }

  Future getBillImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      billImageGalary = image;
    });
  }

  Future<List<int>> encodeImage(File img) async {
    return await img.readAsBytes();
  }
}
