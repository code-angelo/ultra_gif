import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';

class Options {

  _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _requestPermission() async { // call permissions method
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }

  
  share(BuildContext context, String gifUrl, String title) async {
    RenderBox box = context.findRenderObject();

    var url = gifUrl;
    var response = await get(url);
    String documentDirectory = (await getExternalStorageDirectory()).path;
    File imgFile = new File('$documentDirectory/$title.GIF');
    imgFile.writeAsBytesSync(response.bodyBytes);

    Share.shareFiles(
      ['$documentDirectory/$title.gif'],
      subject: title,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
    );
  }


  save(BuildContext context, String gifUrl) async {
    _showSnackBar(context, 'Downloading...');
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      var appDocDir = await getApplicationDocumentsDirectory();
      String savePath = appDocDir.path + "/temp.gif";

      await Dio().download(gifUrl, savePath, onReceiveProgress: (count, total) {
        // update percent in progres bar
        // print((count / total * 100).toStringAsFixed(0) + "%");
      });

      final result = await ImageGallerySaver.saveFile(savePath);
      print(result);
      
      if(result['isSuccess'] == true){
        _showSnackBar(context, 'Download Success!');
      }else{
        _showSnackBar(context, 'An error occurred. Please try again');
      }
    }
    else{ _showSnackBar(context, 'An error occurred. Please try again'); }
  }

  copyClipboard(String gifUrl) async {
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print('yes! it is granted');
      
      var appDocDir = await getTemporaryDirectory();
      String savePath = appDocDir.path + "/temp.gif";
      // String gifUrl = "https://media3.giphy.com/media/qJzPR90fB8qod6mWxJ/giphy.gif?cid=d4606d3a23oivhupf2pa0skj5wtto4749e5fws7a3cnqvxxh&rid=giphy.gif";
      // await Dio().download(gifUrl, savePath);
      // final result = await ImageGallerySaver.saveFile(savePath);
      print(savePath);
      // _toastInfo("$result");
    }
  }
}