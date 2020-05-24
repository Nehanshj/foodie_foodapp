import 'package:flutter/material.dart';

class Rating extends StatelessWidget {

  final int ratingLikes;

  Rating(this.ratingLikes);

  @override
  Widget build(BuildContext context) {
    String likes = '';
      for(int i =0; i<ratingLikes; i++){
        likes += '👍 ';
      }
    return Text(likes);
  }
}
