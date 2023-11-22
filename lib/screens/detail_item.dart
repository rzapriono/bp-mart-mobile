import 'package:flutter/material.dart';
import 'package:bp_mart/models/item.dart';
import 'package:bp_mart/widgets/left_drawer.dart';

class DetailItemPage extends StatefulWidget {
  final Item item;

  const DetailItemPage({super.key, required this.item});

  @override
  State<DetailItemPage> createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Detail Item',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 81, 46),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Item Name:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.item.fields.name,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Amount: ${widget.item.fields.amount}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Price: ${widget.item.fields.price}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Description: ${widget.item.fields.description}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Purchased From: ${widget.item.fields.purchasedFrom}',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ketika tombol ditekan
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
