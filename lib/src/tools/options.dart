
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';

class Options {

  _requestPermission() async { // call permissions method
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }
  
  share(BuildContext context, String gifUrl, String title){
    RenderBox box = context.findRenderObject();
    Share.share(
      gifUrl,
      subject: title,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
    );
  }

  save(String gifUrl) async {
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      
      var appDocDir = await getApplicationDocumentsDirectory();
      String savePath = appDocDir.path + "/temp.gif";
      // String gifUrl = "https://media3.giphy.com/media/qJzPR90fB8qod6mWxJ/giphy.gif?cid=d4606d3a23oivhupf2pa0skj5wtto4749e5fws7a3cnqvxxh&rid=giphy.gif";
      await Dio().download(gifUrl, savePath, onReceiveProgress: (count, total) {
        // update percent in progres bar
        print((count / total * 100).toStringAsFixed(0) + "%");
      });
      final result = await ImageGallerySaver.saveFile(savePath);
      print(result);
      // _toastInfo("$result");
    }
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