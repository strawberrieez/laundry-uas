import 'package:flutter/material.dart';
import 'package:laundry_uas/components/footer.dart';
import 'package:laundry_uas/components/navbar.dart';

import '../widgets/header_section.dart';
import '../widgets/laundry_form.dart';
import '../widgets/order_status.dart';
import '../widgets/price_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Buat GlobalKey untuk tiap section
  final GlobalKey _berandaKey = GlobalKey();
  final GlobalKey _layananKey = GlobalKey();
  final GlobalKey _hargaKey = GlobalKey();
  final GlobalKey _kontakKey = GlobalKey();

  void scrollToSection(String section) {
    BuildContext? contextToScroll;
    switch (section) {
      case 'beranda':
        contextToScroll = _berandaKey.currentContext;
        break;
      case 'layanan':
        contextToScroll = _layananKey.currentContext;
        break;
      case 'harga':
        contextToScroll = _hargaKey.currentContext;
        break;
      case 'kontak':
        contextToScroll = _kontakKey.currentContext;
        break;
    }

    if (contextToScroll != null) {
      Scrollable.ensureVisible(
        contextToScroll,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawerMobile(onItemSelected: scrollToSection),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Navbar
                Navbar(onItemSelected: scrollToSection),

                // Konten utama
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Beranda
                      Container(key: _berandaKey, child: const HeaderSection()),
                      const SizedBox(height: 40),

                      // Layanan
                      Container(key: _layananKey, child: const FormPemesanan()),
                      const SizedBox(height: 40),
                      const StatusPesanan(),
                      const SizedBox(height: 40),

                      // Harga
                      Container(key: _hargaKey, child: const DaftarHarga()),
                      const SizedBox(height: 40),

                      // Kontak (bagian dari Footer sekarang)
                      Container(key: _kontakKey),
                    ],
                  ),
                ),

                // Footer (tetap di luar padding agar full width)
                const Footer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
