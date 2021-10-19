import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_warung/env.dart';

//AppForm untuk TextField CRUD pada Produk

// ignore: must_be_immutable
class AppFormProduk extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController;
  TextEditingController hbController;
  TextEditingController hjController;
  TextEditingController stokController;

  // ignore: use_key_in_widget_constructors
  AppFormProduk(
      {required this.formKey,
      required this.nameController,
      required this.hbController,
      required this.hjController,
      required this.stokController});

  @override
  _AppFormProduk createState() => _AppFormProduk();
}

class _AppFormProduk extends State<AppFormProduk> {
  var selectedValue;
  List categoryItemList = [];

  Future getAllCategory() async {
    final response =
        await http.get(Uri.parse("${Env.URL_PREFIX}/list_kategori.php"));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemList = jsonData;
      });
    }
  }

  final List _testList3 = [
    {'keyword': 'Semua'},
    {'keyword': 'Pcs'},
    {'keyword': 'Kg'},
    {'keyword': 'Paket'},
  ];
  List<DropdownMenuItem> _dropdownTestItems3 = [];
  var _selectedTest3;

  @override
  void initState() {
    getAllCategory();
    _dropdownTestItems3 = buildDropdownTestItems3(_testList3);
    super.initState();
  }

  List<DropdownMenuItem> buildDropdownTestItems3(List _testList3) {
    List<DropdownMenuItem> items = [];
    for (var i in _testList3) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  onChangeDropdownTests2(value) {
    print(value);
    setState(() {
      selectedValue = value;
    });
  }

  onChangeDropdownTests3(selectedTest3) {
    print(selectedTest3);
    setState(() {
      _selectedTest3 = selectedTest3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: widget.nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama Produk',
              ),
              style: const TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: widget.hbController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Harga Beli',
              ),
              style: const TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: widget.hjController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Harga Jual',
              ),
              style: const TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: widget.stokController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Stok',
              ),
              style: const TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: const Text('Pilih Kategori',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
              value: selectedValue,
              items: categoryItemList.map((kategori) {
                return DropdownMenuItem(
                    value: kategori['nama'], child: Text(kategori['nama']));
              }).toList(),
              onChanged: onChangeDropdownTests2,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: const Text('Pilih Satuan',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
              value: _selectedTest3,
              items: _dropdownTestItems3,
              onChanged: onChangeDropdownTests3,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
