import 'package:cubersparadise_mobile/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cubersparadise_mobile/models/product.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct(request) async {
    var data = await request.get('https://cubersparadise.domcloud.dev/get-product/');

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
  final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
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
                            )
                          );
                    }
                }
            }
          )
        );
    }
}