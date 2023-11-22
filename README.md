# Arsip Tugas
<details>
<summary>Tugas 7</summary>

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
</details>

<details>
<summary>Tugas 8</summary>

# Tugas 8
## Implementasi Checklist
### Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru
__Ketentuan dari form tersebut yakni sebagai berikut:__
- Memakai minimal tiga elemen input, yaitu `name`, `amount`, `description`. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
- Memiliki sebuah tombol `Save`.
- Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
  * Setiap elemen input tidak boleh kosong.
  * Setiap elemen input harus berisi data dengan tipe data atribut modelnya.

<br>
Step by step implementasi:

1. Pada direktori `lib`, buat 2 buah folder baru dengan nama `widgets` dan `screens`
2. Lakukan refactoring dengan cara memindahkan file `left_drawer.dart` dan `shop_card.dart` ke direktori `lib/widgets`, serta memindahkan file `menu.dart` ke direktori `lib/screens`
3. Buat sebuah file baru pada direktori `lib/screens` dengan nama `itemlist_form.dart`. File tersebut akan berisi kode sebagai berikut yang berfungsi sebagai halaman form untuk menambahkan item baru.
```
import 'package:flutter/material.dart';
import 'package:bp_mart/widgets/left_drawer.dart';
import 'package:bp_mart/widgets/shop_card.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  int _amount = 0;
  String _description = "";
  String _purchasedFrom = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 81, 46),
        foregroundColor: Colors.white,
      ),
      // Tambahkan drawer yang sudah dibuat di sini
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Nama Produk",
                      labelText: "Nama Produk",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Harga",
                      labelText: "Harga",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  // Tambahkan variabel yang sesuai
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Jumlah",
                      labelText: "Jumlah",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  // Tambahkan variabel yang sesuai
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Jumlah harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Tambahkan variabel yang sesuai
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Tempat Pembelian",
                    labelText: "Tempat Pembelian",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Tambahkan variabel yang sesuai
                  onChanged: (String? value) {
                    setState(() {
                      _purchasedFrom = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Tempat pembelian tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

### Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol `Tambah Item` pada halaman utama.
1. Pada file `shop_card.dart` di direktori `lib/widgets`, tambahkan kode ini di dalam bagian `onTap: () { ... }`
```
...
if (item.name == "Tambah Produk") {
  // Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ShopFormPage()));
}
...
```

### Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah `pop-up` setelah menekan tombol `Save` pada halaman formulir tambah item baru.
1. Pada `itemlist_form.dart`, tambahkan kode berikut sebagai salah satu children dari `Column`
```
...
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(255, 16, 81, 46),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Produk berhasil tersimpan'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Munculkan value-value dari input
                      Text('Nama: $_name'),
                      Text('Harga: $_price'),
                      Text('Jumlah: $_amount'),
                      Text('Deskripsi: $_description'),
                      Text('Dibeli dari: $_purchasedFrom'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
          _formKey.currentState!.reset();
        }
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
...
```

### Membuat sebuah drawer pada aplikasi
__Ketentuan dari drawer yang dibuat yakni sebagai berikut:__
- Drawer minimal memiliki dua buah opsi, yaitu `Halaman Utama` dan `Tambah Item`.
- Ketika memiih opsi `Halaman Utama`, maka aplikasi akan mengarahkan pengguna ke halaman utama.
- Ketika memiih opsi `Tambah Item`, maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

Langkah yang perlu dilakukan:
1. Buat sebuah file baru bernama `left_drawer.dart` pada direktori `lib/widgets`
2. Isi file tersebut dengan kode berikut untuk membuat widget left drawer pada aplikasi flutter
```
import 'package:flutter/material.dart';
import 'package:bp_mart/screens/menu.dart';
import 'package:bp_mart/screens/itemlist_form.dart';
import 'package:bp_mart/screens/itemlist.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 16, 81, 46),
            ),
            child: Column(
              children: [
                Text(
                  'bp-mart',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catat stok produk toko bp-mart di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}

```

### Bonus
__Ketentuan Bonus:__
- Membuat sebuah halaman baru, yaitu halaman daftar item yang sudah dibuat dengan isi halamannya adalah setiap data produk yang sudah pernah dibuat.
- Mengarahkan pengguna ke halaman tersebut jika menekan tombol Lihat Produk pada halaman utama atau drawer.

<br>

Langkah yang perlu dilakukan yakni sebagai berikut. 
1. Pada direktori `lib/screens`, buat sebuah file baru dengan nama `itemlist.dart`
2. Pada file `shop_card.dart` yang berada di direktori `lib/widgets`, lakukan import terhadap `itemlist.dart` dan buat sebuah class baru dengan nama `Item` dan sebuah list dengan nama `itemList`
```
import 'package:flutter/material.dart';
import 'package:bp_mart/screens/itemlist_form.dart';
import 'package:bp_mart/screens/itemlist.dart';

List<Item> itemList = [];

class Item {
  String name = "";
  int price = 0;
  int amount = 0;
  String description = "";
  String purchasedFrom = "";

  Item(
      this.name, this.price, this.amount, this.description, this.purchasedFrom);
}
...
```
3. Pada `itemlist_form.dart`, tambahkan kode `itemList.add(Item(_name, _price, _amount, _description, _purchasedFrom));` sehingga menjadi seperti berikut.
```
...
onPressed: () {
  if (_formKey.currentState!.validate()) {
    itemList.add(Item(_name, _price, _amount, _description,
        _purchasedFrom));
    showDialog(
...
```
4. Buat routing menuju ke halaman `Lihat Produk` pada file `shop_card.dart`. Tambahkan kode berikut setelah bagian routing ke halaman `Tambah Produk`
```
...
else if (item.name == "Lihat Produk") {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ItemListPage(),
      ));
}
...
```
5. Tambahkan opsi `Lihat Produk` sebagai children dari `ListView` pada `left_drawer.dart` agar saat diklik dapat menuju ke halaman `Lihat Produk`
```
...
ListTile(
  leading: const Icon(Icons.checklist),
  title: const Text('Lihat Produk'),
  // Bagian redirection ke ItemFormPage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ItemListPage(),
        ));
  },
),

