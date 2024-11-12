# Profil 
- Rajendra Rifqi Baskara - 2306245680
- Kelas: PBP C
#

# Content
- [TUGAS 7](#tugas-7)
- [TUGAS 8](#tugas-8)
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

# Tugas 8
[Back to Contents](#contents)

## Kegunaan dan keuntungan `const` di dalam flutter dan kapan waktu yang pas saat menggunakan `const`

Menggunakan const, dapat menetapkan nilai tetap atau *immutable*, memastikan widget tidak membutuhkan rebuild yang tidak diperlukan.
```dart
title: const Text('Product berhasil tersimpan'),
```
Keuntungan saat menggunakan `const` di dalam widget, flutter tidak akan rebuild widget tersebut ketika `setState()` atau build ulang dijalankan

Waktu untuk menggunakan `const`:
- Sebaiknya: 
1. Gunakan `const` untuk Widget Stateless (widget yang tidak perlu berubah, seperti teks atau layout)dan Reusable Widget

- Tidak Disarankan: 
1. Jangan menggunakan `const` saat suatu widget memiliki nilai yang berubah-ubah selama runtime
2. Jika widget perlu direbuild sesuai dengan perubahan `setState()` jangan gunakan `const`


## Penggunaan Column dan Row pada Flutter. Dan contohnya dari masing-masing layout widget

Dalam flutter, column dan row adalah widget yang digunakan untuk menyusun elemen-elemen dalam tata letak vertikal (untuk colomn) atau horizontal (untuk row). Dan keduanya adalah `flex`

| Fitur                | Column                        | Row                            |
|----------------------|-------------------------------|--------------------------------|
| Arah Tata Letak      | Vertikal (atas ke bawah)      | Horizontal (kiri ke kanan)     |
| Sumbu Utama          | Vertikal                      | Horizontal                     |
| Sumbu Silang         | Horizontal                    | Vertikal                       |
| Penggunaan Utama     | Menyusun widget bertingkat    | Menyusun widget berdampingan   |
| Parameter Utama      | mainAxisAlignment,   crossAxisAlignment         | mainAxisAlignment,   crossAxisAlignment             |            |
| Keterbatasan         | Membutuhkan ruang vertikal    | Membutuhkan ruang horizontal   |

Contoh `column`
```dart
import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contoh Column')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ini adalah teks pertama'),
          Text('Ini adalah teks kedua'),
          Icon(Icons.star),
          ElevatedButton(
            onPressed: () {},
            child: Text('Tombol'),
          ),
        ],
      ),
    );
  }
}
```

Contoh `row`
```dart
import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contoh Row')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.home),
          Text('Beranda'),
          ElevatedButton(
            onPressed: () {},
            child: Text('Klik Saya'),
          ),
        ],
      ),
    );
  }
}
```

## Elemen-elemen input yang digunakan
1. **TextFormField**
= Digunakan untuk input teks pada tiga bidang berbeda:
- Product: Menyimpan nama produk.
- Description: Menyimpan deskripsi produk.
- Amount of Product: Menyimpan jumlah produk.

```dart
child: TextFormField(
decoration: InputDecoration(
  hintText: "Product",
  labelText: "Product",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
),
```

          
2. **ElevatedButton**
= Digunakan sebagai tombol Save untuk menyimpan data form. Dan saat tombol ditekan, jika validasi form berhasil, sebuah dialog konfirmasi akan muncul.
```dart
child: ElevatedButton(
style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all(
      Theme.of(context).colorScheme.primary),
),
onPressed: () {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Product berhasil tersimpan'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product: $_name'),
                Text('Description: $_description'),
                Text('Amount of Product: $_amount'),
              ],
            ),
            ...

```
## Elemen-elemen input yang tidak digunakan
1. **DropdownButtonFormField**: Untuk memilih dari opsi tertentu.
2. **Checkbox** atau **Switch**: Untuk memilih antara dua nilai, seperti true atau false.
3. **RadioButton**: Untuk memilih satu dari beberapa pilihan.
4. **Slider**: Untuk memilih nilai dalam rentang tertentu.
5. **DatePicker** atau **TimePicker**: Untuk memilih tanggal atau waktu.

## Cara untuk mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten dan implementasi tema pada aplikasi yang dibuat

Berikut adalah langkah-langkah untuk mengatur tema (theme) secara konsisten:

Pada aplikasi Go Cafe ini, tema sudah diterapkan untuk menjaga konsistensi visual. Tema diatur pada file main.dart dengan menggunakan parameter ThemeData pada MaterialApp, yang mencakup:

1. **Color Scheme**: Menggunakan ColorScheme.fromSwatch untuk membuat skema warna aplikasi. Warna utama (primarySwatch) diset ke warna brown sebagai tema utama, dan secondary warna brown[400].
   
2. **Material3**: Pengaturan useMaterial3: true membuat aplikasi mengikuti desain dan elemen gaya terbaru dari Material Design 3, memberikan tampilan modern.

Cara Implementasi Tema dan Penggunaannya di `menu.dart`:

Tema ini diterapkan di seluruh aplikasi, memungkinkan widget seperti `AppBar` dan `ElevatedButton` untuk otomatis mengikuti skema warna yang sudah didefinisikan di ThemeData:
   - Di AppBar, backgroundColor diambil langsung dari ``Theme.of(context).colorScheme.primary`` untuk memastikan konsistensi warna.
   - Tombol Save pada form juga mengikuti warna tema utama melalui `Theme.of(context).colorScheme.primary`.


Implementasi tema ini memungkinkan widget tertentu mengikuti gaya yang konsisten tanpa mengatur warna secara manual di setiap widget

## Cara menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Berikut adalah cara untuk mengelola navigasi dalam Flutter:

1. Navigator dengan push dan pop
= `Navigator.push()` digunakan untuk mendorong halaman baru ke atas tumpukan halaman, sedangkan `Navigator.pop()` digunakan untuk menghapus halaman teratas, kembali ke halaman sebelumnya.



```dart
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
```

ListTile untuk "Tambah Product": Menggunakan `Navigator.push` untuk membuka halaman `ProductEntryFormPage.`


```dart
actions: [
  TextButton(
    child: const Text('OK'),
    onPressed: () {
      Navigator.pop(context);
      _formKey.currentState!.reset();
    },
  ),
],
```
membuka dialog konfirmasi dan ingin menutupnya setelah pengguna menekan tombol "`OK`", Anda bisa memanggil `Navigator.pop()` di dalam onPressed tombol tersebut.

2. Navigator Push Replacement
= ListTile untuk "Halaman Utama": Menggunakan `Navigator.pushReplacement` untuk menggantikan halaman saat ini dengan MyHomePage

```dart
onTap: () {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ));
},
```















