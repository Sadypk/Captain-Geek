import 'dart:math';

import 'package:flutter/material.dart';
import 'package:captain_geek/home_screen/view/widgets/location_category_widget.dart';
import 'package:captain_geek/home_screen/view/widgets/tour_location_card.dart';
import 'package:captain_geek/home_screen/view_model/character_view_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  TextEditingController _searchTextController = TextEditingController();
  FocusNode _searchNode = FocusNode();

  TabController _tabController;
  Animation fadeAnimation;
  AnimationController _fadeController;
  AnimationController _searchController;
  Animation<double> searchAnimation;
  Animation<double> searchIconAnimation;
  Animation<Color> searchColorAnimation;
  int previousIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fadeController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _searchController = AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    _tabController = TabController(length: 3, vsync: this);

    _fadeController.forward();
    _tabController.addListener(() {
      if(!_tabController.indexIsChanging){
        if(_tabController.index != previousIndex){
          setState(() {
            _fadeController.reset();
            _fadeController.forward();
            previousIndex = _tabController.index;
          });
        }
      }
    });

    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent:_fadeController, curve: Curves.easeInOut));
    searchAnimation = Tween(begin: 1.0, end: 0.15).animate(CurvedAnimation(parent:_searchController, curve: Curves.easeIn));
    searchIconAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent:_searchController, curve: Curves.easeIn));
    searchColorAnimation = ColorTween(begin: Colors.transparent, end: Colors.white54).animate(CurvedAnimation(curve: Curves.easeInOut, parent: _searchController));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fadeController.dispose();
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height/1000;
    var w = MediaQuery.of(context).size.width/1000;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: Column(
                children: [
                  AnimatedBuilder(animation: _searchController, builder: (BuildContext context, _){
                    return SizedBox(height: searchIconAnimation.value*80);
                  }),
                  Stack(
                    children: [
                      AnimatedBuilder(animation: _fadeController, builder: (BuildContext context, _){
                        return Opacity(
                          opacity: fadeAnimation.value,
                          child: Container(
                            height: h*260,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(CharacterViewModel.header[_tabController.index]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        );
                      }),
                      Container(
                        height: h*265,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Colors.grey.withOpacity(0.0),
                                  Colors.black,
                                ],
                                stops: [
                                  0.0,
                                  0.95
                                ])),
                      ),
                      AnimatedBuilder(animation: _searchController, builder: (BuildContext context, _){
                        return Opacity(
                          opacity: searchIconAnimation.value,
                          child: Container(
                            height: h*265,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [
                                      Colors.black,
                                      Colors.grey.withOpacity(0.0)
                                    ],
                                    stops: [
                                      0.0,
                                      0.2
                                    ])),
                          ),
                        );
                      })
                    ],
                  ),
                  // SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TabBar(tabs: [
                      // Tab(child: Text('DC', style: TextStyle(fontSize: 13, color: _selectedIndex==0?Colors.blue:Colors.grey),),),
                      // Tab(child: Text('Marvel', style: TextStyle(fontSize: 13, color: _selectedIndex==1?Colors.blue:Colors.grey)),),
                      // Tab(child: Text('Manga', style: TextStyle(fontSize: 13, color: _selectedIndex==2?Colors.blue:Colors.grey)),)
                      Tab(text: 'DC',),
                      Tab(text: 'Marvel',),
                      Tab(text: 'Manga',),
                    ],
                      labelColor: Colors.lightBlueAccent,
                      labelStyle: TextStyle(fontSize: 13),
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      indicatorColor: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Expanded(child: TabBarView(
                    controller: _tabController,
                    children: [
                      LocationCategoryWidget(character: CharacterViewModel.dc,),
                      LocationCategoryWidget(character: CharacterViewModel.marvel,),
                      LocationCategoryWidget(character: CharacterViewModel.manga,)
                    ],
                  ))
                  // locationSlideShow

                ],
              ),
            ),
            AnimatedBuilder(animation: _searchController, builder: (BuildContext context, _){
              return Positioned(
                top: 15,
                right: -(((w*1000)*searchAnimation.value)-60),
                child: Container(
                  height: 60,
                  width: w*1000,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: searchColorAnimation.value,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54,
                        ),
                        child: Transform.rotate(
                          angle: -(pi*2)*searchIconAnimation.value,
                          child: IconButton(
                            onPressed: (){
                              if(_searchController.value == 0.0){
                                _searchController.forward();
                              }else{
                                _searchController.reverse();
                              }
                            },
                            icon: Icon(Icons.search, color: Colors.white,),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: TextFormField(
                          enabled: _searchController.value==1,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                          decoration: InputDecoration.collapsed(
                            hintStyle: TextStyle(fontSize: 17, color: Colors.white60),
                            hintText: _searchController.value==1?'Search':'',
                          ),
                          controller: _searchTextController,
                          focusNode: _searchNode,
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
