import 'package:flutter/material.dart';
import '../data.dart';        // Import model Menu
import '../favorites.dart';  // Import tombol favorit

// Halaman untuk menampilkan detail satu menu
class DetailPage extends StatelessWidget {

  // Menyimpan data menu yang dipilih
  final Menu menu;

  const DetailPage({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // AppBar = bagian atas halaman
      appBar: AppBar(
        title: Text(menu.name), // Menampilkan nama menu
        actions: [
          // Tombol favorit berdasarkan ID menu
          FavButton(id: menu.id),
        ],
      ),

      // Isi utama halaman
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Hero = animasi gambar dari halaman sebelumnya
            Hero(
              tag: 'menu-${menu.id}',

              child: ClipRRect(
                // Membuat sudut gambar menjadi melengkung
                borderRadius: BorderRadius.circular(16),

                child: Image.network(
                  menu.image, // Mengambil gambar dari URL

                  height: 220,
                  width: double.infinity,

                  // Gambar memenuhi area yang tersedia
                  fit: BoxFit.cover,

                  // Jika gambar gagal dimuat
                  errorBuilder: (_, __, ___) => const SizedBox(
                    height: 220,
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Menampilkan nama menu
            Text(
              menu.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            // Menampilkan kategori menu
            Text(
              menu.category,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 12),

            // Menampilkan harga menu
            Text(
              menu.price,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 16),

            // Judul bagian deskripsi
            const Text(
              'Deskripsi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            // Menampilkan deskripsi menu
            Text(menu.description),
          ],
        ),
      ),
    );
  }
}