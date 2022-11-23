import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'mywatchlist.dart';
import 'main.dart';
import 'form.dart';
import 'data.dart';
import 'mywatchlist_detail.dart';

class WatchlistPage extends StatefulWidget {
    const WatchlistPage({Key? key}) : super(key: key);

    @override
    _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
    Future<List<Mywatchlist>> fetchWatchlist() async {
        var url = Uri.parse('https://tugas3-rt.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
          url,
          headers: {
              "Access-Control-Allow-Origin": "*",
              "Content-Type": "application/json",
          },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object ToDo
        List<Mywatchlist> listWatchlist = [];
        for (var d in data) {
          if (d != null) {
              listWatchlist.add(Mywatchlist.fromJson(d));
          }
        }

        return listWatchlist;
    }
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: const Text('Mywatchlist'),
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
          body: FutureBuilder(
              future: fetchWatchlist(),
              builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                  } else {
                  if (!snapshot.hasData) {
                      return Column(
                      children: const [
                            Text(
                            "Tidak ada Watchlist",
                            style: TextStyle(
                                color: Color(0xff59A5D8),
                                fontSize: 20),
                            ),
                            SizedBox(height: 8),
                        ],
                      );
                  } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index)=> Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                          padding: const EdgeInsets.all(1),
                          child: Container (
                            width: 100,
                            height: 65,
                            child: Card(
                              child: ListTile(
                                title: Text("${snapshot.data[index].fields.title}"),
                                onTap: (){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WatchlistDetail(mywatchlist: snapshot.data[index],)));
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                  }
                  }
              }
          )
      );
    }
}