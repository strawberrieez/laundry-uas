import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final Function(String section) onItemSelected;

  const Navbar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Mobile Layout
    if (screenWidth < 800) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'LOGO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      );
    }

    // Desktop Layout
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'LOGO',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.indigo,
              letterSpacing: 1.5,
            ),
          ),
          Row(
            children: [
              _buildMenuItem('Beranda', 'beranda'),
              _buildMenuItem('Layanan', 'layanan'),
              _buildMenuItem('Harga', 'harga'),
              _buildMenuItem('Kontak', 'kontak'),
              _buildMenuItem('Status Pesanan', 'status'),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child:
                    const Text('Masuk', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child:
                    const Text('Daftar', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String label, String section) {
    return InkWell(
      onTap: () => onItemSelected(section),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class NavigationDrawerMobile extends StatelessWidget {
  final Function(String section) onItemSelected;

  const NavigationDrawerMobile({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            _buildListTile(context, Icons.home, 'Beranda', 'beranda'),
            _buildListTile(
                context, Icons.miscellaneous_services, 'Layanan', 'layanan'),
            _buildListTile(context, Icons.price_change, 'Harga', 'harga'),
            _buildListTile(context, Icons.phone, 'Kontak', 'kontak'),
            _buildListTile(context, Icons.assignment_turned_in,
                'Status Pesanan', 'status'),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Masuk'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.app_registration),
              title: const Text('Daftar'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(
      BuildContext context, IconData icon, String label, String section) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.pop(context);
        onItemSelected(section);
      },
    );
  }
}
