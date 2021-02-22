import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:ultra_gif/src/models/gif_model.dart';


class GifProvider{

  String _apikey  = '7B8upN4OGacKQV4egxZvqCk4sAgetm58';
  String _url     = 'api.giphy.com';
  String _limit    = '25';
  String _rating   = 'g';


  Future <List<Gif>> getTrendi() async {

    // https://api.giphy.com/v1/gifs/trending?api_key=7B8upN4OGacKQV4egxZvqCk4sAgetm58&limit=25&rating=g
    final url = Uri.https(_url, '/v1/gifs/trending', {
      'api_key' : _apikey,
      'limit'   : _limit,
      'rating'  : _rating
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final gifs = new Gifs.fromJsonList(decodedData['data']);
  
    // print(gifs.items[0].title);
    
    return gifs.items;

  }
  Future <List<Gif>> searchGif(String query) async {

    // https://api.giphy.com/v1/gifs/search?api_key=7B8upN4OGacKQV4egxZvqCk4sAgetm58&q=&limit=25&offset=0&rating=g&lang=en
    final url = Uri.https(_url, '/v1/gifs/search', {
      'api_key' : _apikey,
      'q'       : query,
      'limit'   : _limit,
      'rating'  : _rating,
      'lan'     : 'en',
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final gifs = new Gifs.fromJsonList(decodedData['data']);
  
    // print(gifs.items[0].title);
    
    return gifs.items;

  }



}