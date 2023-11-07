# Cubersparadise Mobile
## Tugas 7 PBP
Nama    : Ricky Setiawan   
Kelas   : PBP E   
NPM     : 2206083161

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