import 'package:flutter/material.dart';

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
  final List _kategori = [
    {'no': 1, 'keyword': 'Semua'},
    {'no': 2, 'keyword': 'Sayur'},
    {'no': 3, 'keyword': 'Daging'},
    {'no': 4, 'keyword': 'Buah'},
    {'no': 5, 'keyword': 'Kerajinan'}
  ];
  List<DropdownMenuItem> _dropdownkategori = [];
  var _selectedkategori;

  final List _testList3 = [
    {'no': 1, 'keyword': 'Semua'},
    {'no': 2, 'keyword': 'Pcs'},
    {'no': 3, 'keyword': 'Kg'},
    {'no': 4, 'keyword': 'Paket'},
  ];
  List<DropdownMenuItem> _dropdownTestItems3 = [];
  var _selectedTest3;

  @override
  void initState() {
    _dropdownkategori = buildDropdownTestItems(_kategori);
    _dropdownTestItems3 = buildDropdownTestItems(_testList3);
    super.initState();
  }

  List<DropdownMenuItem> buildDropdownTestItems(List _kategori) {
    List<DropdownMenuItem> items = [];
    for (var i in _kategori) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
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

  onChangeDropdownTests(selectedkategori) {
    print(selectedkategori);
    setState(() {
      _selectedkategori = selectedkategori;
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
              value: _selectedkategori,
              items: _dropdownkategori,
              onChanged: onChangeDropdownTests,
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
              onChanged: onChangeDropdownTests,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
