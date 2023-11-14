# Cubersparadise Mobile
Nama    : Ricky Setiawan   
Kelas   : PBP E   
NPM     : 2206083161

[Tugas 7](#tugas-7-pbp)

[Tugas 8](#tugas-8-pbp)

## Tugas 7 PBP
## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Perbedaan utama antara StatelessWidget dan StatefulWidget pada pengembangan aplikasi Flutter adalah bagaimana mereka mengelola perubahan data dan keadaan (state) dalam widget.   
- StatelessWidget: Tidak memiliki keadaan internal yang dapat berubah. Cocok untuk bagian UI yang statis.

- StatefulWidget: Memiliki keadaan internal yang dapat berubah. Cocok untuk bagian UI yang perlu merespons perubahan data atau interaksi pengguna.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- MyApp (main.dart):
  - MyApp adalah root widget dari aplikasi Anda.
Membungkus seluruh aplikasi dan menginisialisasi MaterialApp.
  - Menentukan tema aplikasi dan widget awal yang ditampilkan.

- MaterialApp (main.dart):
  - MaterialApp adalah widget yang mengatur konfigurasi dasar dari aplikasi Flutter.
  - Menentukan judul aplikasi dan tema, serta widget awal yang ditampilkan saat aplikasi dimulai.

- MyHomePage (menu.dart):
  - MyHomePage adalah widget yang mewakili halaman utama aplikasi.
  - Memiliki daftar item yang akan ditampilkan dalam bentuk ShopCard menggunakan GridView.
Membungkus konten utama aplikasi.
- Scaffold (menu.dart):
  - Scaffold adalah widget yang memberikan kerangka dasar untuk halaman aplikasi.
  - Mencakup AppBar (bilah atas) dan konten utama (body) di dalamnya.
- AppBar (menu.dart):
  - AppBar adalah widget yang digunakan untuk menampilkan bilah atas aplikasi.
  - Menampilkan judul dan latar belakang warna (color) yang sesuai.
- Column (menu.dart):
  - Column adalah widget yang digunakan untuk menampilkan anak-anaknya secara vertikal.
  - Berisi elemen-elemen UI, seperti judul dan GridView.
- GridView.count (menu.dart):
  - GridView.count adalah widget yang digunakan untuk menampilkan daftar item dalam bentuk grid dengan jumlah kolom yang tetap.
  - Menerima daftar item ShopCard yang ditampilkan dalam grid.
- ShopItem (menu.dart):
  - ShopItem adalah kelas yang mewakili item yang akan ditampilkan dalam daftar.
  - Berisi informasi seperti nama, ikon, dan warna item.
- ShopCard (menu.dart):
  - ShopCard adalah widget yang digunakan untuk menampilkan setiap item dalam grid.
  - Menampilkan ikon, teks, dan latar belakang dengan warna yang sesuai sesuai dengan properti ShopItem.
- Material (menu.dart):
  - Material adalah widget yang digunakan untuk mengatur latar belakang warna (color) pada ShopCard.
  - Memberikan efek "elevasi" ketika ditekan oleh pengguna.
- InkWell (menu.dart):
  - InkWell adalah widget yang membuat area yang responsif terhadap sentuhan pengguna.
  - Digunakan untuk menangani tindakan ketika ShopCard ditekan.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
### Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
1. Pertama-tama kita masuk ke terminal dan buka direktori dimana kita ingin menyimpan program Flutter kita.
2. Lalu kita membuat program Flutter baru dengan menggunakan `flutter create <nama app>` pada terminal.
### Membuat tiga tombol sederhana dengan ikon dan teks untuk:
- Melihat daftar item (Lihat Item), Menambah item (Tambah Item), Logout (Logout)   
  1. Kita buat sebuah file dart baru dan isi file tersebut dengan `MyHomePage` dan `MyHomePageState` yang ada pada `main.dart` (dicut saja) jangan lupa menambahkan `import 'package:flutter/material.dart';` untuk import package material flutter yang berisi komponen antarmuka pengguna (UI) berdasarkan panduan desain Material Design yang dikembangkan oleh Google.
  2. Pada `main.dart` tambahkan `import 'package:shopping_list/menu.dart';` untuk menghilangkan error yang terjadi akibat `MyHomePage` yang sekarang sudah berada di `menu.dart`.
  3. Pada `main.dart` ubah `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`.  
  4. Pada `menu.dart` kita ubah `MyHomePage` menjadi stateless widget dengan mengubahnya menjadi berikut ini.
        ```
        class MyHomePage extends StatelessWidget {
            MyHomePage({Key? key}) : super(key: key);
            final List<ShopItem> items = [
                ShopItem("Lihat Item", Icons.checklist, Colors.blue.shade700),
                ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.indigo.shade900),
                ShopItem("Logout", Icons.logout, Colors.red.shade900),
            ];

            @override
            Widget build(BuildContext context) {
                return Scaffold(
                appBar: AppBar(
                    title: const Text(
                    'Cubersparadise',
                    style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.indigo,
                    centerTitle: false,
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
                            'Cubersparadise', // Text yang menandakan toko
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

  5. Hapus fungsi yang mengandung state (`MyHomePageState`) karena tidak dibutuhkan. 
  6. Buat kelas Shopitem untuk menambahkan item-item yang akan ditampilkan.
        ```
        class ShopItem {
            final String name;
            final IconData icon;
            final Color color;

            ShopItem(this.name, this.icon, this.color);
        }
        ```
### Memunculkan Snackbar dengan tulisan:
- "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
- "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
- "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.   

  1. Buat sebuah widget stateless baru untuk memunculkan card dengan cara manambahkan kode berikut.
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
        
## Tugas 8 PBP
## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
1. Navigator.push()
   - Metode ini digunakan untuk menambahkan layar baru ke dalam tumpukan navigasi (navigation stack).
   - Saat menggunakan Navigator.push(), layar baru akan ditumpuk di atas layar saat ini dalam tumpukan navigasi.
   - Layar sebelumnya tetap ada di tumpukan dan dapat diakses dengan tombol "back" atau metode Navigator.pop().
   - Contoh:
   ```
   if (item.name == "Tambah Item") {
       Navigator.push(context,
       MaterialPageRoute(builder: (context) => const ShopFormPage()));
   } 
   ```
2. Navigator.pushReplacement()
   - Metode ini digunakan untuk menambahkan layar baru ke dalam tumpukan navigasi dan menggantikan layar saat ini dengan layar yang baru.
   - Saat menggunakan Navigator.pushReplacement(), layar saat ini dihapus dari tumpukan dan diganti dengan layar baru.
   - Ini berguna ketika kita ingin mengganti layar saat ini dengan layar baru, misalnya, setelah pengguna melakukan aksi tertentu seperti login.
   - Contoh:
   ```
   onTap: () {
       Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => const ShopFormPage(),
       ));
   },
   ```  
## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
1. Container:
   - Container adalah widget serbaguna yang dapat digunakan untuk mengatur tata letak, padding, dan dekorasi. Ini digunakan untuk membungkus widget lain dan memberikan properti        seperti margin, padding, dan warna latar belakang.
2. Column dan Row:
   - Digunakan untuk menyusun widget secara vertikal (Column) atau horizontal (Row). Cocok untuk menyusun tata letak sederhana yang terdiri dari beberapa widget.
3. ListView:
   - Digunakan untuk menampilkan daftar item dengan scroll. Cocok untuk daftar yang panjang atau dinamis.
4. Stack:
   - Digunakan untuk menumpuk widget di atas satu sama lain. Cocok untuk membuat antarmuka pengguna yang kompleks dengan tata letak bertumpuk.
5. GridView:
   - Digunakan untuk menampilkan data dalam bentuk kotak yang teratur, sering digunakan untuk menampilkan daftar item dalam grid.
6. Expanded dan Flexible:
   - Digunakan untuk memberikan widget ruang tambahan dalam tata letak. Biasanya digunakan di dalam Column atau Row untuk mengatur seberapa banyak ruang yang harus diisi oleh          masing-masing widget anak.
## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
1. TextFormField
   - Penggunaan TextFormField memungkinkan untuk dengan mudah menangkap input pengguna, dan penggunaan khusus validasi pada masing-masing TextFormField memastikan bahwa data           yang dimasukkan sesuai dengan kebutuhan aplikasi.
## Bagaimana penerapan clean architecture pada aplikasi Flutter?
1. Pemisahan Layer:
   - Presentation Layer: Mengelola UI dan interaksi pengguna.
   - Business Logic Layer: Mengatur aturan bisnis dan keadaan aplikasi.
   - Data Layer: Mengelola akses data (API, database lokal).

2. Penggunaan Model:
   - Model digunakan untuk representasi data. Model tersebut harus sederhana dan hanya mencerminkan struktur data.

3. Dependency Injection:
   - Memisahkan ketergantungan antar komponen, memudahkan pengujian dan pemeliharaan.

4. Testing:
   - Setiap layer harus dapat diuji secara independen, memudahkan deteksi dan perbaikan bug.

5. Prinsip SOLID:
   - Menerapkan prinsip SOLID untuk memastikan keterbacaan, pemeliharaan, dan skalabilitas kode.

Tujuan dari Clean Architecture adalah untuk membuat kode menjadi lebih bersih, mudah diuji, dan mudah diubah.
## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
### Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
1. Kita buat terlebih dahulu folder `screen` dan `widgets` untuk menerapkan Clean Architecture. Kita pindahkan `menu.dart` kedalam folder `screen` dan `shop_card.dart` kedalam folder `widgets`
2. Lalu kita buat sebuah file `dart` baru didalam folder `screen` disini saya menamainya `shoplist_form.dart`. Dan diisi dengan kode berikut.
```
import 'package:flutter/material.dart';
import 'package:cubersparadise_mobile/widgets/left_drawer.dart';
import 'package:cubersparadise_mobile/widgets/shop_card.dart';

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

