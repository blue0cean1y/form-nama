import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form EMAIL',
      home: Scaffold(
        appBar: AppBar(
          title: Text('email dan password'),
        ),
        body: FormScreen(),
      ),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaDepanController = TextEditingController();
  final _namaBelakangController = TextEditingController();

  @override
  void dispose() {
    _namaDepanController.dispose();
    _namaBelakangController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _namaDepanController,
              decoration: InputDecoration(labelText: 'nama depan'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'nama depan tidak boleh kosong';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _namaBelakangController,
              decoration: InputDecoration(labelText: 'nama belakang'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'nama belakang tidak boleh kosong';
                }

                return null;
              },
            ),
            SizedBox(height: 20, width: 30,),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('form sudah benar!')),
                    );
                  }
                },
                child: Text('tambah')),
          ],
        ),
      ),
    );
  }
}
