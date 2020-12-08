import 'package:flutter/material.dart';
import 'package:ultra_gif/src/search/search_delegate.dart';

import '../colors.dart';

import 'package:ultra_gif/src/providers/gif_provider.dart';
import 'package:ultra_gif/src/widgets/staggered_gridview_widget.dart';

 
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final gifProvider = new GifProvider();

    return Scaffold(
      backgroundColor: BLACK,
      appBar: AppBar(
        title: Text('Most popular'),
        backgroundColor: Color.fromRGBO(255,255,255,0.15),
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
            child: GestureDetector(
              child: Icon(Icons.search),
              onTap: (){
                showSearch(
                  context: context, 
                  delegate: DataSearch(), //uso de la clase abstracta de la busqueda
                  query: '' // lo que va recibir el escribir en la busqueda
                );
              },
            )
          ),
        ],
      ),
      body: FutureBuilder(
        future: gifProvider.getTrendi(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          if(snapshot.hasData){
            return MyStaggeredGridview(
              gifs: snapshot.data
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}