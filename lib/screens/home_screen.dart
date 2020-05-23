import 'package:flutter/material.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/widgets/horizontal_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FOODIE',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          color: Colors.white,
          iconSize: 25.0,
          onPressed: () {},
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Text(
                  'Cart(${currentUser.cart.length})',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(18.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white70,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 0.75,color: Theme.of(context).primaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 0.75),
                ),
                hintText: 'Search Dishes or Nearby Restaurant',
                prefixIcon: Icon(Icons.search,
                size: 25.0,
                ),
                suffixIcon: IconButton(icon: Icon(Icons.cancel), onPressed: (){}),
              ),
            ),
          ),
          PastOrders(),
        ],
      ),
    );
  }
}
