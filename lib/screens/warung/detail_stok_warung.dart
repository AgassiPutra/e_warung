import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_warung/models/warung/stok_warung.dart';
import 'dart:math';

class DetailStokWarung extends StatefulWidget {
  late final StokWarungModels produk;
  DetailStokWarung({required this.produk});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<DetailStokWarung> {
  int _counter = 0;
  int maxCounter = 0;
  Random random = new Random();
  TextEditingController nameController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController stokController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _counter = int.parse(widget.produk.sisaStok);
    maxCounter = int.parse(widget.produk.sisaStok);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.produk.namaProduk,
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Container(
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
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child:
                                  Stack(fit: StackFit.loose, children: <Widget>[
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
                                            image: ExactAssetImage(
                                                'assets/tunas.png'),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 25.0),
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
                                  padding: EdgeInsets.only(
                                      left: 25, right: 25, top: 10),
                                  child: buttonAddMinus(
                                      counter: _counter,
                                      onAdd: () {
                                        setState(() {
                                          if (_counter != maxCounter) {
                                            ++_counter;
                                          }
                                        });
                                      },
                                      onChanged: (text) {
                                        setState(() {
                                          _counter = int.parse(text);
                                        });
                                      },
                                      onMinus: () {
                                        if (_counter != 0) {
                                          setState(() {
                                            --_counter;
                                          });
                                        }
                                      }))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  height: 50,
                  width: screenSize.width,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextButton(
                    child: const Text('SIMPAN',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700)),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {},
                  )),
            )
          ],
        ));
  }

  Widget buttonAddMinus(
      {Function? onAdd,
      Function? onMinus,
      Function(String)? onChanged,
      required int counter}) {
    final _textController = TextEditingController();

    return Container(
        width: 130,
        height: 60,
        child: Row(children: [
          IconButton(
              onPressed: () => onMinus!(),
              icon: Icon(Icons.remove,
                  color: (() {
                    if (counter == 0) {
                      return Colors.grey;
                    } else {
                      return Colors.blue;
                    }
                  }()))),
          Expanded(
              child: TextField(
            // expands:true,
            textAlign: TextAlign.center,
            controller: _textController..text = counter.toString(),
            onChanged: onChanged,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(border: InputBorder.none),
            keyboardType: TextInputType.number,
          )),
          IconButton(
              onPressed: () => onAdd!(),
              icon: Icon(Icons.add,
                  color: (() {
                    if (counter == maxCounter) {
                      return Colors.grey;
                    } else {
                      return Colors.blue;
                    }
                  }()))),
        ]));
  }
}
