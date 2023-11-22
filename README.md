# Cubersparadise Mobile
Nama    : Ricky Setiawan   
Kelas   : PBP E   
NPM     : 2206083161

[Tugas 7](#tugas-7-pbp)

[Tugas 8](#tugas-8-pbp)

[Tugas 9](#tugas-9-pbp)

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

## Tugas 9 PBP
## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Pengambilan data JSON dapat dilakukan tanpa membuat model terlebih dahulu, tergantung pada konteks dan kebutuhan aplikasi kita. Jika kita hanya perlu mengakses dan mengelola data yang sudah ada dalam format JSON, kita dapat menggunakan berbagai bahasa pemrograman atau alat (seperti Python dengan library json, JavaScript dengan JSON.parse, dll.) untuk membaca dan memanipulasi data tersebut tanpa memerlukan pembuatan model khusus.

Namun, jika kita berbicara tentang pengambilan data JSON dengan menggunakan model, mungkin kita merujuk pada pengambilan data dari suatu API yang memberikan respons dalam format JSON. Dalam hal ini, kita perlu membuat koneksi ke API dan kemudian menggunakan model (mungkin tidak diperlukan pembuatan model khusus, tetapi kita perlu menulis kode untuk memanipulasi respons JSON yang diterima) untuk mengolah data sesuai kebutuhan kita.

Penting untuk memahami bahwa membuat model atau tidak tergantung pada kebutuhan aplikasi kita. Jika aplikasi kita memerlukan analisis lanjutan, pemrosesan bahasa alami, atau tugas-tugas lain yang melibatkan kecerdasan buatan, maka pembuatan model mungkin diperlukan. Jika tujuan kita hanya mengambil data dan menyimpannya dalam format yang sesuai, tanpa memerlukan analisis lanjutan, maka tidak perlu membuat model.

Sebagai contoh, jika kita mengelola data bisnis sederhana dan hanya perlu menyimpan, memperbarui, atau mengambil data dari basis data yang menggunakan format JSON, kita mungkin tidak memerlukan pembuatan model. Namun, jika kita bekerja dengan tugas seperti pengenalan entitas dalam teks atau pemahaman konteks dari data JSON, maka pembuatan model mungkin diperlukan.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah sebuah kelas yang digunakan untuk mengelola HTTP request dan cookie yang terkait dengan request tersebut. Kelas ini memiliki beberapa method untuk melakukan operasi seperti login, get, post, dan logout.

Instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter agar semua komponen dalam aplikasi dapat melakukan HTTP request yang terotentikasi dan semua komponen akan memiliki akses ke data pengguna yang sama.

Misalnya, pada tugas kali ini, Instance CookieRequest dibagikan ke semua komponen melalui Provider dan diakses di ItemFormPage dengan context.watch<CookieRequest>() untuk melakukan permintaan HTTP POST ke server untuk mengirimkan data buku baru ke server saat tombol "save" ditekan.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
1. Fungsi `fetchProduct` membuat permintaan HTTP GET ke URL yang ditentukan. Ini dilakukan secara asinkron menggunakan `http.get`.
```
var url = Uri.parse('http://127.0.0.1:8000/json/');
var response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
);
```
2. Respons dari server kemudian di-decode menjadi bentuk JSON menggunakan jsonDecode.
```
var data = jsonDecode(utf8.decode(response.bodyBytes));
```
3. Data JSON kemudian di-convert menjadi objek Product menggunakan method formJson yang didefinisikan dalam kelas Product yang kemudian objek-objek tersebut ditambahkan ke dalam listProduct.
```
List<Product> listProduct = [];
for (var d in data) {
  if (d != null) {
    listProduct.add(Product.fromJson(d));
  }
}
```
4. Dalam method build, `FutureBuilder` digunakan untuk menunggu `fetchProduct` selesai dan membangun UI berdasarkan hasilnya. Jika data masih dimuat, `CircularProgressIndicator` ditampilkan. Jika data telah dimuat, `ListView.builder` digunakan untuk membuat daftar barang.

## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Pengguna memasukkan username dan password melalui dua `TextField` yang sudah disediakan.
2. Aplikasi kemudian membuat permintaan HTTP POST ke endpoint login Django menggunakan CookieRequest. Data username dan password dikirimkan sebagai bagian dari body request.
```
final response = await request.login(
    "http://127.0.0.1:8000/auth/login/",  
    {
        'username': username,
        'password': password,
    });
```
3. Django memproses permintaan login, memeriksa apakah username dan password valid, dan mengirimkan respons. Respons ini kemudian diterima oleh aplikasi Flutter dan Flutter dan diperiksa. Jika login berhasil (request.loggedIn adalah true), aplikasi navigasi ke `MyHomePage` dan menampilkan pesan selamat datang. Jika login gagal, aplikasi menampilkan pesan salah.

## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
1. `Scaffold` Widget:
   - Tujuan: Menyediakan struktur dasar antarmuka visual, termasuk app bar, drawer, dan body.
   - Penggunaan Khusus: Mendefinisikan tata letak keseluruhan layar.
2. `AppBar` Widget:
   - Tujuan: Mewakili app bar di bagian atas layar.
   - Penggunaan Khusus: Menampilkan judul "Product" di bagian atas layar.
3. `LeftDrawer` Widget:
   - Tujuan: Mewakili widget drawer kustom, kemungkinan berisi opsi navigasi.
   - Penggunaan Khusus: Ditempatkan dalam properti drawer dari Scaffold untuk memberikan drawer navigasi di sisi kiri layar.
4. `FutureBuilder` Widget:
   - Tujuan: Widget yang membangun dirinya berdasarkan snapshot terbaru dari future.
   - Penggunaan Khusus: Mengelola pengambilan data produk secara asinkron dan memperbarui UI sesuai.
5. `CircularProgressIndicator` Widget:
   - Tujuan: Menunjukkan bahwa sesuatu sedang berlangsung, biasanya digunakan untuk keadaan menunggu atau pemuatan.
   - Penggunaan Khusus: Ditampilkan di tengah layar ketika data produk masih diambil.
6. `Column` Widget:
   - Tujuan: Widget yang menyusun anak-anaknya dalam susunan vertikal.
   - Penggunaan Khusus: Berisi widget teks ("Tidak ada data produk") dan sized box, ditampilkan ketika tidak ada data produk.
7. `ListView.builder` Widget:
   - Tujuan: Membangun daftar widget yang dapat di-scroll berdasarkan indeks.
   - Penggunaan Khusus: Menampilkan daftar kartu produk, di mana setiap kartu mewakili produk.
8. `Card` Widget:
   - Tujuan: Mewakili kartu desain material.
   - Penggunaan Khusus: Berisi ListTile untuk setiap produk, menyediakan kartu visual untuk setiap produk.
9. `ListTile` Widget:
   - Tujuan: Baris tunggal dengan tinggi tetap yang biasanya berisi teks serta ikon leading dan trailing.
   - Penggunaan Khusus: Mewakili entri produk dalam daftar, dengan judul, subjudul, dan ikon trailing.
10. `Image.network` Widget:
    - Tujuan: Menampilkan gambar dari jaringan.
    - Penggunaan Khusus: Menampilkan gambar produk yang diambil dari jaringan.
11. `IconButton` Widget:
    - Tujuan: Tombol yang berisi ikon.
    - Penggunaan Khusus: Mewakili tombol ikon di akhir setiap ListTile untuk menampilkan detail tambahan tentang produk dalam dialog peringatan.
12. `AlertDialog` Widget:
    - Tujuan: Mewakili dialog peringatan desain material.
    - Penggunaan Khusus: Menampilkan informasi detail tentang produk ketika tombol ikon yang sesuai ditekan.
13. `MaterialApp` Widget:
    - Tujuan: Menginisialisasi aplikasi Flutter berbasis Material Design.
    - Penggunaan Khusus: Menentukan tema dan halaman beranda aplikasi.
14. `LoginPage` Widget:
    - Tujuan: Mewakili halaman login.
    - Penggunaan Khusus: Merupakan halaman utama aplikasi yang menampilkan formulir login.
15. `_LoginPageState` Widget (StatefulWidget):
    - Tujuan: Menangani state dari halaman login.
    - Penggunaan Khusus: Memegang kontroler untuk input pengguna dan memproses logika otentikasi.
16. `Container` Widget:
    - Tujuan: Menyediakan kotak untuk mengelompokkan dan menyusun widget lainnya.
    - Penggunaan Khusus: Memberikan padding dan tata letak untuk elemen-elemen di dalamnya.
15. `Column` Widget:
    - Tujuan: Menyusun anak-anaknya dalam susunan vertikal.
    - Penggunaan Khusus: Menempatkan elemen-elemen anak, seperti input teks dan tombol, secara vertikal.
16. `TextField` Widget:
    - Tujuan: Menampilkan input teks yang dapat diedit.
    - Penggunaan Khusus: Menerima input username dan password dari pengguna.
17. `SizedBox` Widget:
    - Tujuan: Memberikan ruang atau jarak antar widget.
    - Penggunaan Khusus: Menambahkan ruang vertikal antara input teks dan tombol.
18. `ElevatedButton` Widget:
    - Tujuan: Menampilkan tombol yang menonjol dengan bayangan.
    - Penggunaan Khusus: Memicu fungsi untuk memproses login saat tombol ditekan.
19. `SnackBar` Widget:
    - Tujuan: Menampilkan pesan singkat yang muncul di bagian bawah layar.
    - Penggunaan Khusus: Menampilkan pesan selamat datang setelah login berhasil.
20. `Provider` dan `context.watch<CookieRequest>()` Widgets:
    - Tujuan: Menyediakan manajemen state dan membuat objek CookieRequest dapat diakses di seluruh widget tree.
    - Penggunaan Khusus: Digunakan untuk memantau status otentikasi pengguna dan mengirim permintaan otentikasi.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
### Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
Melakukan push ulang dengan semua perubahan yang dibutuhkan pada proyek Django.
### Membuat halaman login pada proyek tugas Flutter.
1. Masuk ke projek Django tugas PBP dan tambahkan app baru bernama `authentication` yang akan digunakan untuk autentikasi.
2. Pada `settings.py` di direktori `cubersparadise` tambahkan `authentication` di `INSTALLED_APPS`.
3. Install `django-cors-headers` dengan memasukkan ke dalam `requirements.txt` dan melakukan pip install.
4. Tambahkan `corsheaders` ke `INSTALLED_APPS` dan masukkan `corsheaders.middleware.CorsMiddleware` pada bagian `MIDDLEWARE`.
5. Tambahkan konfigurasi yang dibutuhkan pada `settings.py`.
```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
6. Tambahkan kode berikut pada `authentication/views.py`.
```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.contrib.auth import logout as auth_logout
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
7. Buat file baru di direktori `authentication` bernama `urls.py` dan tambahkan kode berikut.
```
from django.urls import path
from authentication.views import login, logout

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('logout/', logout, name='logout'),
]
```
8. Menambahkan `authentication` pada `cubersparadise/urls.py`.
```
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('main.urls')),
    path('auth/', include('authentication.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
```
### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
1. Pada proyek Flutter tugas buat halaman baru untuk login(`screen/login.dart`) dan masukkan kode dibawah. (Install terlebih dahulu `flutter pub add provider` dan `flutter pub add pbp_django_auth`).
```
import 'package:cubersparadise_mobile/screen/menu.dart';
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
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://localhost:8000/auth/login/", {
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
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
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
2. Ubah `main.dart` menjadi dibawah ini untuk menyediakan CookieRequest library ke semua child widgets.
```
import 'package:flutter/material.dart';
import 'package:cubersparadise_mobile/screen/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

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
                home: LoginPage()
            ),
        );
    }
}
```
3. Untuk logout modifikasi `shop_card.dart` seperti kode dibawah.
```
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:cubersparadise_mobile/screen/login.dart';
import 'package:cubersparadise_mobile/screen/shoplist_form.dart';
import 'package:cubersparadise_mobile/screen/view_product.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
      return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        // Area responsif terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
          else if (item.name == "Lihat Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          }
          // statement if sebelumnya
          // tambahkan else if baru seperti di bawah ini
          else if (item.name == "Logout") {
                  final response = await request.logout(
                      "http://localhost:8000/auth/logout/");
                  String message = response["message"];
                  if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message"),
                    ));
                  }
                }
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

