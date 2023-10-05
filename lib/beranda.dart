import 'package:flutter/material.dart';
import 'package:tugas2pam/data_kelompok.dart';
import 'package:tugas2pam/favorite.dart';
import 'package:tugas2pam/login_page.dart';
import 'package:tugas2pam/panduan.dart';
import 'package:tugas2pam/rekomendasi.dart';
import 'package:tugas2pam/stopwatch.dart';
import 'package:tugas2pam/welcome_page.dart';

class Beranda extends StatefulWidget {
  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.door_back_door_outlined),
            color: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/fitness_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten di tengah
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Fitur 1
                FeatureWidget(
                  icon: Icons.people_alt,
                  title: 'Daftar Anggota       ',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DataKelompok()),
                    );
                  },
                ),
                // Fitur 2
                SizedBox(height: 10),
                FeatureWidget(
                  icon: Icons.lock_clock,
                  title: 'Stop Watch              ',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => StopwatchApp()),
                    );
                  },
                ),
                // Fitur 3
                SizedBox(height: 10),
                FeatureWidget(
                  icon: Icons.screen_search_desktop_outlined,
                  title: 'Situs Rekomendasi',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Rekomendasi()),
                    );
                  },
                ),
                SizedBox(height: 10),
                // Fitur 4
                FeatureWidget(
                  icon: Icons.favorite,
                  title: 'Favorite                   ',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Favorit()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF4E0189),
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Panduan()),
            );
          }
          else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            );
          }
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
              backgroundColor: Color(0xFF4E0189)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Panduan Aplikasi',
              backgroundColor: Color(0xFF4E0189)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Log Out',
              backgroundColor: Color(0xFF4E0189)
          ),
        ],
      ),
    );
  }
}

class FeatureWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  FeatureWidget({
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 50,
      ),
      label: Text(title),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(240, 70)), // Ubah ukuran sesuai keinginan Anda
      ),
    );
  }
}
