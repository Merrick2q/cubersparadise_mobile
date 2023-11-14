import 'package:cubersparadise_mobile/screen/shoplist_form.dart';
import 'package:flutter/material.dart';
import 'package:cubersparadise_mobile/widgets/left_drawer.dart';

class ViewPage extends StatefulWidget {
    const ViewPage({super.key});

    @override
    State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Lihat Produk',
              ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text('Quantity: ${item.quantity}\nDescription: ${item.description}'),
                  trailing: IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.indigo),
                onPressed: () {
                  // Ketika click icon detail, akan memunculkan data lengkap item
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(item.name),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text("Quantity: ${item.quantity}"),
                              Text("Description: ${item.description}"),
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
                    });  
                }  
              ),
            )
          );
        },
      ),
    );
  }
}