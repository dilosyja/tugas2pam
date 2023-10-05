import 'package:flutter/material.dart';
import 'package:tugas2pam/beranda.dart';
import 'package:url_launcher/url_launcher.dart';

class DataKelompok extends StatelessWidget {
  void _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (error) {
      print('Error launching URL: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.door_back_door_outlined),
            color: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Beranda()),
              );
            }
        ),
        title: Text("Anggota Kelompok"),
        backgroundColor: Color(0xFF673AB7),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            child:
            InkWell(
              onTap: () => _launchURL('https://www.instagram.com/dilosyja/'),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('W'),
                  backgroundColor: Color(0xFF673AB7),
                  foregroundColor: Colors.white,
                ),
                title: Text('Wan Dilo Syuja Sherlieno 124210052'),
              ),
            ),
          ),
          InkWell(
            onTap: () => _launchURL('https://www.instagram.com/fadlilakbari/'),
            child: ListTile(
                leading: CircleAvatar(
                  child: Text('F'),
                  backgroundColor: Color(0xFF673AB7),
                  foregroundColor: Colors.white,
                ),
                title: Text('M Fadlil Akbari 124210059')),
          ),
          InkWell(
            onTap: () => _launchURL('https://www.instagram.com/aj.tma/'),
            child: ListTile(
                leading: CircleAvatar(
                  child: Text('T'),
                  backgroundColor: Color(0xFF673AB7),
                  foregroundColor: Colors.white,
                ),
                title: Text('M Syifa Aji Pratama 124210086')
            ),
          ),
        ],
      ),
    );
  }
}