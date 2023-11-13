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