```

Setelah semua step dikerjakan, tampilan aplikasi flutter akan terlihat seperti berikut.
<img width="946" alt="Screenshot 2023-11-13 124558" src="https://github.com/rzapriono/bp-mart-mobile/assets/107228573/a0a3810f-f636-43bf-865b-631c94c2413b">



## Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
- `Navigator.push()` menambahkan route baru ditambahkan ke dalam stack, sehingga stack akan berisi route sebelumnya dan route yang baru ditambahkan.
```
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const ShopFormPage()
  )
);
```

- `Navigator.pushReplacement()` akan menggantikan route sebelumnya dalam stack dengan route baru yang ditentukan.
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const ItemListPage(),
  )
);
```

## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
1. Single-child Layout Widgets
- `Container`

`Container` merupakan widget dasar untuk mengatur tata letak dan dekorasi. Widget ini dapat menampung widget lain dan memberikan properti seperti padding, margin, dan dekorasi. Contoh penggunaan:

- `Align`

`Align` adalah widget yang menyelaraskan childnya dengan dirinya sendiri dan secara opsional mengatur  dirinya sendiri berdasarkan ukuran dari child tersebut. Widget ini berguna untuk mengatur posisi child relatif terhadap parent atau dalam area terbatas.

- `Center`

Widget `center` mengatur posisi childnya untuk berada ditengah baik secara horizontal maupun vertikal, dan dapat digunakan untuk menempatkan sebuah child di tengah layar atau dalam parent widget.

- `Padding`

Widget `padding` menyisipkan sebuah ruang kosong (padding) di sekitar childnya. Digunakan saat ingin menambahkan ruang di sekitar widget dan memberikan jarak antara child dan elemen sekitarnya.

2. Multi-child Layout Widgets
- `Column`

`Column` adalah widget yang mengatur tata letak childnya dalam satu kolom (dalam arah vertikal) dan dapat digunakan untuk membuat susunan vertikal dari widget, seperti untuk drawer.

- `Row`

`Row` adalah widget yang mengatur tata letak childnya dalam sebuah baris secara horizontal dan dapat digunakan untuk membuat susunan horizontal dari widget, seperti baris tombol.

- `GridView`

`GridView` merupakan sebuah widget yang mengatur tata letak childnya dalam sebuah pola grid yang terdiri dari cell - cell secara horizontal maupun vertikal.

- `ListView`

`ListView` adalah widget untuk mengatur list item atau widget yang dapat di-scroll. Widget ini dapat digunakan untuk membuat list dengan elemen-elemen yang bisa di-scroll secara vertikal atau horizontal.

- `Stack`

`Stack` merupakan widget yang memposisikan childnya relatif terhadap ujung dari boxnya. `Stack` digunakan untuk menumpuk widget di atas satu sama lain. Widget dalam `stack` dapat menumpuk satu di atas yang lain atau menempati posisi tertentu di dalamnya.

## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Pada tugas ini saya menggunakan `TextFormField` untuk data-data item seperti `name`, `price`, `amount`, `description`, dan `purchasedFrom`. Elemen input ini digunakan untuk mengambil nama item dari input. `onChanged` digunakan untuk menyimpan nilai yang diinput ke dalam variabel `_name`. Untuk memvalidasi input dan memastikan agar input tidak tidak kosong, digunakan `validator`. `TextFormField` juga memungkinkan untuk menampilkan pesan kesalahan jika input user tidak valid.


## Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean Architecture adalah sebuah konsep arsitektur yang memisahkan kode menjadi beberapa lapisan yang berbeda (serupa dengan prinsip Separation of Concern) untuk memudahkan pengembangan, pemeliharaan, dan pengujian aplikasi. Pada umumnya, arsitektur ini terdiri dari tiga layer utama, yakni domain, data, dan presentation. 

- Domain layer berisi logika bisnis dan aturan aplikasi. Lapisan ini tidak bergantung pada lapisan lainnya, sehingga dapat digunakan kembali pada aplikasi lain.
- Data layer bertanggung jawab untuk mengambil dan menyimpan data dari berbagai sumber, seperti database, API, atau penyimpanan lokal. Lapisan ini juga bertanggung jawab untuk memetakan data ke dalam model domain.
- Presentation layer adalah lapisan yang berhubungan langsung dengan pengguna. Lapisan ini bertanggung jawab untuk menampilkan data ke pengguna dan menerima input dari pengguna. Pada proyek ini terdapat di direktori `lib/screens`.
</details>

# Tugas 9
## Implementasi Checklist
### Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
Deplyoment proyek tugas Django dapat diakses melalui link [bp-mart](https://reza-apriono-tugas.pbp.cs.ui.ac.id/).

### Membuat halaman login pada proyek tugas Flutter.
1. Buat file baru pada direktori `lib/screens` dengan nama `login.dart`
2. Isi file tersebut dengan kode berikut untuk mengimplementasikan fitur login.
```
import 'package:bp_mart/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Cek kredensial
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                // gunakan URL http://10.0.2.2/
                final response =
                    await request.login("https://reza-apriono-tugas.pbp.cs.ui.ac.id/auth/login/", {
                  'username': username,
                  'password': password,
                });

                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("$message Selamat datang, $uname.")));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

```

### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
#### Setup Autentikasi pada Django untuk Flutter
1. Jalankan command `python manage.py startapp authentication` pada direktori project Django `bp-mart`.
2. Tambahkan `authentication` ke `INSTALLED_APPS` pada main project `settings.py`.
3. Jalankan perintah `pip install django-cors-headers`untuk menginstal library yang dibutuhkan.
4. Tambahkan `corsheaders` ke `INSTALLED_APPS` pada main project `settings.py`
5. Tambahkan `corsheaders.middleware.CorsMiddleware` pada main project `settings.py`
6. Tambahkan beberapa variabel berikut ini pada main project `settings.py`
```python
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
7. Buatlah sebuah method view untuk login dan logout pada `authentication/views.py`.
```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
    
@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
```
8. Buat file `urls.py` pada folder `authentication` dan tambahkan URL routing terhadap fungsi yang sudah dibuat dengan endpoint `login/` dan `logout/`.
```
from django.urls import path
from authentication.views import *

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('logout/', logout, name='logout'),
]
```
9. Tambahkan `path('auth/', include('authentication.urls'))`, pada file `bp_mart/urls.py`.

#### Integrasi Sistem Autentikasi pada Flutter
1. Install package untuk melakukan kontak dengan web service Django dengan command berikut.
```
flutter pub add provider
flutter pub add pbp_django_auth
```
2. Modifikasi root widget untuk menyediakan `CookieRequest` library ke semua child widgets dengan menggunakan `Provider`. Ubah kode pada `main.dart` menjadi seperti berikut.
```
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
          title: 'Flutter App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
            useMaterial3: true,
          ),
          home: const LoginPage()),
    );
  }
}
```

### Membuat model kustom sesuai dengan proyek aplikasi Django.
1. Run server di localhost dan buka `http://127.0.0.1:8000/json/3`
2. Copy data `JSON` tersebut dan convert menjadi language `Dart` menggunakan website Quicktype. Isi setup name menjadi `Item`.
3. Copy Code yang telah diconvert
4. Buat file baru pada direktori `lib/models` dengan nama `item.dart`, lalu paste code yang sudah dicopy sebelumnya ke file tersebut

### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
- [x] Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.
1. Buat file baru bernama `list_item.dart` pada direktori `lib/screens`, kemudian isi dengan kode berikut.
```
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:bp_mart/models/item.dart';
import 'package:bp_mart/screens/detail_item.dart';
import 'package:bp_mart/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Item>> fetchProduct() async {
    final response = await request.postJson(
        "https://reza-apriono-tugas.pbp.cs.ui.ac.id/json/",
        jsonEncode(<String, String>{
          'name': 'bait',
        }));

    // melakukan konversi data json menjadi object Item
    List<Item> list_product = [];
    for (var d in response) {
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
          backgroundColor: Colors.indigo,
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
                        "Tidak ada data Item.",
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
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${index + 1}. ${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    "Amount: ${snapshot.data![index].fields.amount}"),
                                const SizedBox(height: 10),
                                Text(
                                    "Description: ${snapshot.data![index].fields.description}"),
                                const SizedBox(height: 10),
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
                                ),
                              ],
                            ),
                          )));
                }
              }
            }));
  }
}
```
2. Tambahkan page `list_item.dart` ke `widgets/left_drawer.dart` dengan menambahkan kode berikut.
```
...
ListTile(
    leading: const Icon(Icons.shopping_basket),
    title: const Text('Daftar Produk'),
    onTap: () {
        // Route menu ke halaman produk
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductPage()),
        );
    },
),
...
```
3. Pada `widgets/shop_card.dart`, buat tombol `Lihat Produk` agar mengarahkan ke page `ProductPage` saat ditekan dengan menambahkan kode berikut dan jangan lupa import juga file `list_item.dart`.
```
...
else if (item.name == "Lihat Produk") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductPage()));
      }
...
```

### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
- [x] Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
- [x] Tampilkan seluruh atribut pada model item kamu pada halaman ini.
- [x] Tambahkan tombol untuk kembali ke halaman daftar item.
1. Buat file baru dengan nama `detail_item.dart` pada direktori `lib/screens`.
2. Isi file tersebut dengan kode berikut untuk memenuhi semua checklist diatas.
```
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
        backgroundColor: Colors.indigo,
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

```

### __Bonus__
#### Mengimplementasikan fitur registrasi akun pada aplikasi Flutter.
1. Buka proyek Django `bp_mart`, buat sebuah fungsi baru bernama `register` pada `authentication/views.py` dan tambahkan `path('register/', register, name='register'),` pada `authentication/urls.py`
```
@csrf_exempt
def register(request):
    
    username = request.POST.get('username')
    password = request.POST.get('password')

    if User.objects.filter(username=username).exists():
        return JsonResponse({
            "status": False,
            "message": "Username sudah digunakan. Pilih username lain."
        }, status=400)

    # Buat user baru tanpa menggunakan email
    user = User.objects.create_user(username=username, password=password)

    return JsonResponse({
        "username": user.username,
        "status": True,
        "message": "Registrasi berhasil!"
    }, status=201)
``` 
2. Buat file `register.dart` pada direktori `lib/screens`. Isi file tersebut dengan kode berikut untuk mengimplementasikan fitur registrasi.
```
import 'package:flutter/material.dart';
import 'package:bp_mart/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Register',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;
                if (username.isEmpty || password.isEmpty) {
                  _usernameController.clear();
                  _passwordController.clear();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Input Tidak Valid'),
                      content: const Text('Harap isi semua kolom input.'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                  return; // Stop eksekusi jika input tidak valid
                }

                final response =
                    await request.post("https://reza-apriono-tugas.pbp.cs.ui.ac.id/auth/register/", {
                  'username': username,
                  'password': password,
                });

                bool status = response['status'];

                if (status == false) {
                  _usernameController.clear();
                  _passwordController.clear();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Register Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  _usernameController.clear();
                  _passwordController.clear();
                  String message = response['message'];
                  String uname = response['username'];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text(
                            "$message Berhasil membuat akun dengan username $uname.")));
                }
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 20),
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

```
3. Tambahkan button sebagai child dari column pada file `login.dart` agar dapat mengarahkan ke page register.
```
...
const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                _usernameController.clear();
                _passwordController.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationPage(),
                  ),
                );
              },
              child: const Text('Register'),
            ),
...
```

#### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
1. Buka projek Django `bp_mart`, buat sebuah fungsi baru pada `authentication/views.py` untuk mengambil data item based on user yang sedang login.
```
def get_item_json(request):
    item = Item.objects.filter(user = user)
    return HttpResponse(serializers.serialize('json', item))
```
Jangan lupa juga untuk menambahkan pathnya.
2. Pada `list_item.dart`, ubah kode:
```
var url = Uri.parse('http://127.0.0.1:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
```
menjadi:
```
final response = await request.postJson(
  "http://127.0.0.1:8000/auth/get-item/",
  jsonEncode(<String, String>{
      'name':'bait',
  }));
```

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, data JSON dapat diambil membuat model terlebih dahulu, yaitu dengan membuat dynamic map dari JSON dan mengakses nilainya seperti dictionary. Namun, hal tersebut bukan merupakan best practice karena kegunaan model itu untuk membuat representasi objek dari suatu data JSON sehingga penyimpanan data lebih rapi dan aman.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah kelas yang digunakan untuk mengirim permintaan HTTP dengan cookie. Dalam aplikasi Flutter, CookieRequest digunakan untuk mengirim permintaan HTTP dengan cookie ke server. Dalam beberapa kasus, seperti saat menggunakan autentikasi berbasis cookie, CookieRequest sangat berguna. CookieRequest dibagikan ke semua komponen di aplikasi flutter agar status login konsisten di setiap halaman.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
### Pengambilan Data JSON
Berikut adalah langkah-langkah untuk mengambil data dari JSON dan menampilkannya pada Flutter:

1. Mengirim permintaan HTTP ke server menggunakan `http.get()` dengan URL yang sesuai.
2. Mendapatkan respons dari server dalam bentuk JSON.
3. Melakukan decode respons menjadi bentuk JSON menggunakan `jsonDecode()`.
4. Melakukan konversi data JSON menjadi objek yang sesuai.
5. Menampilkan data yang diambil pada aplikasi Flutter.

```
Future<List<Item>> fetchItem() async {
  var url = Uri.parse(
    'https://reza-apriono-tugas.pbp.cs.ui.ac.id/json/');
  var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Item
  List<Item> list_item = [];
  for (var d in data) {
    if (d != null) {
      list_item.add(Item.fromJson(d));
    }
  }
  return list_item;
}
```

Fungsi `fetchItem()` melakukan hal-hal tersebut. Pertama, mengirim permintaan HTTP ke server menggunakan URL yang sesuai. Kemudian, didapatkan respons dari server dalam bentuk JSON. Setelah itu, dilakukan decode respons menjadi bentuk JSON menggunakan `jsonDecode()`. Selanjutnya, dilakukan konversi data JSON menjadi objek `Item` menggunakan `Item.fromJson()`. Akhirnya, direturn list objek `Item` yang telah diambil dari server.

## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
__1. Input Akun di Flutter:__

Pengguna memasukkan username dan password.

```
String username = _usernameController.text;
String password = _passwordController.text;
```
__2. Permintaan Autentikasi ke Django:__

Flutter mengirim permintaan autentikasi ke server Django beserta informasi data user yang ingin login.

```
final response = await request.login("https://reza-apriono-tugas.pbp.cs.ui.ac.id/auth/login/", {
  'username': username,
  'password': password,
});
```
__3. Autentikasi oleh Django:__

Django memeriksa kredensial dan memverifikasi informasi login. Django kemudian memberikan respons berhasil atau gagal. Jika valid, maka django akan mengembalikan token autentikasi.

```
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```

__4. Navigasi dan Tampilan Menu di Flutter:__

Jika berhasil, tampilan menu atau akses ke fitur tertentu yang memerlukan autentikasi akan di tampilkan di aplikasi flutter. Pada tugas ini, Flutter melakukan navigasi ke halaman home dan menampilkan pesan selamat datang.

```
if (request.loggedIn) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message Selamat datang, $uname.")));
} else {
  // Tampilkan dialog jika login gagal
  showDialog(/*...*/);
```

## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
Selain dari widget yang dipakai pada tugas sebelumnya, saya menggunakan:
- `http`: Ditambahkan sebagai dependensi untuk membuat permintaan HTTP
- `FutureBuilder`: Digunakan untuk membangun widget secara asinkron berdasarkan snapshot terbaru dari data.
- `Provider` : Digunakan untuk mengelola dan menyediakan state dari kelas `CookieRequest` ke semua widget anak.
- `Elevated Button`: Untuk membuat button
- `Text`: Menampilkan teks
- `SizedBox`: Memberikan space diantara widget
- `CookieRequest`: Kelas kustom untuk membuat permintaan HTTP dengan cookie.
- `TextEditingController`: Pengontrol untuk bidang teks yang dapat diedit.
- `MaterialPageRoute`: Rute halaman modal yang menggantikan seluruh layar dengan halaman baru.
-`AlertDialog`: Dialog dengan judul, konten, dan tindakan.
- `ScaffoldMessenger`: Pesan untuk menampilkan snack bar.