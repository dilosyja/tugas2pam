import 'package:flutter/material.dart';
import 'package:tugas2pam/beranda.dart';
import 'package:tugas2pam/welcome_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/fitness_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten login
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Login First',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      icon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      icon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => WelcomePage()),
                          );
                        },
                        child: Text('Back'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          onPrimary: Colors.white,
                        ),// Warna tombol
                      ),
                      ElevatedButton(
                        onPressed: () {
                          String message= "";
                          //cek login
                          String username = _usernameController.text;
                          String password = _passwordController.text;

                          if (username == '1' && password == '1') {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Beranda()),
                            );
                            setState(() {
                              message = 'Login Berhasil';
                              isLogin = true;
                            });
                          } else {
                            message = 'Login Gagal';
                            isLogin = false;
                          }
                          var snackBar = SnackBar(content: Text(message),
                            backgroundColor: (isLogin)? Colors.green: Colors.red,
                            duration: Duration(seconds: 1),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          onPrimary: Colors.white,
                        ),// Warna tombol
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
