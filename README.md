# Profil 
- Rajendra Rifqi Baskara - 2306245680
- Kelas: PBP C
#

# Content
- [TUGAS 7](#tugas-7)
- [TUGAS 8](#tugas-8)
- [TUGAS 9](#tugas-9)
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

# Tugas 9
[Back to Contents](#contents)
## Memperlukan untuk membuat model dalam pengambilan ataupun pengiriman data JSON. Dan apa yang terjadi jika tidak membuat model

Model dalam Django atau Flutter menyediakan stuktur data yang akan diproses dan dikirimkan antar aplikasi dan server, dengan model kita dapat memetakan data JSON ke objek dengan tipe data yang tepat untuk memudahkan kita dalam memanipulasi data.

Model juga memungkinkan kita untuk melakukan validasi dan pengolahan data dengan mudah.
Kita dapat memetakan data JSON menjadi objek Python (di backend Django) atau objek Dart (pada flutter) dengan mudah menggunakan model.

**APA YANG TERJADI JIKA TIDAK MEMBUAT MODEL**

Jika kita tidak membuat model dan hanya menangani JSON secara langsung tanpa pemetaan yang jelas, kesalahan terkait tipe data dapat terjadi, atau pengolahan data menjadi lebih rumit karena tidak ada struktur yang jelas. Tanpa model, kita harus melakukan parsing dan pengolahan JSON secara manual (rentan terhadap kesalahan).  

## Fungsi library *http* 
Library `http` di Flutter digunakan untuk melakukan komunikasi antara aplikasi Flutter dan server melalui ``HTTP``. Beberapa fungsinya:

Berguna untuk mengirimkan permintaan/request `HTTP` seperti GET, POST, PUT, DELETE, dan lain-lain. 

Pada tugas kali ini, saya menggunakan GET untuk mengambil data dan POST untuk mengirim data ke server Django. Seteleh mengirim permintaan `HTTP`, `http` memungkinkan kita untuk menangani responsenya, seperti memeriksa status kode (kode 200 untuk OK dan 500 untuk error) dan memproses data yang diterima dalam format seperti JSON.
Library ini juga memungkinkan kita untuk menangani error seperti timeouts atau kesalahan server dengan cara yang mudah.

## Fungsi dari `CookieRequest` dan instance `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi flutter

`CookieRequest` digunakan untuk menangani request HTTP dan mengelola cookies (seperti sesi atau token autentikasi) secara otomatis. Biasanya, `CookieRequest` menangani sesi login, mengingatkan server bahwa user yang sedang berinteraksi sudah terautentikasi, dan mengirimkan cookie bersama permintaan HTTP.

Instance `CookieRequest` perlu dibagikan ke seluruh aplikasi Flutter agar semua komponen aplikasi dapat mengakses dan menggunakan cookie yang telah disimpan (misalnya token otentikasi) untuk melakukan autentikasi tanpa perlu login lagi.

Dengan menggunakan Provider untuk membagikan instance `CookieRequest`, kita memastikan bahwa seluruh aplikasi mengakses request HTTP yang telah terautentikasi, menghindari keharusan memasukkan cookie secara manual di setiap komponen yang melakukan request HTTP.

## Mekanisme pengiriman data (mulai dari input hingga dapat ditampilkan pada Flutter)
Langkah-langkah Pengiriman Data:

- Pengguna memasukkan data (misalnya, nama produk, harga, atau deskripsi) melalui form input di aplikasi Flutter.
- Data yang dimasukkan dikirim ke server Django menggunakan request HTTP. Biasanya menggunakan metode POST dengan format JSON, yang dikirimkan melalui `http.post()` atau metode serupa.
- Server Django menerima data, memvalidasi, dan menyimpannya dalam database menggunakan model yang telah didefinisikan. Django kemudian mengirimkan respons, biasanya dalam format JSON, yang berisi status atau data yang disimpan.
- Flutter menerima respons dari server, misalnya menggunakan `http.get()` atau ``http.post()``, dan men-decode data JSON untuk digunakan dalam aplikasi.
- Data yang diterima (seperti daftar produk) ditampilkan dalam UI Flutter, biasanya menggunakan widget seperti ListView.builder atau widget lain yang sesuai dengan format data.

## Mekanisme Autentikasi dari Login, Register, Hingga Logout

Langkah-langkah Autentikasi:

1. Pengguna memasukkan informasi login (misalnya, email dan password) pada halaman login di aplikasi Flutter.
2. Data login dikirim ke server Django menggunakan request POST ke endpoint login (misalnya, /login/). Data ini biasanya dikirim dalam format JSON.
3. Django memeriksa data yang diterima, melakukan validasi password (biasanya menggunakan model User dan authenticate() dari Django). Jika data yang diterima valid, Django mengirimkan token autentikasi atau cookie yang menandakan sesi pengguna aktif.
4. Token atau cookie autentikasi disimpan di aplikasi Flutter, misalnya menggunakan package seperti shared_preferences untuk menyimpan token yang diperlukan untuk autentikasi di request HTTP selanjutnya.
5. Setelah autentikasi berhasil, menu aplikasi yang hanya dapat diakses oleh pengguna yang telah login ditampilkan. Aplikasi Flutter memeriksa apakah token autentikasi tersedia untuk memastikan pengguna sudah terautentikasi sebelum menampilkan menu.
6. Ketika pengguna memilih untuk logout, token atau cookie yang disimpan dihapus dan permintaan logout dikirim ke server Django. Biasanya menggunakan POST ke endpoint logout. Setelah logout berhasil, pengguna diarahkan kembali ke halaman login.


### Deployment proyek tugas Django
Karena deployment PWS masih error, jadi deploy hanya dilakukan didalam localhost

## Checklist step-by-step

Pertama-tama saya membuat app di Django dengan nama `authentication` di project Go Cafe Django saya. Dan melakukan inisiasi untuk awal pembuatan app atau fitur baru, seperti pada ``INSTALLED_APPS`` di `settings.py` project saya, melakukan instalasi django-cors-headers (menambahkan `django-cors-headers` ke requirements.txt terlebih dahulu), menambahkan corsheader ke `INSTALLED_APPS` di `settings.py` project saya, menambahkan corsheaders.middleware.CorsMiddleware ke MIDDLEWARE di `settings.py` project saya, menambahkan `10.0.2.2` pada ALLOWED_HOSTS di `settings.py` project saya, dan menambahkan variabel-variabel berikut pada `settings.py` project saya.

Lalu untuk implementasi registrasi akunnya, saya pertama-tama membuat fungsi didalam `authentication/views.py`dengan seperti ini

```python
from django.shortcuts import render

# Create your views here.
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from django.contrib.auth.models import User


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
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)
    

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

Dilihat diatas ada tiga fungsi, yaitu login, register, dan logout untuk user akunnya.

Lalu inisiasi semua function yang diimplementasi ke dalam `authentication/urls.py`
``` python
from django.urls import path
from authentication.views import login,register,logout

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('register/', register, name='register'),
    path('logout/', logout, name='logout'),
]
```

Setelah itu, untuk mengintegrasi Sistem autentikasi pada flutter, kita harus menginstal package didalam proyek flutter

`flutter pub add provider`
`flutter pub add pbp_django_auth`

Lalu kita modifikasi root widget untuk menyediakan `CookieRequest` library ke semua *child widgets* dengan menggunakan provider

``` dart
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
```

Implementasi provider ke semua fitur autentikasi yang dipakai didalam `lib/screens`.

Setelah itu, membuat list atau daftar item yang terdapat JSON di Django, dengan mengcopy product yang dibuat dari Django lalu open product tersebut dari JSON dan copy ke https://app.quicktype.io/ dengan name 'Product'. Lalu copy codenya dan taruh dengan membuat file di /lib/models/product_entry.dart

```dart
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    String pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
    };
}
```

Setalh itu, tampilkan item dengan membuat file baru di /screens/list_productentry.dart/

```dart
import 'package:flutter/material.dart';
import 'package:go_cafe/models/product_entry.dart';
import 'package:go_cafe/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchMood(CookieRequest request) async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.get('http://127.0.0.1:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object Product
    List<Product> listMood = [];
    for (var d in data) {
      if (d != null) {
        listMood.add(Product.fromJson(d));
      }
    }
    return listMood;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMood(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data product pada go cafe.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.description}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.price}"),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
```

saya membuat file baru pada screens dengan nama product_detail.dart yang digunakan untuk mendisplay detail dari suatu produk. kemudian saya hubungkan dengan list_productentry.dart (file pada point sebelumnya). berikut isi dari product_detail.dart:

```dart
import 'package:flutter/material.dart';
import 'package:go_cafe/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text("Description: ${product.fields.description}"),
            const SizedBox(height: 8),
            Text("Price: ${product.fields.price}"),
          ],
        ),
      ),
    );
  }
}


```

Setelah itu, tambahkan code dibawah ini didalam `list_productentry.dart`untuk melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.

```dart
  Future<List<Product>> fetchMood(CookieRequest request) async {
```

