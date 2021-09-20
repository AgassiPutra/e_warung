import 'package:flutter/material.dart';

class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
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
                        onPressed: () {},
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
    List<Map> keranjangku = List.generate(
        4,
        (index) => {
              "id": index,
              "product_name": "Product $index",
              "harga": "${index + 1}.000",
              "stok": 5
            });

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
                                counter: keranjangku[index]['stok'], max: 10)
                          ])
                        ]))));
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }

  Widget buttonAddMinus({required int counter, int? max}) {
    int _counter = 0;
    return Container(
        width: 130,
        height: 60,
        child: Row(children: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (counter != 0) {
                    _counter = counter - 1;
                  }
                });
              },
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
            controller: TextEditingController()..text = '$counter',
            onChanged: (text) {
              counter = int.parse(text);
              text = "$   counter";
            },
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(border: InputBorder.none),
            keyboardType: TextInputType.number,
          )),
          IconButton(
              onPressed: () {
                setState(() {
                  if (counter != max) {
                    counter++;
                  }
                });
              },
              icon: Icon(Icons.add,
                  color: (() {
                    if (counter == max) {
                      return Colors.grey;
                    } else {
                      return Colors.blue;
                    }
                  }()))),
        ]));
  }
}
