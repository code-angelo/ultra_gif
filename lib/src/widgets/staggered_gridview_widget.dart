import 'package:flutter/material.dart';

import '../colors.dart';
import 'package:ultra_gif/src/models/gif_model.dart';
import 'package:ultra_gif/src/tools/options.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
 
class MyStaggeredGridview extends StatelessWidget {

  final List<Gif> gifs;

  MyStaggeredGridview({@required this.gifs});

  final Options option = Options();


  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: gifs.length,
      itemBuilder: (BuildContext context, int index) {
        String title = '${gifs[index].title}';
        String fixedheight = '${gifs[index].images.fixedHeight.imageUrl}';
        String preview = '${gifs[index].images.original.imageUrl}';
        String shareOrSave = '${gifs[index].images.original.imageUrl}';

        return GestureDetector(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Center(child: Image(image:  AssetImage('assets/images/loading blocks.gif'), height: 75)),
                          imageUrl: preview,
                          width: 500,
                          fit: BoxFit.fitWidth,
                        ),
                        // child: FadeInImage(
                        //   image: NetworkImage(preview),
                        //   placeholder: AssetImage('assets/images/no-image.png'),
                        //   height: height,
                        //   width: width,
                        //   fit: BoxFit.contain,
                        //   alignment: Alignment.bottomRight,
                        // ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 176,
                        // height: 117,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: DEEPGREY,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => option.share(context, shareOrSave, title),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 1),
                                color: Colors.transparent,
                                child: Row(children: [
                                    Text('Share'),
                                    Expanded(child: Container()),
                                    Icon(Icons.share, size: 12)
                                ],),
                              ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: (){
                                option.save(context, shareOrSave);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 1),
                                color: Colors.transparent,
                                child: Row(children: [
                                    Text('Save'),
                                    Expanded(child: Container()),
                                    Icon(Icons.download_sharp, size: 12,)
                                ],),
                              ),
                            ),
                            Divider(),
                            Row(children: [
                                Text('Copy'),
                                Expanded(child: Container()),
                                Icon(Icons.content_copy,size: 12)
                            ],),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            );
          },
          child: Container(
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
              child: CachedNetworkImage(
                placeholder: (context, url) => Image(image:  AssetImage('assets/images/no-image.png'), fit: BoxFit.cover),
                imageUrl: fixedheight,
                fit: BoxFit.cover,
              ),

              // child: FadeInImage(
              //   image: NetworkImage(fixedheight),
              //   placeholder: AssetImage('assets/images/no-image.png'),
              //   fit: BoxFit.cover,
              // ),
            )
          ),
        );
      } ,
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 1),
      // staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }
}