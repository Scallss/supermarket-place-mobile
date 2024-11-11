# Supermarket-Place
Place to fulfill your daily grocery needs!

# Tugas 7
## Implementation Checklist 
Untuk membuat 3 tombol dengan 3 warna berbeda dimulai dengan pertama-tama membuat project flutter, rapihkan struktur proyek dengan membuat file `menu.dart`. Untuk 3 tombol ini dibuat dengan kode berikut:
```
final List<ItemHomepage> items = [
      ItemHomepage("Lihat Mood", Icons.mood),
      ItemHomepage("Tambah Mood", Icons.add),
      ItemHomepage("Logout", Icons.logout),
  ];

  // Daftar warna untuk tombol-tombol
  final List<Color> buttonColors = [
      Colors.blue, // Warna untuk tombol Lihat Mood
      Colors.green, // Warna untuk tombol Tambah Mood
      Colors.red, // Warna untuk tombol Logout
  ];
```

setelah melakukan inisiasi informasi, kita bisa membuat class info card untuk menampilkan card masing-masing dengan kode berikut di `menu.dart`:
```
class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan title dan content.

  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
    final String name;
    final IconData icon;

    ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item; 
  final Color color;
  
  const ItemCard({super.key, required this.item, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
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

untuk menyatukan semuanya, kita buat widget untuk memberikan struktur dasar halaman dengan appBar dan Body:
```
@override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
        title: const Text(
          'Supermarket Place',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Supermarket Place',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: List.generate(items.length, (index) {
                      return ItemCard(
                        item: items[index],
                        color: buttonColors[index], // Warna tombol diambil dari daftar
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

Perlu diperhatikan kalau pembuatan itemCard dilakukan dengan List.Generate

## Stateless widget VS Stateful widget

StatelessWidget adalah jenis widget dalam Flutter yang tidak memiliki keadaan yang dapat berubah selama aplikasi berjalan. Setelah widget ini diinisialisasi, baik data maupun tampilannya tetap konstan. Contoh dari StatelessWidget meliputi tombol, label teks, atau ikon yang hanya menampilkan informasi statis. Widget ini ideal digunakan ketika tampilan yang diperlukan bersifat tetap dan tidak memerlukan pembaruan, kecuali jika seluruh widget perlu dibangun ulang.

Beda dengan StatelessWidget, StatefulWidget adalah widget yang memiliki keadaan yang dapat berubah selama aplikasi berjalan. Ketika keadaan ini berubah, widget dapat merender ulang tampilan sesuai dengan data baru. StatefulWidget digunakan untuk menangani data yang dinamis atau interaksi pengguna yang mempengaruhi tampilan. Dengan kata lain, jika kita ingin menciptakan elemen antarmuka yang responsif terhadap perubahan data atau aksi pengguna, maka StatefulWidget adalah pilihan yang tepat.

## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- MaterialApp, MaterialApp adalah widget utama dalam aplikasi Flutter yang menggunakan desain Material. Ini berfungsi sebagai kerangka dasar aplikasi dan menentukan tema serta tampilan awal aplikasi (halaman beranda dalam kasus ini).
- Scaffold, menyediakan struktur dasar untuk halaman aplikasi, seperti AppBar, body, dan floating action button. Ini memungkinkan kita untuk mengatur layout secara lebih mudah dengan menyediakan elemen standar aplikasi.
- AppBar, bagian atas halaman yang biasanya berisi judul atau aksi penting lainnya. Pada proyek ini, AppBar berfungsi untuk menampilkan nama aplikasi, yaitu "Supermarket Place".
- Card, Card digunakan untuk menampilkan konten dengan bingkai yang memiliki efek bayangan. Di sini, Card digunakan untuk membungkus InfoCard sehingga terlihat sebagai kartu informasi.
- InfoCard (Custom Widget), InfoCard adalah widget kustom yang menampilkan informasi dasar pengguna seperti NPM, nama, dan kelas. InfoCard dibuat dengan Card untuk tampilan berbingkai dan menggunakan Column untuk menyusun teksnya.
- ItemCard (Custom Widget), ItemCard adalah widget kustom yang menampilkan tombol dengan ikon dan teks untuk setiap item di halaman beranda. Setiap ItemCard diberi warna dan aksi khusus.
- InkWell,  widget yang memungkinkan deteksi sentuhan atau klik dengan efek ripple. Digunakan untuk menambahkan interaktivitas pada ItemCard, sehingga pengguna tahu saat item ditekan.
- SnackBar, menampilkan pesan sementara di bagian bawah layar saat aksi tertentu terjadi. Pada proyek ini, SnackBar digunakan untuk menampilkan pesan saat ItemCard ditekan.

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi setState() dalam Flutter digunakan untuk memberi tahu framework bahwa suatu objek State telah berubah, sehingga tampilan harus diperbarui. setState() biasanya digunakan di dalam StatefulWidget ketika ada perubahan pada state (status) yang perlu ditampilkan kembali pada antarmuka pengguna. Cara kerjanya adalah setState() memicu Flutter untuk memanggil ulang metode build() widget tersebut, sehingga elemen UI diperbarui.

Variabel yang dapat terdampak:
- Variabel yang digunakan untuk UI
- Variabel untuk Logika dan Penghitungan
- State yang Bergantung pada Input Pengguna

## Jelaskan perbedaan antara const dengan final!
Dalam Dart, const dan final adalah keyword yang digunakan untuk membuat variabel yang tidak dapat diubah (immutable). Perbedaannya adalah final digunakan untuk mendeklarasikan variabel yang hanya bisa diinisialisasi sekali, dan nilai final bisa dideklarasikan saat runtime, jadi cocok untuk nilai yang belum diketahui hingga program jalan. Beda dengan const, yang digunakan untuk membuat variabel yang nilai atau objeknya bersifat konstan sejak compile-time. Ini berarti nilai harus diketahui sebelum program dijalankan. Variabel const biasanya digunakan untuk nilai konstan yang sudah pasti dan tidak bergantung pada waktu atau kondisi program. Pada variabel objek, const menjadikan semua elemen dalam objek tersebut juga konstan.

# Tugas 8
## Kegunaan Const di Flutter
const digunakan untuk membuat widget atau objek yang bersifat immutable (tidak dapat diubah). Jika suatu widget didefinisikan sebagai const, Flutter menganggap bahwa widget tersebut tidak akan berubah selama program berjalan, sehingga widget tersebut tidak perlu build ulang setiap kali ada perubahan di dalam aplikasi. Keuntungan menggunakan const dengan tepat meliputi optimalisasi peforma dan juga efisiensi alokasi memori yang mana karena const bersifat tetap, wdiget yang dideklarasikan dalam const tidak akan dialokasikan ulang dalam memori setelah dibuat. const sebaiknya digunakan pada widget yang tidak akan berubah setelah didefinisikan, seperti Text, Icon, atau layout sederhana yang hanya tampil sekali tanpa dipengaruhi oleh interaksi pengguna. Jangan gunakan const jika widget dapat berubah berdasarkan input atau state, seperti di StatefulWidget yang tampilan bergantung pada variabel yang akan diperbarui.

## Kegunaan row dan column pada Flutter
Di flutter, Column dan Row adalah widget layout dasar yang digunakan untuk menyusun widget. Column adalah widget yang menyusun child elementnya secara vertikal (dari atas ke bawah) sedangkan row adalah widget yang menyusun anak-anaknya secara horizontal (dari kiri ke kanan). 
contoh implementasi `column`:
```
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Text('Halo'),
    Text('ini adalah'),
    Text('Column'),
  ],
)
```

contoh implementasi `row`:
```
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Icon(Icons.home),
    Icon(Icons.star),
    Icon(Icons.settings),
  ],
)
```

## Elemen input pada halaman form 
Elemen input yang digunakan:
- TextFormField, Digunakan untuk menginput teks pada kolom Product Name, Description, dan Product Amount.
- ElevatedButton, Digunakan sebagai tombol untuk menyimpan data produk ketika form sudah diisi dengan benar.

Elemen input yang tidak digunakan:
- DropdownButtonFormField, cocok untuk memberikan pilihan terbatas dari opsi yang ada, seperti kategori produk atau jenis produk.
- Checkbox, digunakan untuk input pilihan biner, seperti konfirmasi atau persetujuan dari pengguna.
- Slider, cocok untuk input dengan rentang nilai, seperti harga atau tingkat kepuasan.

## Membuat Theme pada Flutter agar aplikasi konsisten
Saya mengatur konsistensi tampilan aplikasi dengan menggunakan Theme data pada `main.dart`. Di dalamnya terdapat color scheme untuk memastikan tema aplikasi terjaga dan sama.

## Menangani navigasi 
Dengan menggunakan drawer yang tersedia pada flutter dan juga Infocard pada menu utama untuk menavigasi banyak halaman pada flutter. Contohnya seperti kode `left_drawer.dart` berikut yang membuat navigasi ke halaman utama dan tambah item:
```
import 'package:flutter/material.dart';
import 'package:supermarket_place/screens/menu.dart';
import 'package:supermarket_place/screens/productentry_form.dart';

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
                  'Supermarket Place',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Place to fulfill your daily grocery needs!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  )
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
              leading: const Icon(Icons.mood),
              title: const Text('Tambah Item'),
              // Bagian redirection ke Tambah Produk
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductEntryFormPage(),
                    ));
              },
            ),
        ],
      ),
    );
  }
}
```
