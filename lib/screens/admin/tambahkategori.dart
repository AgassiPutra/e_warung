import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_warung/screens/login.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TambahKategori extends StatefulWidget {
  const TambahKategori({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<TambahKategori> {
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tambah Kategori',
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    color: Colors.blue,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Stack(fit: StackFit.loose, children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image:
                                            ExactAssetImage('assets/tunas.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ],
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kategori',
                    ),
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Simpan',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700)),
                    onPressed: () {
                      // print(nameController.text);
                      // print(passwordController.text);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Dashboard()),
                      // );
                    },
                  )),
            ],
          ),
        ));
  }
}