### Membuat model kustom sesuai dengan proyek aplikasi Django.
Saya menggunakan [Quicktype](https://quicktype.io) untuk membuat model kustom. Untuk menggunakannya cukup copy data json dari projek Django dengan `nama_web/json` dan paste ke quicktype dengan menuliskan nama, source type, dan bahasa keluaran yang diinginkan pada tempat yang sudah disediakan.

### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
1. Tambahkan package `http` dengan menjalankan perintah `flutter pub add http`.
2. Tambahkan juga kode `<uses-permission android:name="android.permission.INTERNET"/>` pada berkas `android/app/src/main/AndroidManifest.xml` untuk memperbolehkan akses internet pada aplikasi Flutter.
3. Buat file baru `screen/view_product.dart` dan tambahkan kode berikut.
```
import 'package:cubersparadise_mobile/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cubersparadise_mobile/models/product.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    var url = Uri.parse(
        'http://localhost:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Card(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: ListTile(
                                  title: Text(
                                    "Nama: ${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  subtitle : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children : [
                                      Text("Jumlah: ${snapshot.data![index].fields.quantity}"),
                                      Text("Deskripsi: ${snapshot.data![index].fields.description}"),
                                      Text("Gambar:"),
                                      Image.network(
                                        snapshot.data![index].fields.image,
                                        width: 300,
                                        height: 200,
                                      ),
                                    ]
                                  ),  
                                  trailing : IconButton(
                                      icon: const Icon(Icons.info_outline, color: Colors.indigo),
                                      onPressed: () {
                                        // Ketika click icon detail, akan memunculkan data lengkap item
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(snapshot.data![index].fields.name),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text("Quantity: ${snapshot.data![index].fields.quantity}"),
                                                    Text("Description: ${snapshot.data![index].fields.description}"),
                                                    Text("Url gambar: ${snapshot.data![index].fields.image}")
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Close'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          }
                                        );  
                                      }
                                    )         
                                ),
                            ));
                    }
                }
            }));
    }
}
```
4. Tambahkan `view_product.dart` pada `widgets/left_drawer.dart`.
```
          ListTile(
              leading: const Icon(Icons.checklist),
              title: const Text('Lihat Item'),
              onTap: () {
                  // Route menu ke halaman produk
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductPage()),
                  );
              },
          ),
```
5. Pada projek Django tambahkan fungsi baru di `main/views.py`.
```
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        
        data = json.loads(request.body)

        new_product = Product.objects.create(
            name = data["name"],
            quantity = int(data["quantity"]),
            description = data["description"],
            image = data["image"],
            user = request.user,
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)
```
6. Menambahkan `create_product_flutter` ke `main/urls.py`.
```
from django.urls import path
from main.views import product_list, create_product, show_xml, show_json, show_xml_by_id, show_json_by_id, registrasi, login_user, logout_user, product_management, add_product, subtract_product, delete_product, get_product_json, add_product_ajax, delete_product_ajax, create_product_flutter

app_name = 'main'

urlpatterns = [
    path('', product_list, name='product_list'),
    path('create-product', create_product, name='create_product'),
    path('xml/', show_xml, name='show_xml'),
    path('json/', show_json, name='show_json'),
    path('xml/<int:id>/', show_xml_by_id, name='show_xml_by_id'),
    path('json/<int:id>/', show_json_by_id, name='show_json_by_id'),
    path('registrasi/', registrasi, name='registrasi'),
    path('login/', login_user, name='login'),
    path('logout/', logout_user, name='logout'),
    path('product_management/', product_management, name='product_management'),
    path('add_product/<int:product_id>/', add_product, name='add_product'),
    path('subtract_product/<int:product_id>/', subtract_product, name='subtract_product'),
    path('delete_product/<int:product_id>/', delete_product, name='delete_product'),
    path('get-product/', get_product_json, name='get_product_json'),
    path('create-ajax/', add_product_ajax, name='add_product_ajax'),
    path('delete-ajax/', delete_product_ajax, name='delete_product_ajax'),
    path('create-flutter/', create_product_flutter, name='create_product_flutter'),
]
```
