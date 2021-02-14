import 'package:flutter/material.dart';

class TourLocationCard extends StatefulWidget {
  @override
  _TourLocationCardState createState() => _TourLocationCardState();
}

class _TourLocationCardState extends State<TourLocationCard> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height/1000;
    var w = MediaQuery.of(context).size.width/1000;

    return Container(
      height: h*300,
      width: h*200,
      margin: EdgeInsets.only(right: 10),
      color: Colors.blue,
    );
  }
}
