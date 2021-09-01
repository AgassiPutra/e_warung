import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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
                padding: const EdgeInsets.all(8.0),
                child: const Padding(
                  padding: EdgeInsets.all(50.0),
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
            Card(
              child: Container(
                padding:EdgeInsets.all(10.0),
                child :Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.shopping_bag),
                    Column(children: [Text('Penjualan',style: TextStyle(color: Colors.grey)),Text('Sep 2021')],),
                    Text('Rp.12.000',),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
              )
            ),
          ])
        ));
  }
}

