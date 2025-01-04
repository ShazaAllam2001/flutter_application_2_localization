import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HotOffers extends StatefulWidget {
  const HotOffers({super.key});

  @override
  HotOffersState createState() => HotOffersState();
}

class HotOffersState extends State<HotOffers> {
  final List<String> offerImages = [
    'assets/images/dress.jpg',
    'assets/images/camera.jpg',
    'assets/images/phone.jpg',
    'assets/images/shirt.jfif',
    'assets/images/pants.jfif',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            tr("hot_offers"),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height / 5, // use of Media Query
          child: ListView.builder( // offers ListView
            scrollDirection: Axis.horizontal,
            itemCount: offerImages.length,
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                height: 150,
                margin: EdgeInsets.all(10.0),
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image.asset(offerImages[index], fit: BoxFit.cover),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            tr("offer") + (index + 1).toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}