import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget{
  const DetailProduk({Key? key}) : super(key: key);

  @override
  _DetailProdukState createState() => _DetailProdukState();
}
class _DetailProdukState extends State<DetailProduk>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text("Detail Produk"),
      ),
      body:Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row( // Foto dan Nama Produk
              children: [
                Expanded(
                  flex: 2,
                  child: Container(height: 68,decoration: BoxDecoration(color:Colors.pink,borderRadius: BorderRadius.all(Radius.circular(10))), child: Icon(Icons.production_quantity_limits,size:45,color:Colors.white))
                ),
                Expanded(
                  flex:8,
                  child: Container(padding: EdgeInsets.only(left:15),child: Text("Buah Apel",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16)))
                )
              ]
            ),
            SizedBox(height:15),
            // Spesifikasi produk
            Row(
              children: [
                Expanded(
                  flex:4,
                  child:Text("Penjualan")
                ),
                Expanded(
                  flex:6,
                  child: Text("per Paket"),
                )
              ]
            ),
            Divider(height: 20,thickness: 1,),
            Row(
              children: [
                Expanded(
                  flex:4,
                  child:Text("Kategori")
                ),
                Expanded(
                  flex:6,
                  child: GestureDetector(onTap: (){}, child: Text("Buah",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue))),
                )
              ]
            ),
            Divider(height: 20,thickness: 1,),
            // END|| Spesifikasi Produk
            // Deskripsi Produk
            Text("Deskripsi Produk",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            SizedBox(height: 15,),
            Text('''
              Apel mengandung flavonoids, fruktosa dan serat. Jika dihitung dalam 100 g buah apel, terdapat kandungan serta sebesar 2,1 g. Bila kulitnya kita kupas, kandungan serat tersebut masih tetap tinggi.
              
              Pada kulit buah apel yang telah terkupas, kandungan serat yang tersisa berkisar 1,9 g. Menurut penelitian, serat buah ini mampu menurunkan kadar kolesterol darah dan resiko penyakit jantung koroner.
              ''',maxLines: 20, softWrap: true)
          ]
        )
      )
    );
  }
}