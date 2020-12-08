import 'package:flutter/material.dart';
import 'package:ultra_gif/src/models/gif_model.dart';

import '../colors.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
 
class MyStaggeredGridview extends StatelessWidget {

  final List<Gif> gifs;

  MyStaggeredGridview({@required this.gifs});


  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: gifs.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                PURPLE,
                BLUE
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight
            ),
            borderRadius: BorderRadius.circular(3)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: FadeInImage(
              image: NetworkImage('${gifs[index].images.original.imageUrl}'),
              placeholder: AssetImage('assets/images/no-image.png'),
              fit: BoxFit.cover,
            ),
          )
        );
      } ,
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 1),
      // staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}