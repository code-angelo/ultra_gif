import 'package:flutter/material.dart';

import '../colors.dart';

class HomePage extends StatelessWidget {

  final tittle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 52,
    height: 0.80,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w800,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = CREAM
      // ..shader = LinearGradient(
      //   colors: <Color>[
      //     Color(0xffDA44bb), 
      //     Color(0xff8921aa)
      //   ],
      // ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))
  );

  final tittle_2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 52,
    letterSpacing: 0.1,
    height: 0.80,
    fontWeight: FontWeight.w900,
    color: CREAM,
  );

  final subTitulo = TextStyle(fontSize: 18, color: CREAM, height: 1.4);
  final subTitulo2 = TextStyle(fontSize: 18, color: CREAM, height: 1.4, fontStyle: FontStyle.italic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLACK,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.red,
                // margin: EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "WELCOME TO", 
                        style: tittle,
                      ),
                      TextSpan(
                        text: " ULTRA\nGIF", 
                        style: tittle_2,
                      ),
                    ]
                  ),
                ),
              ),

              SizedBox(height: 24,),

              Container(
                child: Text(
                  "Get the coolest GIF’s around GIPHY and share it with your friends or just yourself.", 
                  style: subTitulo,
                  textAlign: TextAlign.justify,
                )
              ),
              SizedBox(height: 24,),
              Row(
                children: [
                  Container(
                    child: Text(
                      "Like pretty pretty GIF’s.", 
                      style: subTitulo2,
                      textAlign: TextAlign.left,
                    )
                  ),
                  Expanded(child: Container(),),
                ],
              ),

              SizedBox(height: 50,),

              Container(
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      GREEN,
                      BLUE,
                      PURPLE,
                      RED,
                      YELLOW
                    ]
                  )
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'search');
                    // showSearch(
                    //   context: context, 
                    //   delegate: DataSearch(), //uso de la clase abstracta de la busqueda
                    //   query: '' // lo que va recibir el escribir en la busqueda
                    // );
                  },
                  child: Container(
                    color: BLACK,
                    margin: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('My awesome topic ...', style: TextStyle(color: CREAM.withOpacity(0.4))),
                        ),
                        Expanded(child: Container(),),
                        Icon(Icons.arrow_right, color: CREAM.withOpacity(0.4)),

                      ],
                    ),
                  ),
                )
              ),
              SizedBox(height: 100,),

            ],
          ),
        ),
      ),
    );
  }
}