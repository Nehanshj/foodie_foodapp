import 'package:flutter/material.dart';
import 'package:foodie/models/restaurant.dart';
import 'package:foodie/widgets/rating.dart';
import 'package:foodie/models/food.dart';

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

  _buildGriditems(Food item) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 170.0,
              height: 170.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(item.imageUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            Container(
              height: 175.0,
              width: 175.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                  ],
                  stops: [0.1, 0.4, 0.6, 0.9],
                ),
              ),
            ),
            Positioned(
              bottom: 55,
              child: Column(
                children: <Widget>[
                  Text(
                    item.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    '₹${item.price}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 7.0,
              right: 7.0,
              child: Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    iconSize: 20.0,
                    color: Colors.white,
                    onPressed: () {},
                  )),
            )
          ],
        ),
      ),
    );
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
          Padding(
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 20.0, bottom: 7.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '0.2 miles away',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Rating(widget.restaurant.rating),
                SizedBox(height: 6.0),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Theme
                      .of(context)
                      .primaryColor,
                  highlightColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Text('Reviews',
                    style: TextStyle(
                      color: Colors.white,
                    ),)),
              FlatButton(onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Theme
                      .of(context)
                      .primaryColor,
                  highlightColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Text('Contact',
                    style: TextStyle(
                      color: Colors.white,
                    ),)),
            ],
          ),
          Expanded(
            child: GridView.count(crossAxisCount: 2,
              padding: EdgeInsets.all(10.0),
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildGriditems(food);
              }),),
          )
        ],
      ),

    );
  }
}
