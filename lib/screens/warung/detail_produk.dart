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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Detail Produk"),
        ),
        body: Container(
            // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Rp. ${widget.produk.hargaJual}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              SizedBox(height: 10),
              Text("${widget.produk.nama}"),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    width: 125,
                    // height:45,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            // expands:true,
                            controller: TextEditingController()
                              ..text = '$_counter',
                            onChanged: (text) {
                              _counter = int.parse(text);
                              text = "$_counter";
                            },
                            textAlignVertical: TextAlignVertical.center,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            keyboardType: TextInputType.number,
                          )),
                          IconButton(
                              iconSize: 18,
                              onPressed: () {
                                setState(() {
                                  _counter++;
                                });
                              },
                              icon: Icon(Icons.add, color: Colors.blue)),
                        ]))
              ])
            ]),
          ),

          // // Deskripsi Produk
          // Text("Deskripsi Produk",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          // SizedBox(height: 15,),
          // Text('''
          //   Apel mengandung flavonoids, fruktosa dan serat. Jika dihitung dalam 100 g buah apel, terdapat kandungan serta sebesar 2,1 g. Bila kulitnya kita kupas, kandungan serat tersebut masih tetap tinggi.

          //   Pada kulit buah apel yang telah terkupas, kandungan serat yang tersisa berkisar 1,9 g. Menurut penelitian, serat buah ini mampu menurunkan kadar kolesterol darah dan resiko penyakit jantung koroner.
          //   ''',maxLines: 20, softWrap: true)
        ])));
  }
}
