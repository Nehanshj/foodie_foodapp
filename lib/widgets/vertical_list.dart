import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/models/restaurant.dart';
import 'package:foodie/widgets/rating.dart';

class NearbyRes extends StatelessWidget {

  _buildRes(){
    List<Widget> resList= [];
    restaurants.forEach((Restaurant res){
      resList.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0,),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1.0,
              color: Colors.grey[200],
            ),
          ),
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image(image: AssetImage(res.imageUrl),width: 100.0, height: 100.0,fit: BoxFit.cover,)),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      res.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3.0),
                    Rating(res.rating),
                    SizedBox(height: 3.0),
                    Text(
                      res.address,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      '5KM away',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
            ),
          ],
        ),
        )
      );
    });
    return Column(children: resList);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0),
          child: Text('Nearby Restaurants',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.3,
            ),
          ),
        ),
        _buildRes(),
      ],
    );
  }
}
