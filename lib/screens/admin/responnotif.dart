import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Respon extends StatelessWidget {
  final myProducts = List<String>.generate(20, (i) => 'Nama Produk $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(' RESPON NOTIFIKASI'),
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
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      subtitle: Text(
                          'Warung x meminta penambahan stok pada produk y'),
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
                                title: Text('${myProducts[index]}'),
                                subtitle: Text(
                                  'Stok yang diminta : x',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () => {},
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
