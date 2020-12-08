import 'package:flutter/material.dart';

import 'package:ultra_gif/src/colors.dart';


class DataSearch extends SearchDelegate{

  String results = '';

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
          query = ''; // clean the query
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
    return Center(
      child: Container(
        child: Text(results),
        color: Colors.deepOrangeAccent,
      )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    return Container();

  }
}