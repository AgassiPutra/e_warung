import 'package:flutter/material.dart';

//AppForms untuk TextField CRUD Kategori

// ignore: must_be_immutable
class AppForm extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController;

  // ignore: use_key_in_widget_constructors
  AppForm({required this.formKey, required this.nameController});

  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Kategori',
            ),
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
    ;
  }
}
