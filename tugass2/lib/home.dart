import 'package:flutter/material.dart';
import 'package:tugass2/produk.dart';
import 'package:tugass2/profil.dart';

class Home extends StatefulWidget {
  final String username;  // Accept username as a parameter
  const Home({super.key, required this.username});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final List<String> _images = [
    'assets/hapus.jpeg', 
    'assets/pensil.jpeg', 
    'assets/spidol.jpeg', 
    'assets/buku.jpeg', 
  ];

  final List<String> _productNames = [
    'Penghapus',
    'Pensil',
    'Stabilo',
    'Buku Tulis',
  ];

  final List<String> _prices = [
    'Rp 5.000',
    'Rp 4.000',
    'Rp 10.000',
    'Rp 8.000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Alat Tulis'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Pass the username to the Profile screen
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return Profile(username: widget.username); // Use widget.username
                }),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal ListView for promotion posters
            SizedBox(
              height: 150.0, 
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 300.0,
                    child: Image.asset('assets/promo2.jpeg'),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 300.0,
                    child: Image.asset('assets/promo1.jpeg'),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 300.0,
                    child: Image.asset('assets/promo3.jpeg'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Welcome ${widget.username}!", // Display username
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _images.length, 
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0), 
                          child: Image.asset(
                            _images[index], 
                            height: 300, 
                            width: double.infinity, 
                            fit: BoxFit.cover, 
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _productNames[index], // Display product name
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          _prices[index], // Display product price
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Navigating to the Product Detail Page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Produk(
                                  image: _images[index],
                                  name: _productNames[index],
                                  price: _prices[index],
                                ),
                              ),
                            );
                          },
                          child: const Text('Beli'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
