// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:mymajor/userService.dart';

class DetailPage extends StatelessWidget {
  final User user;
  const DetailPage({super.key, required this.user});

  goBack(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${user.name.first} ${user.name.last}',
            style: const TextStyle(color: Colors.white),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Image.network(
                  user.picture,
                  scale: 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.name.first,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      user.name.last,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
                Text(
                  user.email,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ],
            ),
          ),
        ));
  }
}
