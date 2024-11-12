import 'package:flutter/material.dart';
import 'package:go_cafe/screens/menu.dart';
import 'package:go_cafe/screens/productentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
    ),
    child: const Column(
      children: [
        Text(
          'Go Cafe',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Padding(padding: EdgeInsets.all(8)),
        Text(
          "Ingin Begadang? Beli kopi di go cafe aja, dijamin joss!!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.normal,
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
    leading: const Icon(Icons.add),
    title: const Text('Tambah Product'),
    // Bagian redirection ke MoodEntryFormPage
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductEntryFormPage(),
          ));
    },
  ),        ],
      ),
    );
  }
}