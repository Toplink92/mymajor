// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mymajor/userService.dart';

import 'detailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = UserService().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'People',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            var users = await UserService().getUser();
            setState(() {
              futureUsers = Future.value(users);
            });
          },
          child: Center(
            child: FutureBuilder<List<User>>(
              future: futureUsers,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemCount: snapshot.data.length,
                    itemBuilder: ((context, index) {
                      var user = snapshot.data[index];
                      return InkWell(
                        onTap: () => openPage(context, user),
                        child: ListTile(
                          title: Text(user.email),
                          subtitle: Text(user.name.first),
                          trailing: const Icon(Icons.chevron_right_outlined),
                        ),
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return const Divider(color: Colors.black26);
                    }),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error :${snapshot.error}');
                }
                return const CircularProgressIndicator(
                  backgroundColor: Colors.yellowAccent,
                  strokeWidth: BorderSide.strokeAlignOutside,
                );
              },
            ),
          ),
        ));
  }

  openPage(context, user) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailPage(user: user)));
  }

  final items = List.generate(51, (i) => i);
}

/*return InkWell(
                onTap: () => openPage(context),
                child: ListTile(
                  title: Text('Number $item'),
                  subtitle: const Text('correct'),
                  trailing: const Icon(Icons.chevron_right_outlined),
                ),
              );*/