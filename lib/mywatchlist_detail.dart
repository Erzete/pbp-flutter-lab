import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'mywatchlist.dart';
import 'mywatchlist_page.dart';
import 'main.dart';
import 'form.dart';
import 'data.dart';

class WatchlistDetail extends StatelessWidget {
  final Mywatchlist mywatchlist;
  const WatchlistDetail({Key? key, required this.mywatchlist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
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
            ListTile(
              title: const Text('Mywatchlist'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WatchlistPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          shrinkWrap: true,
          children: <Widget>[
            Center(
              child: Text(mywatchlist.fields.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ))
            ),
            SizedBox(height: 30,),
            Text.rich(
              style: TextStyle(fontSize: 15),
              TextSpan(
                children: [
                  TextSpan(text: "Release Date: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: mywatchlist.fields.releaseDate),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text.rich(
              style: TextStyle(fontSize: 15),
              TextSpan(
                children: [
                  TextSpan(text: "Rating: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: mywatchlist.fields.rating.toString()),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text.rich(
              style: TextStyle(fontSize: 15),
              TextSpan(
                children: [
                  TextSpan(text: "Status: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: mywatchlist.fields.watched),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text('Review:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            Text(mywatchlist.fields.review),
            SizedBox(height: 335),
            SizedBox(
              height: 40.0,
              width: 50.0,  
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const WatchlistPage()),
                  );
                },
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}