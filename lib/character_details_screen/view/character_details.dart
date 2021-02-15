import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

import '../../home_screen/model/character_model.dart';
import '../../home_screen/model/character_model.dart';

class CharacterDetails extends StatefulWidget {
  final CharacterModel characterModel;
  CharacterDetails({this.characterModel});
  @override
  _CharacterDetailsState createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height/1000;
    var w = MediaQuery.of(context).size.width/1000;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: Header(
                minHeight: h*200,
                maxHeight: h*400,
                image: widget.characterModel.image,
                name: widget.characterModel.name
              )
            ),
            SliverList(delegate: SliverChildListDelegate(
              [
                SliverBody(characterModel: widget.characterModel,)
              ]
            ))
          ],
        ),
      ),
    );
  }
}

class Header extends SliverPersistentHeaderDelegate{
  final double minHeight;
  final double maxHeight;
  final String image;
  final String name;
  Header({this.maxHeight, this.minHeight, this.image, this.name});



  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    var h = MediaQuery.of(context).size.height/1000;
    var w = MediaQuery.of(context).size.width/1000;
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: [
                        0.0,
                        0.99
                      ])
              ),
            ),
            Positioned(
                bottom: -1,
                child: Container(
                  height: 3,
                  width: w*1000,
                  color: Colors.black,
                )
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: Container(
                color: Colors.transparent,
                child: Text(name, style: TextStyle(color: Colors.white, fontSize: max(20, (30*(1.0 - max(0.0, shrinkOffset)/maxExtent))), fontWeight: FontWeight.bold),),
              ),
            )
          ],
        )
      ],
    );
  }

  double get maxExtent => maxHeight;

  double get minExtent => minHeight;

  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SliverBody extends StatefulWidget {
  final CharacterModel characterModel;
  SliverBody({this.characterModel});
  @override
  _SliverBodyState createState() => _SliverBodyState();
}

class _SliverBodyState extends State<SliverBody> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height/1000;
    var w = MediaQuery.of(context).size.width/1000;
    return Container(
      // height: h*1000,
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Movies', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),),
              Text('See All', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: 225,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.characterModel.movies.length,
              itemBuilder: (BuildContext context, int index){
                return videoBody(widget.characterModel.movies[index].name,widget.characterModel.movies[index].image);
              },
            ),
          ),

          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Reading Materials', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),),
              Text('See All', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.characterModel.readingMaterials.length,
              itemBuilder: (BuildContext context, int index){
                return comicBody(widget.characterModel.readingMaterials[index].name,widget.characterModel.readingMaterials[index].image);
              },
            ),
          )
        ],
      ),
    );
  }

  videoBody(String name, String image){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 180,
          width: 200,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1,1)
              )
            ]
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width:190,
          child: Text(name, style: TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.bold),maxLines: 2, textAlign: TextAlign.center,))
      ],
    );
  }

  comicBody(String name, String image){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 200,
          width: 160,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            // color: Colors.red,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.redAccent.withOpacity(0.7),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1,1)
                )
              ]
          ),
        ),
        SizedBox(height: 10,),
        Container(
            width:150,
            child: Text(name, style: TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.bold),maxLines: 2, textAlign: TextAlign.center,))
      ],
    );
  }
}
