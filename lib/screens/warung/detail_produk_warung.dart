import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_warung/models/warung/stok_warung.dart';
import 'dart:math';

class DetailProduk extends StatefulWidget {
  late final StokWarungModels produk;
  DetailProduk({required this.produk});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<DetailProduk> {
  int _counter = 0;
  Random random = new Random();
  TextEditingController nameController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController stokController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _counter = int.parse(widget.produk.sisaStok);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
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
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
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
                      ),
                    ],
                  ),
                ),
                Container(
                  color: const Color(0xffFFFFFF),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Informasi Produk',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Nama Produk',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  '${widget.produk.namaProduk}',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: const Text(
                                      'Stok',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            )),
                        Padding(
                            padding:
                                EdgeInsets.only(left: 25, right: 25, top: 10),
                            child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Flexible(
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    iconSize: 18,
                                                    onPressed: () {
                                                      setState(() {
                                                        if (_counter != 0) {
                                                          _counter--;
                                                        }
                                                      });
                                                    },
                                                    icon: Icon(Icons.remove,
                                                        color: (() {
                                                          if (_counter == 0) {
                                                            return Colors.grey;
                                                          } else {
                                                            return Colors.blue;
                                                          }
                                                        }()))),
                                                Expanded(
                                                    child: TextField(
                                                  controller:
                                                      TextEditingController()
                                                        ..text = '$_counter',
                                                  textAlign: TextAlign.center,
                                                  onChanged: (text) {
                                                    _counter = int.parse(text);
                                                    text = "$_counter";
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              InputBorder.none),
                                                  keyboardType:
                                                      TextInputType.number,
                                                )),
                                                IconButton(
                                                    iconSize: 18,
                                                    onPressed: () {
                                                      setState(() {
                                                        _counter++;
                                                      });
                                                    },
                                                    icon: const Icon(Icons.add,
                                                        color: Colors.blue)),
                                              ])),
                                      flex: 2,
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextButton(
                  child: const Text('SIMPAN',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {},
                )),
          ],
        ),
      ),
    );
  }
}
