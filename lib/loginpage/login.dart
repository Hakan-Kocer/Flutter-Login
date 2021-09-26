import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:login/Screen/Screen.dart';
import 'package:login/registerpage/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/Screen/Screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> girisYap() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text).then((veri){
      Navigator.push(context,
      MaterialPageRoute(builder: (context)=> screen(),),);
    },);
  }
  kayitol(){
    runApp(MaterialApp(
    home: register(),
    debugShowCheckedModeBanner: false));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bugün Ne Yesem?'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Giriş Ekranı',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E Mail Adresi',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şifre',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Şifreyi Unuttum'),
                ),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Giriş'),
                      onPressed: girisYap,
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Hesabın Yok Mu?'),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text(
                          'Kayıt Ol',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: kayitol,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}