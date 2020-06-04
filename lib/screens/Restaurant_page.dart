import 'package:flutter/material.dart';
import 'package:foodie/models/restaurant.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantPage({this.restaurant});

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  bool fav = false;

  void toggle() {
    fav = !fav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Hero(
              tag: widget.restaurant.imageUrl,
              child: Image(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                image: AssetImage(widget.restaurant.imageUrl),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(top: 25.0),
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                IconButton(
                  padding: EdgeInsets.only(top: 25.0, right: 10.0),
                  color: Colors.red,
                  iconSize: 30.0,
                  icon: Icon((fav) ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {
                    setState(() {
                      toggle();
                    });
                  },
                )
              ],
            )
          ],
        ),
      ],
    ));
  }
}
