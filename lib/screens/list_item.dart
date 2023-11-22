import 'package:flutter/material.dart';
import 'package:bp_mart/screens/detail_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bp_mart/models/item.dart';
import 'package:bp_mart/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Item>> fetchProduct(CookieRequest request) async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
//     final response = await request.postJson(
//                                 "http://127.0.0.1:8000/auth/get-item/",
//                                 jsonEncode(<String, String>{
//                                     'name':'bait',
//                                 }));
    var url = Uri.parse('http://127.0.0.1:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Item.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'List Item',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 16, 81, 46),
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(request),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data item.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${index + 1}. ${snapshot.data![index].fields.itemName}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("${snapshot.data![index].fields.amount}"),
                                const SizedBox(height: 10),
                                Text(
                                    "${snapshot.data![index].fields.description}"),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailItemPage(
                                            item: snapshot.data![index]),
                                      ),
                                    );
                                  },
                                  child: const Text('Detail Item'),
                                )
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
