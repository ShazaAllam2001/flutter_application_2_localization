import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  MyProductsState createState() => MyProductsState();
}

class MyProductsState extends State<MyProducts> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            tr("products"), // 'Our Products' Text
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
              
        // PageView to show product images
        SizedBox(
          height: 200,
            child: PageView(
              children: [
                Image.asset('assets/images/butter.jpeg', fit: BoxFit.cover),
                Image.asset('assets/images/phone.jpg', fit: BoxFit.cover),
                Image.asset('assets/images/camera.jpg', fit: BoxFit.cover),
              ]
            ),
        ),
      ],
    );
  }
}