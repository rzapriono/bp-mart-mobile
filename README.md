# Tugas 7
<hr>

## Implementasi Checklist
### Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
1. Buka cmd dan masuk ke direktori tempat proyek flutter yang baru akan disimpan (direktori `bp-mart-mobile`).
2. Generate proyek Flutter baru dengan nama `bp_mart`.
```flutter
flutter create bp_mart
```
3. Setelah proses generate berhasil, buatlah file baru pada direktori `bp_mart/lib` dengan nama `menu.dart`, dan tambahkan kode berikut:
```flutter
import 'package:flutter/material.dart';
```
4. Ubah kode pada `main.dart` yang tergenerate secara default. Pindahkan baris ke-39 hingga akhir ke `menu.dart`
```
class MyHomePage ... {
    ...
}

class _MyHomePageState ... {
    ...
}
```
4. Ubah kode `main.dart` pada baris ke-34 yang tadinya `home: const MyHomePage(title: 'Flutter Demo Home Page')` menjadi:
```
...
home: MyHomePage(),
...
```
5. Import class `MyHomePage` pada `main.dart` karena class tersebut sudah dipindahkan ke `menu.dart`.
```
import 'package:bp_mart/menu.dart';
```
6. Ubah `colorScheme` pada file `main.dart` di bagian tema aplikasi yang memiliki tipe `Material Color`.
```
...
colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
...
```

### Membuat tiga tombol sederhana dengan ikon dan teks, serta Memunculkan `Snackbar` 
__Tombol-tombol yang dibuat akan berfungsi untuk:__
- Melihat daftar item (`Lihat Item`)
- Menambah item (`Tambah Item`) 
- Logout (`Logout`)

__Sementara itu, `Snackbar` yang dibuat akan memunculkan:__
- "Kamu telah menekan tombol Lihat Item" ketika tombol `Lihat Item` ditekan.
- "Kamu telah menekan tombol Tambah Item" ketika tombol `Tambah Item` ditekan.
- "Kamu telah menekan tombol Logout" ketika tombol `Logout` ditekan.

__Step by Step yang harus dilakukan:__
1. Ubah sifat widget pada halaman menu menjadi `stateless` dengan mengubah class `MyHomePage` pada `menu.dart`.
```
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 81, 46),
        title: const Text(
          'Stok Produk',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'bp-mart', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
2. Tambahkan sebuah class baru bernama `ShopItem` pada file `menu.dart`.
```
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```
3. Pada class `MyHomePage` di `menu.dart`, tambahkan kode berikut dibagian bawah dari `MyHomePage({Key? key}) : super(key: key);`
```
final List<ShopItem> items = [
  ShopItem(
      "Lihat Produk", Icons.checklist, const Color.fromRGBO(59, 82, 73, 1)),
  ShopItem("Tambah Produk", Icons.add_shopping_cart,
      const Color.fromRGBO(81, 152, 114, 1)),
  ShopItem("Logout", Icons.logout, const Color.fromRGBO(164, 180, 148, 1)),
];
```
4. Buat class baru bernama `ShopCard` pada `menu.dart`.
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

### Bonus: mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout).
__Kode-kode berikut ini digunakan untuk mengerjakan bonus agar warna setiap tombol berbeda.__
<br>
Pada class `MyHomePage`:
```
final List<ShopItem> items = [
  ShopItem(
      "Lihat Produk", Icons.checklist, const Color.fromRGBO(59, 82, 73, 1)),
  ShopItem("Tambah Produk", Icons.add_shopping_cart,
      const Color.fromRGBO(81, 152, 114, 1)),
  ShopItem("Logout", Icons.logout, const Color.fromRGBO(164, 180, 148, 1)),
];
```

Pada class `ShopCard`:
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
...
```

Pada class `ShopItems`:
```
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```

Setelah mengerjakan step by step dan bonus di atas, tampilan dari aplikasi flutter yang telah dibuat akan terlihat seperti berikut.

<img width="1280" alt="Screenshot 2023-11-06 105128" src="https://github.com/rzapriono/bp-mart-mobile/assets/107228573/9c61a81d-8604-4b11-aad0-d95024aacaa5">


## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Stateless dan stateful widget adalah dua jenis widget yang digunakan dalam pengembangan aplikasi Flutter. Perbedaan utama antara keduanya terletak pada bagaimana widget tersebut mengelola dan merespons perubahan data atau state (keadaan) pada aplikasi Flutter.

1. Stateless widget:
- Merupakan widget yang tidak memiliki "keadaan" atau internal state, sehingga tidak dapat berubah atau disebut dengan statis.
- Hanya merender tampilan berdasarkan properti yang diberikan pada saat widget dibuat dan tidak dapat mengalami perubahan sepanjang life cycle widget tersebut.
- Biasanya digunakan untuk membuat elemen yang bersifat statis dalam suatu aplikasi, seperti teks, ikon, dan beberapa tampilan lain yang tidak memerlukan perubahan.

2. Stateful widget:
- Merupakan widget yang dapat memiliki internal state atau "keadaan" yang dapat berubah secara dinamis selama life cycle widget tersebut.
- Digunakan ketika tampilan widget memerlukan perubahan berdasarkan interaksi pengguna, perubahan data, atau keadaan lainnya.
- Memiliki method `setState` untuk memperbaru tampilan widget saat internal state nya berubah.
- Terdiri dari dua bagian, yakni widget itu sendiri dan objek state yang mengelola data yang dapat mengalami perubahan.
- Widget akan dirender ulang ketika state berubah.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- `MaterialApp`: Widget root dalam aplikasi Flutter. Hanya terdapat satu MaterialApp, yang berfungsi untuk membungkus aplikasi flutter dan biasanya dibuat di dalam fungsi main. MaterialApp mengatur navigasi dan tema dalam aplikasi. 

- `Scaffold`: Kerangka dasar visual untuk membangun tampilan dalam aplikasi Flutter. Scaffold menyediakan struktur dasar aplikasi Material Design seperti AppBar, Drawer, dan Snackbar.

- `AppBar`: Bar di bagian atas aplikasi. AppBar yang sudah dibuat pada tugas ini berisi judul aplikasi. AppBarr juga dapat diisi dengan actions.

- `Text`: Widget ini digunakan untuk menampilkan teks.

- `TextStyle`: Mengatur styling dari teks seperti ukuran font, warna, dan ketebalan.

- `SingleChildScrollView`: Digunakan jika konten yang ditampilkan mungkin melebihi space yang tersedia di layar, sehingga memungkinkan user untuk melakukan scroll.

- `Padding`: Memberikan padding pada widget.

- `Column`: Menampilkan widget secara vertikal.

- `GridView`: Menampilkan widget dalam bentuk grid. `GridView.count` digunakan untuk membuat grid dengan jumlah kolom yang ditentukan.

- `Material`: Memberikan efek visual pada widget lain seperti ink splash.

- `InkWell`: Memberikan efek visual yang responsif ketika widget disentuh.

- `Container`: Mengkombinasikan beberapa widget menjadi satu. Biasanya digunakan untuk mengatur margin, padding, atau memberikan styling pada widget lain.

- `Center`: Mengatur tampilan widget menjadi berada di center.

- `Icon`: Menampilkan ikon.

- `SnackBar`: Menampilkan pop-up pesan singkat di bagian bawah aplikasi untuk memberikan feedback kepada user tentang aksi yang mereka lakukan (misal saat mengklik sebuah widget).
