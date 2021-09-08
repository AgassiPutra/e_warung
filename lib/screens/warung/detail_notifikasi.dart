import 'package:flutter/material.dart';
import 'dart:math';
class DetailNotifikasi extends StatefulWidget{
  const DetailNotifikasi({Key? key}) : super(key: key);

  @override
  _DetailNotifikasiState createState() => _DetailNotifikasiState();
}
class _DetailNotifikasiState extends State<DetailNotifikasi>{
  
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permintaan Tambah Produk"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:EdgeInsets.all(10),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning_amber_rounded,size:35),
                  SizedBox(height:10),
                  Text("Pesan Masuk",style:TextStyle(color: Colors.grey,fontSize: 16)),
                  Text("03 September 2021 - 02.04 AM",style:TextStyle(color: Colors.grey,fontSize: 14)),
                ]
              )
            ),
            Divider(thickness:1,height:2),
            // isi pesan
            Container(
              padding: EdgeInsets.all(10),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Permintaan Tambah Produk",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("8 dari 10 produk telah ditambahkan"),
                ],
              )
            ),
            Expanded(child: listProductConfirmed())
          ]
        )
      )
    );
  }
  Widget listProductConfirmed(){
    final List<Map> products = List.generate(
      10, //length
      (index) => {
        "id":index,
        "product_name":"Product $index",
        "stok": Random().nextInt(300),
        "is_confirmed": 0,
        "message": "Stok sedang kosong"
      }
    );
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index){
        return Card(
          child:ListTile(
            leading: Icon(Icons.message), // diganti dengan gambar produk
            title: Text("${products[index]['product_name']}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Stok ditambah: ${products[index]['stok']}"),
                if(products[index]['is_confirmed'] == 0) Text("Alasan: ${products[index]["message"]}")
            ]),
            trailing: ((){if(products[index]['is_confirmed'] == 1){return Text("Diterima",style:TextStyle(color:Colors.green));}else{return Text("Ditolak",style:TextStyle(color:Colors.red));}}()) ,
          )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}