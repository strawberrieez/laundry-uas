import 'package:flutter/material.dart';

class DaftarHarga extends StatelessWidget {
  const DaftarHarga({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // <-- Ini bikin semuanya center
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Daftar Harga',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center, // <-- Teks judul di tengah
            ),
            const SizedBox(height: 8),
            const Text(
              'Harga terjangkau dengan kualitas terbaik',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center, // <-- Teks deskripsi di tengah
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center, // <-- Kartu-kartu di tengah
              children: const [
                _HargaCard(
                  title: 'Cuci Kering',
                  price: 'Rp 7.000',
                  benefits: [
                    'Durasi 2 hari',
                    'Termasuk deterjen premium',
                    'Gratis pengantaran',
                  ],
                ),
                _HargaCard(
                  title: 'Cuci Setrika',
                  price: 'Rp 10.000',
                  benefits: [
                    'Durasi 3 hari',
                    'Termasuk deterjen premium',
                    'Gratis pengantaran',
                    'Setrika rapi',
                  ],
                ),
                _HargaCard(
                  title: 'Express (6 Jam)',
                  price: 'Rp 15.000',
                  benefits: [
                    'Selesai dalam 6 jam',
                    'Termasuk deterjen premium',
                    'Gratis pengantaran express',
                    'Setrika rapi',
                    'Prioritas',
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HargaCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> benefits;

  const _HargaCard({
    required this.title,
    required this.price,
    required this.benefits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$price/kg',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          ...benefits.map((b) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        color: Colors.green, size: 18),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        b,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
