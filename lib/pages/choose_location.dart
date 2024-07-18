// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      location: 'Tokyo',
      flag: 'tokyo.png',
      url: 'Asia/Tokyo',
    ),
    WorldTime(
      location: 'Kathmandu',
      flag: 'ktm.jpg',
      url: 'Asia/Kathmandu',
    ),
    WorldTime(
      location: 'Seoul',
      flag: 'seoul.jpg',
      url: 'Asia/Seoul',
    ),
    WorldTime(
      location: 'New York',
      flag: 'usa.jpg',
      url: 'America/New_York',
    ),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(102, 161, 201, 0.812),
        appBar: AppBar(
          title: Text('World Time'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 5.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      title: Text(locations[index].location),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/${locations[index].flag}'),
                      ),
                    ),
                  ));
            },
          ),
        ));
  }
}
