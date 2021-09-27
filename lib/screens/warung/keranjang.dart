import 'package:flutter/material.dart';

class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  bool isWeekend = true;
  List<Map> keranjangku = List.generate(
        4,
        (index) => {
              "id": index,
              "product_name": "Product $index",
              "harga": "${index + 1}.000",
              "stok": 5,
              "max_stok":10
            });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(child: listKeranjang()),
              Row(children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          if (isWeekend){
                            showDialog(
                            context: context, 
                            builder: (BuildContext context){
                              return AlertDialog(
                                title:Text("Apakah anda ingin melanjutkan pemesanan?"),
                                content: Text("Pesanan tetap terkirim namun respon admin mungkin sedikit lambat"),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    }, 
                                    child: Text("Batal")
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      showDialog(
                                        context: context, 
                                        builder: (BuildContext context){
                                          return AlertDialog(
                                            title:Text("Pesanan Sedang Diproses"),
                                            content: Text("Silahkan tunggu hingga admin menyetujui"),
                                            actions: [
                                              TextButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                }, 
                                                child: Text("OK")
                                              ),
                                            ]
                                          );
                                        });
                                    }, 
                                    child: Text("Lanjutkan")
                                  ),
                                ]
                              );
                            });
                          }else{
                            showDialog(
                              context: context, 
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title:Text("Pesanan Sedang Diproses"),
                                  content: Text("Silahkan tunggu hingga admin menyetujui"),
                                  actions: [
                                    TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }, 
                                      child: Text("OK")
                                    ),
                                  ]
                                );
                              });
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        child: Text("Pesan Sekarang")))
              ])
            ],
          )),
    );
  }

  Widget listKeranjang() {
    return ListView.separated(
      itemCount: keranjangku.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text(keranjangku[index]['product_name']),
                    subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(keranjangku[index]['harga']),
                          Row(children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete, color: Colors.red)),
                            buttonAddMinus(
                              counter: keranjangku[index]['stok'],
                              onAdd: (){
                                setState((){
                                  ++keranjangku[index]['stok'];
                                });
                              },
                              onMinus: (){
                                if(keranjangku[index]['stok'] != 0){
                                  setState((){
                                  --keranjangku[index]['stok'];
                                  });
                                }
                              },
                              onChanged: (text){
                                setState((){
                                  keranjangku[index]['stok'] = int.parse(text);
                                });
                              }
                            )
                          ])
                        ]))));
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }

  Widget buttonAddMinus({Function? onAdd, Function? onMinus,Function(String)? onChanged,required int counter}) {
    final _textController = TextEditingController();
    
    return Container(
        width: 130,
        height: 60,
        child: Row(children: [
          IconButton(
              onPressed: () => onMinus!(),
              icon: Icon(Icons.remove,
                  color: (() {
                    if (counter == 0) {
                      return Colors.grey;
                    } else {
                      return Colors.blue;
                    }
                  }()))),
          Expanded(
              child: TextField(
            // expands:true,
            textAlign: TextAlign.center,
            controller: _textController..text = counter.toString(),
            onChanged: onChanged,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(border: InputBorder.none),
            keyboardType: TextInputType.number,
          )),
          IconButton(
              onPressed: ()=> onAdd!(),
              icon: Icon(Icons.add,
                color: (() {
                    if (counter == 0) {
                      return Colors.grey;
                    } else {
                      return Colors.blue;
                    }
                  }()))
          ),
        ]));
  }
}
