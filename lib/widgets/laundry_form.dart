import 'package:flutter/material.dart';
import 'package:laundry_uas/widgets/rincianPesanan.dart';

class FormPemesanan extends StatefulWidget {
  const FormPemesanan({super.key});

  @override
  State<FormPemesanan> createState() => _FormPemesananState();
}

class _FormPemesananState extends State<FormPemesanan> {
  String? jenisLayanan;
  String pengantaran = 'Antar-Jemput';
  final TextEditingController beratController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final List<String> jenisPakaianDipilih = [];

  final List<String> jenisPakaian = [
    'Pakaian Biasa',
    'Pakaian Dalam',
    'Selimut/Bed Cover',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Formulir Pemesanan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Isi formulir di bawah ini untuk memesan layanan laundry',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),

            // Nama
            const Text('Nama'),
            const SizedBox(height: 8),
            TextFormField(
              controller: namaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan nama lengkap',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama harus diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Alamat
            const Text('Alamat'),
            const SizedBox(height: 8),
            TextFormField(
              controller: alamatController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan alamat lengkap',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Alamat harus diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Nomor HP
            const Text('Nomor HP'),
            const SizedBox(height: 8),
            TextFormField(
              controller: noHpController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan nomor HP',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nomor HP harus diisi';
                }
                if (value.length < 10) {
                  return 'Nomor HP tidak valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Jenis Layanan
            const Text('Jenis Layanan'),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: jenisLayanan,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: ['Cuci Kering', 'Cuci Basah', 'Setrika']
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  jenisLayanan = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Berat Pakaian
            const Text('Berat Pakaian (Kg)'),
            const SizedBox(height: 8),
            TextFormField(
              controller: beratController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan berat pakaian',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Berat pakaian harus diisi';
                }
                if (double.tryParse(value) == null) {
                  return 'Berat harus berupa angka';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Jenis Pakaian
            const Text('Jenis Pakaian'),
            const SizedBox(height: 8),
            ...jenisPakaian.map((pakaian) {
              return CheckboxListTile(
                title: Text(pakaian),
                value: jenisPakaianDipilih.contains(pakaian),
                onChanged: (selected) {
                  setState(() {
                    selected!
                        ? jenisPakaianDipilih.add(pakaian)
                        : jenisPakaianDipilih.remove(pakaian);
                  });
                },
              );
            }),

            const SizedBox(height: 20),

            // Pengambilan / Pengantaran
            const Text('Pengambilan/Pengantaran'),
            RadioListTile(
              title: const Text('Antar-Jemput'),
              value: 'Antar-Jemput',
              groupValue: pengantaran,
              onChanged: (value) {
                setState(() {
                  pengantaran = value!;
                });
              },
            ),
            RadioListTile(
              title: const Text('Ambil Sendiri'),
              value: 'Ambil Sendiri',
              groupValue: pengantaran,
              onChanged: (value) {
                setState(() {
                  pengantaran = value!;
                });
              },
            ),
            const SizedBox(height: 20),

            // Tombol Submit
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Validasi input
                  if (jenisLayanan == null ||
                      beratController.text.isEmpty ||
                      jenisPakaianDipilih.isEmpty ||
                      namaController.text.isEmpty ||
                      alamatController.text.isEmpty ||
                      noHpController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Silakan lengkapi semua data')),
                    );
                    return;
                  }

                  // Aksi ketika tombol "Pesan Sekarang" ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RincianPesanan(
                        jenisLayanan: jenisLayanan ?? '',
                        berat: beratController.text,
                        jenisPakaian: jenisPakaianDipilih,
                        pengantaran: pengantaran,
                        nama: '',
                        alamat: '',
                        nomorHp: '',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Pesan Sekarang',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
