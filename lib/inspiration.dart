import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'cameraApp.dart';

class Inspiration extends StatefulWidget {
  @override
  _InspirationState createState() => _InspirationState();
}

class _InspirationState extends State<Inspiration> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SafeArea(

        child: Container(alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
            )
          ),
          child: DraggableScrollableSheet(
            maxChildSize: 0.9,
            minChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
            return StaggeredGridView.countBuilder(
              itemCount: 12,
              controller: scrollController,
              itemBuilder: (BuildContext context, int index) => Center(child: GestureDetector( onTap: ()
                  {
                    //call the api and nacigate to the other page
                    Fluttertoast.showToast(msg: index.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraApp()),
                    );
                  },child: new Image.asset('assets/modelPhoto.jpg',))),
              mainAxisSpacing: 8.0,
              staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 2 : 2),
              crossAxisCount: 4 ,
              shrinkWrap: true,

            );
            },
          ),
        ),
      ) ,
    );
  }
}
