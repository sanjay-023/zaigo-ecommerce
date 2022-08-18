import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class RatingStar extends StatelessWidget {
  final double value;
  RatingStar({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: value,
      starBuilder: (index, color) => Icon(
        Icons.star,
        color: color,
        size: 18,
      ),
      starCount: 5,
      starSize: 18,
      maxValue: 5,
      starSpacing: 0,
      maxValueVisibility: true,
      valueLabelVisibility: false,
      animationDuration: Duration(milliseconds: 1000),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      valueLabelMargin: const EdgeInsets.only(right: 8),
      starOffColor: const Color(0xffe7e8ea),
      starColor: Colors.yellow,
    );
  }
}
