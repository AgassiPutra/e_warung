import 'dart:convert';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class DetailProduk extends StatefulWidget {
  const DetailProduk({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<DetailProduk> {
  int _counter = 0;
  Random random = new Random();
  TextEditingController nameController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController stokController = TextEditingController();

  List _testList = [
    {'no': 1, 'keyword': 'Semua'},
    {'no': 2, 'keyword': 'Sayur'},
    {'no': 3, 'keyword': 'Daging'},
    {'no': 4, 'keyword': 'Buah'},
    {'no': 5, 'keyword': 'Kerajinan'}
  ];
  List<DropdownMenuItem> _dropdownTestItems = [];
  var _selectedTest;

  List _testList2 = [
    {'no': 1, 'keyword': 'Semua'},
    {'no': 2, 'keyword': 'Merk1'},
    {'no': 3, 'keyword': 'Merk2'},
    {'no': 4, 'keyword': 'Merk3'},
    {'no': 5, 'keyword': 'Merk4'}
  ];
  List<DropdownMenuItem> _dropdownTestItems2 = [];
  var _selectedTest2;

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(_testList);
    _dropdownTestItems2 = buildDropdownTestItems(_testList2);
    super.initState();
  }

  List<DropdownMenuItem> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem> buildDropdownTestItems2(List _testList2) {
    List<DropdownMenuItem> items = [];
    for (var i in _testList2) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    setState(() {
      _selectedTest = selectedTest;
    });
  }

  onChangeDropdownTests2(selectedTest2) {
    print(selectedTest2);
    setState(() {
      _selectedTest2 = selectedTest2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DETAIL PRODUK',
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
                              children: const <Widget>[
                                Text(
                                  'Pembalut',
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
                    elevation: 20,
                  ),
                  onPressed: () {},
                )),
          ],
        ),
      ),
    );
  }
}
