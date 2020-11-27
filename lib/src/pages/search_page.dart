import 'package:flutter/material.dart';

import '../colors.dart';
 
 
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
      body: Center(
        child: CircularProgressIndicator(
          
        ),
      ),
    );
  }
}