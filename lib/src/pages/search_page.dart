import 'package:flutter/material.dart';

import '../colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

 
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Most popular'),
        actions: [
          Container(
            height: 57,
            width: 57,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  PURPLE,
                  BLUE
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )
            ),
            child: Icon(Icons.search)
          ),
        ],
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => new Container(
            color: PURPLE,
            child: new Center(
              child: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('$index'),
              ),
            )),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      )
    );
  }
}