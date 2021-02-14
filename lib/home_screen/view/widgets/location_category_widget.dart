import 'package:captain_geek/location_picker_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:captain_geek/home_screen/model/character_model.dart';
import 'package:get/get.dart';

class LocationCategoryWidget extends StatefulWidget {
  final List<CharacterModel> character;
  LocationCategoryWidget({this.character});
  @override
  _LocationCategoryWidgetState createState() => _LocationCategoryWidgetState();
}

class _LocationCategoryWidgetState extends State<LocationCategoryWidget> with SingleTickerProviderStateMixin{
  SequenceAnimation sequenceAnimation;

  AnimationController _imageScaleController;

  @override
  void initState() {
    // TODO: implement initState
    _imageScaleController = AnimationController(vsync: this);
    super.initState();

    sequenceAnimation = new SequenceAnimationBuilder()
      .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: Duration(milliseconds: 0),
          to: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          tag: "imageOne"
      ).addAnimatable(
        animatable: Tween<double>(begin: 0, end: 1),
        from: Duration(milliseconds: 100),
        to: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        tag: "imageTwo"
      ).addAnimatable(
        animatable: Tween<double>(begin: 0, end: 1),
        from: Duration(milliseconds: 200),
        to: Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        tag: "imageThree"
    ).addAnimatable(
        animatable: Tween<double>(begin: 0, end: 1),
        from: Duration(milliseconds: 300),
        to: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        tag: "imageFour"
    ).addAnimatable(
        animatable: Tween<double>(begin: 0, end: 1),
        from: Duration(milliseconds: 400),
        to: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
        tag: "imageFive"
    ).

      animate(_imageScaleController);


    _imageScaleController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _imageScaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height/1000;
    var availableWidth = (MediaQuery.of(context).size.width-20)/1000;
    double topImageOne = availableWidth*594;
    double topImageTwo = availableWidth*394;
    double bottomImageWidth = availableWidth*325.3;

    List<BoxShadow> boxShadow = [
      // BoxShadow(
      //   spreadRadius: 0.5,
      //   color: Colors.black12,
      //   blurRadius: 0.5,
      //   offset: Offset(1,1)
      // )
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          Container(
            height: (310+availableWidth*12),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedBuilder(
                      animation: _imageScaleController,
                      builder: (BuildContext context, _){
                        return Opacity(
                          opacity: sequenceAnimation["imageOne"].value,
                          child: Stack(
                            children: [
                              Container(
                                height: 160*sequenceAnimation["imageOne"].value,
                                width: topImageOne*sequenceAnimation["imageOne"].value,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                    image: DecorationImage(
                                        image: AssetImage(widget.character[0].image),
                                        fit: BoxFit.cover
                                    ),
                                    boxShadow: boxShadow
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 2),
                                  height: 18*sequenceAnimation["imageOne"].value,
                                  width: (topImageOne*0.35)*sequenceAnimation["imageOne"].value,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                    boxShadow: boxShadow
                                  ),
                                  child: Center(
                                    child: Text(widget.character[0].name, style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 11*sequenceAnimation["imageOne"].value),  overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                bottom: 20,
                                left: 0,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _imageScaleController,
                      builder: (BuildContext context, _){
                        return Stack(
                          children: [
                            Container(
                              height: 160*sequenceAnimation["imageTwo"].value,
                              width: topImageTwo*sequenceAnimation["imageTwo"].value,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(widget.character[1].image),
                                      fit: BoxFit.cover
                                  ),
                                  boxShadow: boxShadow
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 2),
                                height: 18*sequenceAnimation["imageTwo"].value,
                                width: (topImageTwo*0.40)*sequenceAnimation["imageTwo"].value,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                    boxShadow: boxShadow
                                ),
                                child: Center(
                                  child: Text(widget.character[1].name, style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 11*sequenceAnimation["imageTwo"].value), overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              bottom: 20,
                              left: 0,
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
                SizedBox(height: availableWidth*12,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedBuilder(
                      animation: _imageScaleController,
                      builder: (BuildContext context, _){
                        return Stack(
                          children: [
                            Container(
                              height: 150*sequenceAnimation["imageThree"].value,
                              width: bottomImageWidth*sequenceAnimation["imageThree"].value,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(widget.character[2].image),
                                      fit: BoxFit.cover
                                  ),
                                  boxShadow: boxShadow
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 2),
                                height: 18*sequenceAnimation["imageThree"].value,
                                width: (bottomImageWidth*0.45)*sequenceAnimation["imageThree"].value,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                    boxShadow: boxShadow
                                ),
                                child: Center(
                                  child: Text(widget.character[2].name, style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 11*sequenceAnimation["imageThree"].value), overflow: TextOverflow.ellipsis,),
                                ),
                              ),
                              bottom: 20,
                              left: 0,
                            )
                          ],
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _imageScaleController,
                      builder: (BuildContext context, _){
                        return Stack(
                          children: [
                            Container(
                              height: 150*sequenceAnimation["imageFour"].value,
                              width: bottomImageWidth*sequenceAnimation["imageFour"].value,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(widget.character[3].image),
                                      fit: BoxFit.cover
                                  ),
                                  boxShadow: boxShadow
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 2),
                                height: 18*sequenceAnimation["imageFour"].value,
                                width: (bottomImageWidth*0.45)*sequenceAnimation["imageFour"].value,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                    boxShadow: boxShadow
                                ),
                                child: Center(
                                  child: Text(widget.character[3].name, style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 11*sequenceAnimation["imageFour"].value), overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              bottom: 20,
                              left: 0,
                            )
                          ],
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _imageScaleController,
                      builder: (BuildContext context, _){
                        return Stack(
                          children: [
                            Container(
                              height: 150*sequenceAnimation["imageFive"].value,
                              width: bottomImageWidth*sequenceAnimation["imageFive"].value,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(widget.character[4].image),
                                      fit: BoxFit.cover
                                  ),
                                  boxShadow: boxShadow
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 2),
                                height: 18*sequenceAnimation["imageFive"].value,
                                width: (bottomImageWidth*0.45)*sequenceAnimation["imageFive"].value,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                    boxShadow: boxShadow
                                ),
                                child: Center(
                                  child: Text(widget.character[4].name, style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 11*sequenceAnimation["imageFive"].value), overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              bottom: 20,
                              left: 0,
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          FlatButton(onPressed: (){
            Get.to(LocationPickerPageView(list: widget.character,));
          },
            child: Container(
              height: 45,
              width: availableWidth*300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 1),
                color: Colors.black87
              ),
              child: Center(
              child: Text('See All',  style: TextStyle(color: Colors.white),),
          ),
        ))
        ],
      ),
    );
  }
}


class CharacterDetailPopUp extends StatefulWidget {
  final CharacterModel characterModel;
  CharacterDetailPopUp({this.characterModel});
  @override
  _CharacterDetailPopUpState createState() => _CharacterDetailPopUpState();
}

class _CharacterDetailPopUpState extends State<CharacterDetailPopUp> with TickerProviderStateMixin{
  SequenceAnimation scaleAnimation;
  AnimationController scaleController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scaleController = AnimationController(vsync: this);

    scaleAnimation = new SequenceAnimationBuilder()
        .addAnimatable(
        animatable: Tween<double>(begin: 0.75, end: 1),
        from: Duration(milliseconds: 0),
        to: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        tag: "boxScale"
    ).addAnimatable(
        animatable: Tween<double>(begin: 0.0, end: 1),
        from: Duration(milliseconds: 300),
        to: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        tag: "boxScale"
    ).
    animate(scaleController);


  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(

    );
  }
}

