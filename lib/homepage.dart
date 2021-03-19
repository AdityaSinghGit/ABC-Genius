import 'package:app_one/sketch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color primaryTextColor = Color(0xFF414C6B);
  Color secondaryTextColor = Color(0xFFE4979E);
  AudioCache _audioCache;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context)
        .size
        .height; //- MediaQuery.of(context).padding.top;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: _height,
          width: _width,
          alignment: Alignment.center,
          // color: Colors.amber[400],
          decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     // colors: <Color>[Color(0xffff5959), Color(0xffff5959)],
            //     colors: <Color>[Color(0xffff5959), Color(0xffff5959)],
            //   ),
            image: DecorationImage(
              image: AssetImage("assets/bg5.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "ALPHABETS",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                                // bottomLeft
                                offset: Offset(-1.5, -1.5),
                                color: Colors.black),
                            Shadow(
                                // bottomRight
                                offset: Offset(1.5, -1.5),
                                color: Colors.black),
                            Shadow(
                                // topRight
                                offset: Offset(1.5, 1.5),
                                color: Colors.black),
                            Shadow(
                                // topLeft
                                offset: Offset(-1.5, 1.5),
                                color: Colors.black),
                          ],
                          fontFamily: 'Balsamiq_Sans',
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: _height * 0.8,
                  width: _width,
                  padding: EdgeInsets.all(30),
                  child: Swiper(
                    layout: SwiperLayout.DEFAULT,
                    itemCount: alphabets.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    // pagination: SwiperPagination(
                    //   builder: DotSwiperPaginationBuilder(
                    //       activeSize: 20, space: 8, size: 10),
                    // ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // _speak();
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: _height * 0.13),
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(50, 70, 50, 60),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: _height * 0.17,
                                          width: 270,
                                        ),
                                        Container(
                                          child: Text(
                                            alphabets[index].name,
                                            style: TextStyle(
                                              fontFamily: 'Balsamiq_Sans',
                                              fontSize: 30,
                                              color: Colors.black,
                                              // fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        RaisedButton(
                                          padding: EdgeInsets.all(7),
                                          elevation: 5,
                                          color: Colors.yellow[600],
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.black,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          child: Icon(
                                            Icons.brush_outlined,
                                            color: Colors.black,
                                            size: 35,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Sketch()),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(70, 10, 70, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  border: Border.all(
                                    width: 2,
                                  ),
                                ),
                                child: Image.asset(
                                  alphabets[index].iconImage,
                                  // height: _height * 0.5,
                                  // width: 250,
                                  alignment: Alignment.topRight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(color: Colors.black, width: 3.0),
        ),
        onPressed: () {
          _audioCache.play('audio/a-z kids.mp3');
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_satisfied_alt_rounded,
                size: 40,
                color: Colors.black,
              )
            ],
          ),
        ),
        backgroundColor: Colors.yellow[600],
      ),
    );
  }
}
