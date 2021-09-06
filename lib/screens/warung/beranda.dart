import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Beranda',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
              )
            ],
          )
        ),
        body: Column(
          children:[
            buttonPenjualan(),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Fitur',style: TextStyle(fontSize: 20)),
                  Text('Permudah kelola warung anda dengan fitur pilihan',style: TextStyle(fontSize: 12,color: Colors.grey))
                ],
              ),
            ),
            Container(
              padding:EdgeInsets.fromLTRB(10, 15, 10, 20),
              child:Card(
                child:Container(
                  padding: EdgeInsets.all(10),
                  child:Column(
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.add_shopping_cart),
                          Container(
                            width: 225,
                            height:70,
                            child:Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text('Tambah Produk Anda',style:TextStyle(fontSize:14)),
                                Text('Isi stok produk anda dengan produk baru dari Perumda Tunas',style:TextStyle(color:Colors.grey,fontSize:12)),
                              ]
                            ),
                          ),   
                          Icon(Icons.arrow_forward_ios),
                        ]
                      ),
                      Divider(
                        height:5,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.iso),
                          Container(
                            width: 225,
                            height:70,
                            child:Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text('Atur Batas minimal stok',style:TextStyle(fontSize:14)),
                                Text('Batasi minimal stok untuk mendapatkan notif jika stok menipis',style:TextStyle(color:Colors.grey,fontSize:12)),
                              ]
                            ),
                          ),   
                          Icon(Icons.arrow_forward_ios),
                        ]
                      ),
                      Divider(
                        height:5,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.receipt_long),
                          Container(
                            width: 225,
                            height:70,
                            child:Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text('Lihat Transaksi',style:TextStyle(fontSize:14)),
                                Text('Pantau hasil penjualan anda per harinya',style:TextStyle(color:Colors.grey,fontSize:12)),
                              ]
                            ),
                          ),   
                          Icon(Icons.arrow_forward_ios),
                      ],)
                    ]
                  )
                )
              )
            ),
            
          ])
        ));
  }
  Widget buttonPenjualan(){
    return Card(
              child: Container(
                padding:EdgeInsets.all(10.0),
                child :Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.shopping_bag),
                    Column(children: [Text('Penjualan',style: TextStyle(color: Colors.grey)),Text('Sep 2021')],),
                    Text('Rp.12.000',),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
              ),
              margin: EdgeInsets.fromLTRB(10, 20, 10, 30),
            );
  }
}

