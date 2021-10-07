import 'dart:convert';

import 'package:e_warung/models/product.dart';
import 'package:e_warung/screens/admin/appformproduk.dart';
import 'package:e_warung/screens/admin/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:e_warung/env.dart';

import 'katalog.dart';

class UpdateProduk extends StatefulWidget {
  late final Produk produk;
  UpdateProduk({required this.produk});
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<UpdateProduk> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController hbController = TextEditingController();
  TextEditingController hjController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  Future editProduk() async {
    return await http.post(
      Uri.parse("${Env.URL_PREFIX}/update.php"),
      body: {
        "id": widget.produk.id.toString(),
        "nama": nameController.text,
        "harga_beli": hbController.text,
        "harga_jual": hjController.text,
        "stok": stokController.text,
      },
    );
  }

  void deleteProduk(context) async {
    await http.post(
      Uri.parse("${Env.URL_PREFIX}/delete.php"),
      body: {
        'id': widget.produk.id.toString(),
      },
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    ).then((value) => setState(() {}));
  }

  void confirmDeleteProduk(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Yakin ingin menghapus produk ini ?'),
          actions: <Widget>[
            RaisedButton(
              child: Icon(Icons.cancel),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            RaisedButton(
              child: Icon(Icons.check_circle),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => deleteProduk(context),
            ),
          ],
        );
      },
    );
  }

  void _onConfirm(context) async {
    await editProduk();
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(content: Text('Data Berhasil Diubah')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    ).then((value) => setState(() {}));
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.produk.nama);
    hbController = TextEditingController(text: widget.produk.harga_beli);
    hjController = TextEditingController(text: widget.produk.harga_jual);
    stokController = TextEditingController(text: widget.produk.stok);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'UPDATE PRODUK',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                confirmDeleteProduk(context);
              },
            )
          ],
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              AppFormProduk(
                  formKey: formKey,
                  nameController: nameController,
                  hbController: hbController,
                  hjController: hjController,
                  stokController: stokController),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: const Text('Simpan',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700)),
                    onPressed: () {
                      _onConfirm(context);
                    },
                  )),
            ],
          ),
        ));
  }
}
