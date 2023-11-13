import 'package:flutter/material.dart';
import 'package:bp_mart/widgets/shop_card.dart';
import 'package:bp_mart/widgets/left_drawer.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});
  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Daftar Stok Produk di bp-mart',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 81, 46),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: itemList.length,
                itemBuilder: (BuildContext context, int idx) {
                  return ListTile(
                      title: Text(
                        "${idx + 1}. ${itemList[idx].name}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Container(
                        margin: const EdgeInsets.only(left: 22.0),
                        child: Text(
                          """Harga: ${itemList[idx].price}
Jumlah: ${itemList[idx].amount}
Deskripsi: ${itemList[idx].description}
Dibeli dari: ${itemList[idx].purchasedFrom}""",
                          textAlign: TextAlign.left,
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
