# Profil 
- Rajendra Rifqi Baskara - 2306245680
- Kelas: PBP C
#

# Content
- [TUGAS 7](#tugas-7)
#

# Tugas 7
[Back to Contents](#contents)

## Stateless widget dan stateful widget

**Stateless Widget**: adalah widget yang tidak memiliki state atau kondisi yang bisa berubah setelah widget pertama kali dirender. 


**Stateful Widget**: adalah widget yang memiliki state atau kondisi internal yang bisa berubah selama masa hidup widget. 

| Perbedaan           | StatelessWidget                          | StatefulWidget                               |
|---------------------|------------------------------------------|----------------------------------------------|
| **State**           | Tidak memiliki state yang bisa berubah   | Memiliki state yang bisa berubah             |
| **Penggunaan**      | Untuk UI yang statis atau tidak berubah  | Untuk UI yang dinamis atau dapat berubah     |
| **Pembaruan UI**    | Tidak dapat diperbarui secara internal   | Dapat diperbarui dengan memanggil `setState` |
| **Kapan digunakan** | UI yang tetap (misalnya teks statis)     | UI yang bergantung pada interaksi pengguna   |
| **Implementasi**    | Menggunakan satu kelas saja             | Memerlukan dua kelas (`Widget` dan `State`)  |


## Widget-widget 
1. **MaterialApp**: Widget utama untuk aplikasi berbasis Material Design di Flutter. Menyediakan konfigurasi dasar seperti tema, title, dan halaman awal (home).

2. **StatelessWidget**: Digunakan untuk widget tanpa state atau kondisi internal yang berubah. Dalam proyek ini, MyApp adalah StatelessWidget yang mengatur tampilan utama aplikasi.

3. **Scaffold**: Menyediakan struktur dasar halaman seperti AppBar, body, dan floating action button. Scaffold membantu membangun layout dengan struktur Material Design.

4. **AppBar**: Bagian atas halaman sebagai header aplikasi. Digunakan untuk menampilkan judul aplikasi, yaitu "Go Cafe".

5. **Column**: Menempatkan widget lain dalam bentuk kolom vertikal. Di sini, Column mengatur teks sambutan dan grid item di halaman utama.

6. **Row**: Menempatkan anak-anaknya secara horizontal dalam satu baris. Row digunakan untuk menampilkan kartu informasi pengguna seperti NPM, nama, dan kelas.

7. **Padding**: Memberi jarak pada widget di dalamnya. Padding digunakan di sekitar Column dan GridView agar tampilan lebih rapi.

8. **GridView.count**: Membuat tampilan grid dengan jumlah kolom tertentu (3 kolom). Menampilkan tombol "Lihat Product", "Tambah Product", dan "Logout" dalam format grid.

9. **Card**: Membuat kotak dengan efek bayangan, sering untuk informasi singkat atau item UI. Digunakan untuk InfoCard, yang menunjukkan detail pengguna seperti NPM, nama, dan kelas.

10. **Text**: Menampilkan teks di layar. Text digunakan untuk berbagai teks, termasuk judul aplikasi, sambutan, dan informasi kartu.

11. **Icon**: Menampilkan ikon di dalam aplikasi. Digunakan dalam tombol untuk item-item di halaman utama, seperti "Lihat Product", "Tambah Product", dan "Logout".

12. **Material**: Memberi latar belakang dan efek material pada elemen UI. Dalam ItemCard, Material digunakan untuk memberikan warna latar belakang sesuai warna yang diatur pada tiap item.

13. **InkWell**: Memberikan efek interaktif (gelombang) saat pengguna menekan elemen. Digunakan untuk mendeteksi ketukan pada ItemCard dan menampilkan pesan SnackBar.

14. **SnackBar**: Menampilkan pesan sementara di bagian bawah layar. Dalam ItemCard, SnackBar digunakan untuk menampilkan pesan saat tombol item ditekan.

## Fungsi `setState()` dan apa dampak dengan variabel apa saja dengan fungsi tersebut

`setState()` adalah fungsi yang digunakan dalam widget StatefulWidget di Flutter untuk memberi tahu framework bahwa ada perubahan pada variabel atau properti di dalam state yang memerlukan pembaruan UI. 

Variabel yang dapat terdampak dengan `setState()`:

- Variabel yang dideklarasikan di dalam State class (**_MyStatefulWidgetState, misalnya**): Hanya variabel yang berada di dalam State dari StatefulWidget yang bisa diperbarui menggunakan `setState().`

- **Properti UI dinamis**: Variabel yang mempengaruhi komponen UI (seperti warna, teks, ukuran, posisi, atau elemen visual lainnya) akan berdampak pada tampilan ketika diperbarui melalui `setState().`

- **Data yang mempengaruhi logika UI**: Variabel yang mengontrol logika UI, seperti toggle untuk visibilitas widget atau pilihan dalam dropdown, juga akan memicu pembaruan UI dengan `setState()`

## Perbedaan `const` dengan `final`
| Perbedaan            | const                                          | final                                  |
|----------------------|------------------------------------------------|----------------------------------------|
| Waktu Penetapan      | Harus ditetapkan saat kompilasi                | Dapat ditetapkan saat runtime          |
| Immutable            | Nilainya tetap dan tidak bisa diubah (immutable)| Immutable, tetapi nilainya bisa ditetapkan saat runtime |
| Kapan Digunakan      | Untuk nilai konstan yang diketahui sebelumnya (compile-time constants) | Untuk nilai yang hanya ditetapkan sekali tetapi mungkin diketahui saat runtime |

## Checklist step-by-step
Pertama-tama kita perlu mengikuti instalasi flutter sesuai tutorial.

Setelah itu, kita create project sesuai dengan e-commerce yang kita buat saat menggunakan web, yaitu Go Cafe, dengan menjalankan perintah dibawah ini di terminal.

```bash
flutter create go_cafe
cd go_cafe
```

lalu saat itu kita buka direktori lokal project, go_cafe/lib

kita tambahkan import package sesuai project yang dibuat, dan memindahkan class MyHomePage dan MyHomePageState ke file yang baru, yaitu menu.dart di direktori `lib/menu.dart`

Lalu, kita ubah widget menjadi *Stateless*, dengan menghapus `const MyHomePage(title: 'Flutter Demo Home Page')` di bagian home pada main.dart 

nanti tampilan main.dartnya seperti ini

```dart
import 'package:flutter/material.dart';
import 'package:go_cafe/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.brown,
        ).copyWith(secondary: Colors.brown[400]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

Pada berkas menu.dart, kita disuruh buat untuk mengubah widget-widget, seperti card dan icons. 

Lalu, di `menu.dart` juga diimplementasikan button dengan masing-masing button berbeda warna.
Saat memunculkan notifikasi saat button dipencet, yaitu menggunakan `onTap: ()` dan untuk menampilkan pesan yaitu menggunakan `ScaffoldMessenger.of(context)`. Berikut code yang diimplementasikan:

```dart
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },

```

Pada class ItemHomePage, kita tambahkan attribute untuk menambahkan color, seperti berikut

```dart
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
```

Setelah itu, pada class ItemCard, dalam widgetnya ubah return color menjadi seperti ini,
```dart
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Kayak gini
      ...
```

Dan kita tambahkan color sesuka kita didalam parameter ItemHomePage didalam class MyHomePage

```dart
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Product", Icons.list, Colors.brown.shade200),
    ItemHomepage("Tambah Product", Icons.add, Colors.blueGrey.shade600),
    ItemHomepage("Logout", Icons.logout, Colors.black38),
  ];
```













