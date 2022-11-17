import 'main.dart';
import 'form.dart';
import 'model.dart' as budget;
import 'package:flutter/material.dart';

class MyDataPage extends StatefulWidget {
    const MyDataPage({super.key});

    @override
    State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
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
      body: ListView.builder(
        itemCount: budget.theBudget.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(3),
                boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 0.5,
                )
                ]
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                    "${budget.theBudget[index].judul}",
                    style: const TextStyle(
                    fontSize: 18.0,
                    ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("${budget.theBudget[index].nominal}"),
                    Expanded(child: Container()),
                    Text("${budget.theBudget[index].tipe}"),
                  ],
                ),
                ],
            ),
          );
        }
      ),
    );
  }

}