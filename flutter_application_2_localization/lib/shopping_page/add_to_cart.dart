import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  AddToCartState createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final List<String> productImages = [
    'assets/images/dress.jpg',
    'assets/images/camera.jpg',
    'assets/images/phone.jpg',
    'assets/images/shirt.jfif',
    'assets/images/pants.jfif',
  ];

  void _showSnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productImages.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  productImages[index], 
                  height: MediaQuery.of(context).size.height / 7, // use of Media Query
                  fit: BoxFit.cover
                ),
                          
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    tr("product") + (index + 1).toString(), 
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                          
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      _showSnackbar(tr("item_added"), context);
                    },   
                    child:  
                      Icon(
                        Icons.add_shopping_cart,
                        size: 16,
                      ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}