List<Item> items = [];

class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _quantity = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Form Tambah Produk',
              ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Product Name",
                        labelText: "Product Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
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
                        hintText: "Quantity",
                        labelText: "Quantity",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _quantity = int.parse(value!);
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
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigo),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            items.add(Item(
                              name: _name,
                              quantity: _quantity,
                              description: _description,
                            ));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Produk berhasil tersimpan'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Name: $_name'),

                                        Text('Quantity: $_quantity'),
                                        Text('Description: $_description'),
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
                ]
            ),
          ),
        )
      );
    }
}
```
Ini akan menampilkan sebuah halaman baru yang berisi form yang dapat diisi oleh users. Disini saya menambahkan 3 elemen input yaitu name, quantity, dan description yang sudah divalidasi. Saya juga menambahkan tombol save.

### Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
Untuk mengarahkan pengguna ke halaman form kita akan kembali ke `shop_card.dart` dan menambahkan kode berikut pada bagian `ontap`.
```
if (item.name == "Tambah Item") {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => const ShopFormPage()));
}
```
Jangan lupa untuk import `shoplist_form.dart`. Sekarang saat tombol dengan nama `Tambah Item` dipencet maka akan dialihkan ke halaman `shoplist_form.dart`

### Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
Pada `shoplist_form.dart` kita buat tombol save sebagai berikut.
```
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all(Colors.indigo),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
            items.add(Item(
              name: _name,
              quantity: _quantity,
              description: _description,
            ));
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                title: const Text('Produk berhasil tersimpan'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                      CrossAxisAlignment.start,
                    children: [
                      Text('Name: $_name'),
                      Text('Quantity: $_quantity'),
                      Text('Description: $_description'),
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
```
Sekarang saat tombol dengan tulisan `save` dipencet akan memunculkan pop-up yang berisi data dari form yang barusan saja diisi oleh user

### Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
1. Kita buat sebuah file baru pada folder `widgets`. Disini saya menamainya `left_drawer.dart` dan diisi dengan kode berikut.
```
import 'package:flutter/material.dart';
import 'package:cubersparadise_mobile/screen/menu.dart';
import 'package:cubersparadise_mobile/screen/shoplist_form.dart';
import 'package:cubersparadise_mobile/screen/view_product.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Cubersparadise',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Cek rubikmu disini!",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
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
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ShopFormPage(),
                ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Lihat Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ViewPage(),
                ));
            },
          ),
        ],
      ),
    );
  }
}
```
Sekarang akan muncul sebuah drawer pada bagian kiri yang berisi `Halaman Utama`, `Tambah Item`, dan `Lihat Item` yang jika dipencet akan memuat halaman baru sesuai yang mereka pencet.
