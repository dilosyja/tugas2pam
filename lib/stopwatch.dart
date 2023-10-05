import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:tugas2pam/beranda.dart';

class StopwatchApp extends StatefulWidget {
  @override
  _StopwatchApp createState() => _StopwatchApp();
}

class _StopwatchApp extends State<StopwatchApp> {
  var _stopwatch = Stopwatch();
  var _isRunning = false;
  var _elapsedTime = Duration.zero;

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
        title: Text('Stopwatch'),
        backgroundColor: Color(0xFF4E0189),
        foregroundColor: Colors.white ,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/fitness_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 200),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    formatTime(_elapsedTime),
                    style: TextStyle(fontSize: 48.0),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (_isRunning) {
                            _stopwatch.stop();
                          } else {
                            _stopwatch.start();
                            Timer.periodic(
                                Duration(milliseconds: 100), _updateTime);
                          }
                          setState(() {
                            _isRunning = !_isRunning;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF4E0189), // Background color
                            onPrimary: Colors.white),
                        child: Text(_isRunning ? 'Stop' : 'Start'),
                      ),
                      SizedBox(width: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (!_isRunning) {
                            _stopwatch.reset();
                            setState(() {
                              _elapsedTime = Duration.zero;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF4E0189), // Background color
                            onPrimary: Colors.white),
                        child: Text('Reset'),
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

  void _updateTime(Timer timer) {
    if (_stopwatch.isRunning) {
      setState(() {
        _elapsedTime = _stopwatch.elapsed;
      });
    }
  }

  String formatTime(Duration duration) {
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    String milliseconds = (duration.inMilliseconds % 1000).toString().padLeft(3, '0').substring(0, 2);
    return '$minutes:$seconds.$milliseconds';
  }
}