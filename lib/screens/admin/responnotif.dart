import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'dart:math';

class Respon extends StatelessWidget {
  final myProducts = List<String>.generate(20, (i) => 'Nama Produk $i');
  final _formKey = GlobalKey<FormState>();
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(' DETAIL NOTIFIKASI',
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.store,
                        size: 50,
                      ),
                      title: Text(
                        'Nama Warung',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                      subtitle: Text(
                          'Warung x meminta penambahan stok pada produk y',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: myProducts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      key: UniqueKey(),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                leading: Icon(Icons.store,
                                    color: Colors.blue, size: 50),
                                title: Text('${myProducts[index]}',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400)),
                                subtitle: Text(
                                  'Stok yang diminta : ${random.nextInt(100)}',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () => {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text('Alasan',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            content: const TextField(
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: 'Tulis alasan'),
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Batal'),
                                                child: const Text('Batal'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      },
                                      icon: const Icon(Icons.cancel),
                                      iconSize: 30,
                                      color: Colors.red,
                                    ),
                                    IconButton(
                                      onPressed: () => {},
                                      icon: const Icon(Icons.check_circle),
                                      iconSize: 30,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}
