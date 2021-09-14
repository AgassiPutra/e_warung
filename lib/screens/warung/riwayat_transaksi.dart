import 'package:flutter/material.dart';

class Transaksi extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text("Transaksi"),
      ),
      body:Container(
        child: listTransaksi()
      )
    );
  }
  Widget listTransaksi(){
    final List<Map> transaksiku =
      List.generate(10, (index) => {
        "id": index,
        "total_harga": "57000",
        "total_pembelian": "19",
        "product": [{
          "id":"2",
          "nama": "Product $index",
          "harga": "3000",
          "jumlah": "4",
        },{
          "id":"3",
          "nama": "Product $index",
          "harga": "3000",
          "jumlah": "6",
        },{
          "id":"4",
          "nama": "Product $index",
          "harga": "3000",
          "jumlah": "9",
        },
        ],
        "waktu_pembelian": "08.00",
        "tanggal": "2 Sept 2021"
      }).toList();
    
    return ListView.separated(
      shrinkWrap:true,
      padding: const EdgeInsets.all(8),
      itemCount: transaksiku.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Text("${transaksiku[index]['tanggal']}",style: TextStyle(fontSize: 14)),
                  Text("${transaksiku[index]['waktu_pembelian']}",style: TextStyle(fontSize: 12))
                ]
              ),
              Divider(),
              ExpansionTile(
                title: Text("3 Produk"),
                children:[
                  ListTile(
                    title: Text(transaksiku[index]["product"][0]["nama"]),
                    leading: Icon(Icons.shopping_cart),
                    subtitle: Text("${transaksiku[index]["product"][0]["jumlah"]} x ${transaksiku[index]["product"][0]["harga"]}"),
                  ),
                  ListTile(
                    title: Text(transaksiku[index]["product"][1]["nama"]),
                    leading: Icon(Icons.shopping_cart),
                    subtitle: Text("${transaksiku[index]["product"][1]["jumlah"]} x ${transaksiku[index]["product"][1]["harga"]}"),
                  ),
                  ListTile(
                    title: Text(transaksiku[index]["product"][2]["nama"]),
                    leading: Icon(Icons.shopping_cart),
                    subtitle: Text("${transaksiku[index]["product"][2]["jumlah"]} x ${transaksiku[index]["product"][2]["harga"]}"),
                  ),
                ]
              )
            ]
          )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}