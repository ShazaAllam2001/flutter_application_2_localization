import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_2_localization/shopping_page/add_to_cart.dart';
import 'package:flutter_application_2_localization/shopping_page/hot_offers.dart';
import 'package:flutter_application_2_localization/shopping_page/my_products.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  ShoppingPageState createState() => ShoppingPageState();
}

class ShoppingPageState extends State<ShoppingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr("app_bar_title")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyProducts(),
              AddToCart(),
              HotOffers(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.language),
        onPressed: () {
          if (context.locale == Locale("ar", "EG")) {
            context.setLocale(Locale("en", "US"));
          }
          else {
            context.setLocale(Locale("ar", "EG"));
          }
        }),
    );
  }
}
