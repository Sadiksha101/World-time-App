// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'choose_location.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day3.jpg' : 'night3.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue : Color.fromARGB(111, 10, 110, 94);

    return Scaffold(
      backgroundColor: bgColor,
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 115.0, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () => {Navigator.pushNamed(context, '/location')},
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[200],
                ),
                label: Text(
                  'Select Location',
                  style: TextStyle(color: Colors.grey[200]),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 66.0,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
