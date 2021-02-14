import 'dart:math';

import 'package:captain_geek/home_screen/model/character_model.dart';
import 'package:captain_geek/home_screen/view_model/character_view_model.dart';
import 'package:flutter/material.dart';

class LocationPickerPageView extends StatefulWidget {
  final List<CharacterModel> list;
  LocationPickerPageView({this.list});
  @override
  _LocationPickerPageViewState createState() => _LocationPickerPageViewState();
}

class _LocationPickerPageViewState extends State<LocationPickerPageView> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height/1000;
    var w = MediaQuery.of(context).size.width/1000;
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: h*200,
          ),
          Container(
            height: h*800,
            child: PageViewWidget(list: widget.list, height: h*600,),
          )
        ],
      ),
    );
  }
}

class PageViewWidget extends StatefulWidget {
  final List<CharacterModel> list;
  final double height;
  PageViewWidget({this.list, this.height});
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  PageController pageController;

  double viewportFraction = 0.85;

  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController =
    PageController(initialPage: 0, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        double scale = max(viewportFraction,
            (1 - (pageOffset - index).abs()) + viewportFraction);

        double angle = (pageOffset - index).abs();

        if (angle > 0.5) {
          angle = 1 - angle;
        }
        return Container(
          // height: widget.height,
          padding: EdgeInsets.only(
            right: 10,
            left: 20,
            top: 100 - scale * 25,
            bottom: 50 - scale * 25,
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.001,
              )
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 4.5/8,
                  child: Container(
                    child: Image.asset(
                      widget.list[index].image,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      alignment: Alignment((pageOffset - index).abs() * 0.5, 0),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 20,
                  child: AnimatedOpacity(
                    opacity: angle == 0 ? 1 : 0,
                    duration: Duration(
                      milliseconds: 200,
                    ),
                    child: Text(
                      widget.list[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: widget.list.length,
    );
  }
}

// class VacationBean {
//   String url;
//   String name;
//
//   VacationBean(this.url, this.name);
//
//   static List<VacationBean> generate() {
//     return [
//       VacationBean("assets/images/6.jpg", "Sundarban"),
//       VacationBean("assets/images/2.jpg", "Franch"),
//       VacationBean("assets/images/3.jpg", "Paris"),
//       VacationBean("assets/images/4.jpg", "London"),
//       VacationBean("assets/images/5.jpg", "China"),
//     ];
//   }
// }
