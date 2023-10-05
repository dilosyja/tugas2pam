import 'package:flutter/material.dart';
import 'package:tugas2pam/beranda.dart';
import 'package:tugas2pam/situs_rekomendasi.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/painting/image_provider.dart';

class Favorit extends StatelessWidget {
  final List<Situs> favoriteSitusList =
  listSitus.where((situs) => situs.isFavorite).toList();

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
        title: Text('Situs Favorit'),
        backgroundColor: Color(0xFF673AB7),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: favoriteSitusList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5,8,0,0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(favoriteSitusList[index].image),
                backgroundColor: Colors.transparent,
              ),
              title: InkWell(
                onTap: () {
                  _launchURL(favoriteSitusList[index].siteUrl);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(favoriteSitusList[index].name),
                          Text(
                            favoriteSitusList[index].siteUrl,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}