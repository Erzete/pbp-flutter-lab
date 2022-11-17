import 'dart:convert';
import 'main.dart';
import 'data.dart';
import 'model.dart' as budget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _judulBudget = "";
    int _nominalBudget = 0;
    String jenisBudget = 'Pilih Jenis';
    List<String> listJenisBudget = ['Pilih Jenis', 'Pemasukan', 'Pengeluaran'];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form'),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  // Menambahkan clickable menu
                  ListTile(
                    title: const Text('counter_7'),
                    onTap: () {
                      // Route menu ke halaman utama
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Tambah Budget'),
                    onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyFormPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Data Budget'),
                    onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyDataPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Judul",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik 
                          onChanged: (String? value) {
                            setState(() {
                              _judulBudget = value!;
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (String? value) {
                            setState(() {
                              _judulBudget = value!;
                            });
                          },
                          // Validator sebagai validasi form
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Judul tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Nominal",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nominal tidak boleh kosong!';
                            }
                            return null;
                          },
                          // Menambahkan behavior saat nama diketik 
                          onChanged: (value) {
                            setState(() {
                              if (value.isNotEmpty) {
                                _nominalBudget = int.parse(value);
                              }
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (value) {
                            setState(() {
                              _nominalBudget = int.tryParse(value!)!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 75,
                        child: DropdownButtonFormField(             
                          value: jenisBudget,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: listJenisBudget.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              jenisBudget = newValue!;
                            });
                          },
                          validator: (String? newValue) {
                            if (newValue == 'Pilih Jenis') {
                              return 'Jenis tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 575),
                      SizedBox(
                        height: 40.0,
                        width: 100.0,  
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              budget.theBudget.add(budget.Budget(_judulBudget, _nominalBudget, jenisBudget));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: Container(
                                      width: 50,
                                      child: ListView(
                                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          Center(child: const Text('Data Disimpan!')),
                                          SizedBox(height: 20),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Kembali'),
                                          ), 
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
    }
}