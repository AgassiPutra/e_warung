import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class WarungProduk extends StatelessWidget {
  final myProducts = List<String>.generate(20, (i) => 'Product $i');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(' LIST PRODUK',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
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
                    leading: Icon(Icons.store, size: 50),
                    title: Text(
                      'Nama Warung',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 40),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: myProducts.length,
                itemBuilder: (context, index) {
                  return Card(
                    key: UniqueKey(),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(myProducts[index],
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400))),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
