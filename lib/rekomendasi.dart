import 'package:flutter/material.dart';
import 'package:tugas2pam/beranda.dart';
import 'package:tugas2pam/situs_rekomendasi.dart';
import 'package:url_launcher/url_launcher.dart';


class Rekomendasi extends StatefulWidget {
  @override
  _Rekomendasi createState() => _Rekomendasi();
}

class _Rekomendasi extends State<Rekomendasi> {

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

  void _toggleFavorite(int index) {
    setState(() {
      listSitus[index].isFavorite = !listSitus[index].isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.door_back_door_outlined),
              color: Colors.white,
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Beranda()),
                );
              }
          ),
          title: Text('Situs Rekomendasi'),
          backgroundColor: Color(0xFF673AB7),
          foregroundColor: Colors.white ,
        ),
        body: ListView.builder(
          itemCount: listSitus.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(5,8,0,0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(listSitus[index].image),
                  backgroundColor: Colors.transparent,
                ),
                title: InkWell(
                  onTap: () {
                    _launchURL(listSitus[index].siteUrl);
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
                            Text(listSitus[index].name),
                            Text(
                              listSitus[index].siteUrl,
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
                trailing: InkWell(
                  onTap: () {
                    _toggleFavorite(index); // Toggle favorite for the specific item
                    print('$index ${listSitus[index].isFavorite}');
                  },
                  child: Icon(
                    listSitus[index].isFavorite
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: Colors.yellow,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}