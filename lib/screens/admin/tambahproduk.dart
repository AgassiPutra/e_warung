import 'dart:convert';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<AddProduct> {
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
        title: const Text('TAMBAH PRODUK',
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
                    labelText: 'Nama Produk',
                  ),
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                  controller: hargaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Harga Jual',
                  ),
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
            ),
            Container(
                padding: EdgeInsets.all(8),
                child: Card(
                    child: DropdownButtonFormField(
                  isExpanded: true,
                  hint: const Text('Pilih Merk',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                  value: _selectedTest2,
                  items: _dropdownTestItems2,
                  onChanged: onChangeDropdownTests2,
                ))),
            Container(
                padding: EdgeInsets.all(8),
                child: Card(
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    hint: const Text('Pilih Kategori',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400)),
                    value: _selectedTest,
                    items: _dropdownTestItems,
                    onChanged: onChangeDropdownTests,
                  ),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                  controller: stokController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Stok',
                  ),
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextButton(
                  child: Text('Tambah',
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
