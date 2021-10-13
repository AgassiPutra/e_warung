import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_warung/screens/warung/detail_produk_warung.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:e_warung/models/warung/stok_warung.dart';
import 'package:e_warung/env.dart';

class ListWarungProduk extends StatefulWidget {
  const ListWarungProduk({ Key? key }) : super(key: key);

  @override
  _ListWarungProdukState createState() => _ListWarungProdukState();
}

class _ListWarungProdukState extends State<ListWarungProduk> {
  late Future<List<StokWarungModels>> stokWarung;

  @override
  void initState(){
    super.initState();
    stokWarung = getStokWarung();
    refresh();
  }

  refresh(){
    setState((){});
  }


  Future<List<StokWarungModels>> getStokWarung() async{
    final response = await http.get(Uri.parse("${Env.URL_PREFIX}/stok-warung?w=1"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<StokWarungModels> stokWarung = items.map<StokWarungModels>((json){
      return StokWarungModels.fromJson(json);
    }).toList();

    return stokWarung;
  }  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Stok Warungg',
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            buildListViewbyIndex(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildListViewbyIndex() {
     return FutureBuilder<List<StokWarungModels>>(
      future: stokWarung,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        // List<Produk> produk = snapshot.data.produk;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            var data = snapshot.data[index];
            return Container(
                height: 100,
                child: Card(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: Container(
                              height: double.infinity, child: Icon(Icons.store)),
                          title: Text('${data.namaProduk}',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400)),
                          subtitle: Text(
                            'Stok : ${data.sisaStok}',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailProduk(produk: data)),
                                );
                              },
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                              iconSize: 30,
                              color: Colors.grey,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ));
          });
      }
    );
    
  }
}

