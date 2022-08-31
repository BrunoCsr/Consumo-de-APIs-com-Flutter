import 'dart:convert';

import 'package:flutter/material.dart';

import 'Album.dart';

import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  const SecondPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Future<List<Album>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((albums) => Album.fromJson(albums)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: FutureBuilder<List<Album>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Album>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            height: 75,
                            width: 500,
                            color: Colors.orange,
                            child: Center(
                              child: Text(data[index].title),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        )
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
