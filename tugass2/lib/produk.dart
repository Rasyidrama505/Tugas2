import 'package:flutter/material.dart';
import 'package:tugass2/home.dart';

class Produk extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const Produk({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name), // Menggunakan nama produk sebagai judul halaman
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Aksi untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Center(
              child: Image.asset(
                image,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Nama Produk dan Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.yellow),
                    Text('4.5') // Rating statis, bisa diganti dengan data dinamis
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Deskripsi Produk
            const Text(
              'Description:\nProduk ini merupakan barang berkualitas tinggi yang terbuat dari material terbaik. Sangat cocok untuk kebutuhan sehari-hari.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Harga Produk dan Tombol Beli
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Menampilkan snackbar ketika pembelian berhasil
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Pembelian berhasil!'),
                      ),
                    );
                  },
                  child: const Text('Buy'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
