import 'package:flutter/material.dart';
import 'package:foodie/data/data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foodie'),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
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
    );
  }
}
