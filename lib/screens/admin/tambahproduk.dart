import 'package:e_warung/screens/admin/appformproduk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController hbController = TextEditingController();
  TextEditingController hjController = TextEditingController();
  TextEditingController stokController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('TAMBAH PRODUK',
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Container(
              height: 200.0,
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Stack(fit: StackFit.loose, children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: ExactAssetImage('assets/tunas.png'),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ],
                      ),
                    ]),
                  )
                ],
              ),
            ),
            AppFormProduk(
                formKey: formKey,
                nameController: nameController,
                hbController: hbController,
                hjController: hjController,
                stokController: stokController),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextButton(
                  child: const Text('Tambah',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    elevation: 20,
                  ),
                  onPressed: () {},
                )),
          ],
        ));
  }
}
