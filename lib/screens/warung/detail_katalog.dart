import 'package:e_warung/models/warung/katalog.dart';
import 'package:flutter/material.dart';

class DetailKatalog extends StatefulWidget {
  late final KatalogModels produk;
  DetailKatalog({required this.produk});

  @override
  _DetailKatalogState createState() => _DetailKatalogState();
}

class _DetailKatalogState extends State<DetailKatalog> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Detail Produk"),
        ),
        body: Stack(children: [
          Container(
              // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(children: [
                  Expanded(
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                          ),
                          child: Icon(Icons.production_quantity_limits,
                              size: 45, color: Colors.white)))
                ]),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rp. ${widget.produk.hargaJual}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        SizedBox(height: 10),
                        Text("${widget.produk.nama}"),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  width: 125,
                                  // height:45,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(color: Colors.grey)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                              textAlign: TextAlign.center,
                                          controller: TextEditingController()
                                            ..text = '$_counter',
                                          onChanged: (text) {
                                            _counter = int.parse(text);
                                            text = "$_counter";
                                          },
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                          keyboardType: TextInputType.number,
                                        )),
                                        IconButton(
                                            iconSize: 18,
                                            onPressed: () {
                                              setState(() {
                                                _counter++;
                                              });
                                            },
                                            icon: Icon(Icons.add,
                                                color: Colors.blue)),
                                      ]))
                            ])
                      ]),
                ),
                Divider(
                  thickness: 10,
                  color: Colors.grey[200],
                  height: 2,
                ),
                // Deskripsi Produk
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("Deskripsi Produk",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Kategori",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(widget.produk.kategori)
                          ]),
                      Divider(thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Satuan",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.produk.satuan)
                        ],
                      ),
                      Divider(thickness: 1),
                    ],
                  ),
                )
              ])),
          Positioned(
            bottom: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: screenSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 5,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: Text("Pesan Langsung",
                                style: TextStyle(color: Colors.blue)))),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 5,
                      child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          child: Text("+ Keranjang",
                              style: TextStyle(color: Colors.white))),
                    )
                  ],
                )),
          )
        ]));
  }
}
