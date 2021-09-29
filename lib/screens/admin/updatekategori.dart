import 'dart:convert';

import 'package:e_warung/models/kategori.dart';
import 'package:e_warung/screens/admin/appform.dart';
import 'package:e_warung/screens/admin/katalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:e_warung/env.dart';

class UpdateKategori extends StatefulWidget {
  final Kategori kategori;
  UpdateKategori({required this.kategori});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<UpdateKategori> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  Future editKategori() async {
    return await http.post(
      Uri.parse("${Env.URL_PREFIX}/update_kategori.php"),
      body: {
        "id": widget.kategori.id.toString(),
        "nama": nameController.text,
      },
    );
  }

  void deleteKategori(context) async {
    await http.post(
      Uri.parse("${Env.URL_PREFIX}/delete_kategori.php"),
      body: {
        'id': widget.kategori.id.toString(),
      },
    );
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()),
        (Route<dynamic> route) => false);
  }

  void confirmDeleteKategori(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Yakin ingin menghapus kategori ini ?'),
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
              onPressed: () => deleteKategori(context),
            ),
          ],
        );
      },
    );
  }

  void _onConfirm(context) async {
    await editKategori();
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: const Text('Data Berhasil Diubah')),
    );
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.kategori.nama);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('UPDATE KATEGORI',
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                confirmDeleteKategori(context);
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
                child:
                    AppForm(formKey: formKey, nameController: nameController),
              ),
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
