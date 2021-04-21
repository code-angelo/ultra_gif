import 'package:flutter/material.dart';

import 'package:ultra_gif/src/colors.dart';
import 'package:ultra_gif/src/models/gif_model.dart';
import 'package:ultra_gif/src/providers/gif_provider.dart';
import 'package:ultra_gif/src/widgets/staggered_gridview_widget.dart';


class DataSearch extends SearchDelegate{

  String results = '';
  final gifProvider = new GifProvider();

  ThemeData appBarTheme(BuildContext context){
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
    primaryColor: Color.fromRGBO(255,255,255,0.15),
    primaryIconTheme: theme.primaryIconTheme.copyWith(color: BLUE),
    primaryColorBrightness: Brightness.dark,
  );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // action of appbar (clean or cancel)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          ( query == '' ) ? close(context, null) : query = ''; // close the searchbar o clean query
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // left icon of appbar
    return IconButton(
      icon: AnimatedIcon(
        color: BLUE,
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // the results that going to show
    if( query.isNotEmpty){
      return FutureBuilder(
        future: gifProvider.searchGif(query),
        builder: (BuildContext context, AsyncSnapshot <List<Gif>> snapshot){
          if( snapshot.hasData){

            return MyStaggeredGridview(
              gifs: snapshot.data
            );
          }else{
            return Center(
              child: Image(image:  AssetImage('assets/images/loading blocks.gif'), height: 75),
            );
          }
        },
      );
    }else{
      return Center(
        child: Text('Not found')
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return Container();
  }
}