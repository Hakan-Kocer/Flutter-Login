import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/loginpage/login.dart';

class screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(icon: Icon(Icons.exit_to_app,color: Colors.red,),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((veri){
               Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) =>MyApp()),
                (Route<dynamic> route )=> false);
              }
              );
            },
            ),
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'BUGÜN NE YESEM?',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: food(),
      ),
    );
  }
}



class food extends StatefulWidget {
  @override
  _foodState createState() => _foodState();
}

class _foodState extends State<food> {
  int corbaNO = 1;

  int yemekNO = 1;

  int tatliNO = 1;

  List<String> corbaAdlari = [
    'mercimek',
    'Tarhana',
    'Tavuksuyu',
    'Düğün',
    'Yoğurtlu'
  ];
  List<String> yemekAdlari = [
    'Karnıyarık',
    'Mantı',
    'Kuru Fasulye',
    'İçli Köfte',
    'Izgara Balık'
  ];
  List<String> tatliAdlari = [
    'Kadayıf',
    'Baklava',
    'Sütlaç',
    'Kazandibi',
    'Dondurma'
  ];

  void yemekleriYenile() {
    setState(() {
      tatliNO = Random().nextInt(5) + 1;
      yemekNO = Random().nextInt(5) + 1;
      corbaNO = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                hoverColor: Colors.white,
                highlightColor: Colors.white,
                splashColor: Colors.white,
                onPressed: () {
                  yemekleriYenile();
                },
                child: Image.asset('assets/corba_$corbaNO.jpg'),
              ),
            ),
          ),
          Text(
            corbaAdlari[corbaNO - 1] + ' Çorbası',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 200,
            child: Divider(
              height: 5,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                  hoverColor: Colors.white,
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: () {
                    yemekleriYenile();
                  },
                  child: Image.asset('assets/yemek_$yemekNO.jpg')),
            ),
          ),
          Text(
            yemekAdlari[yemekNO - 1] + ' Çorbası',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                  hoverColor: Colors.white,
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: () {
                    yemekleriYenile();
                  },
                  child: Image.asset('assets/tatli_$tatliNO.jpg')),
            ),
          ),
          Text(
            tatliAdlari[tatliNO - 1] + ' Tatlısı',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
