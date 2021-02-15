import 'dart:math';

import 'package:captain_geek/home_screen/model/character_model.dart';
import 'package:captain_geek/home_screen/view_model/character_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'character_details_screen/view/character_details.dart';
import 'home_screen/model/character_model.dart';


class CharacterPickerPageView extends StatefulWidget {
  final List<CharacterModel> list;
  CharacterPickerPageView({this.list});
  @override
  _CharacterPickerPageViewState createState() => _CharacterPickerPageViewState();
}

class _CharacterPickerPageViewState extends State<CharacterPickerPageView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black26,
      body: PageViewWidget(list: widget.list),
    );
  }
}

class PageViewWidget extends StatefulWidget {
  final List<CharacterModel> list;
  PageViewWidget({this.list});
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> with TickerProviderStateMixin{
  AnimationController controller;
  Animation<double> glowAnimation;
  PageController pageController;
  PageController reversePageController;

  double viewportFraction = 0.85;
  double pageOffset = 0;

  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1500), reverseDuration: Duration(milliseconds: 2000));
    glowAnimation = Tween(begin: 0.4 ,end: 1.0).animate(controller);
    controller.forward();
    controller.addListener(() {
      int next = pageController.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
      if(controller.value == 1){
        controller.reverse();
      }else if(controller.value == 0){
        controller.forward();
      }
    });
    reversePageController = PageController(initialPage: widget.list.length-1);
    pageController = PageController(initialPage: 0, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height/1000;
    var w = MediaQuery.of(context).size.width/1000;
    List<CharacterModel> reverseList = widget.list.reversed.toList();
    return Column(
      children: [
        Container(
          height: h*800,
          child: PageView.builder(
            onPageChanged: (index) {
              reversePageController.animateToPage(
                reverseList.length - 1 - index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
            controller: pageController,
            itemBuilder: (context, index) {
              double scale = max(viewportFraction,
                  (1 - (pageOffset - index).abs()) + viewportFraction);

              double angle = (pageOffset - index).abs();

              if (angle > 0.5) {
                angle = 1 - angle;
              }
              return InkWell(
                onTap: (){Get.to(CharacterDetails(characterModel: widget.list[index]));},
                child: Container(
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
                          child: AnimatedBuilder(
                            animation: controller,
                            builder: (BuildContext context, _){
                              return Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.redAccent.withOpacity(glowAnimation.value),
                                          spreadRadius: 3+glowAnimation.value*0.5,
                                          blurRadius: 5+glowAnimation.value*0.5,
                                          offset: Offset(1,1)
                                      )
                                    ]
                                ),
                                child: Image.asset(
                                  widget.list[index].image,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                  alignment: Alignment((pageOffset - index).abs() * 0.5, 0),
                                ),
                              );
                            },
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
                ),
              );
            },
            itemCount: widget.list.length,
          ),
        ),
        Container(
          height: h*200,
          padding: EdgeInsets.only(left: 20),
          child: PageView.builder(
            controller: reversePageController,
            itemCount: reverseList.length,
            itemBuilder: (BuildContext context, int index){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Movies: ${reverseList[index].movies.length}', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text('Reading Materials: ${reverseList[index].readingMaterials.length}', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),)
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
