import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:login/loginpage/login.dart';


class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController email = TextEditingController();
   TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> kayitol() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text).then((veri){
      FirebaseFirestore.instance.collection("veri").doc(email.text).set({"KullaniciEposta":email.text,
      "KullaniciSifre":password.text,"KullaniciAdi":name.text});
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt Ol'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kullanıcı Adı',
                ),),),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Şifre',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Kayıt Ol'),
                  onPressed: kayitol
                )),

            Container(
              child: Row(
                children: <Widget>[
                  Text('Zaten Hesabın Var Mı?'),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false));
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
