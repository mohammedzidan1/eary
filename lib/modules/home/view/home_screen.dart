import 'package:eary/core/app_routes/routes_mames.dart';
import 'package:eary/modules/authontication/model/user.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? searchValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home'), actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.pushNamed(context, RoutsNames.search);
          },
        ),
      ]),
      body: ModelGetBuilder<UserModel>(builder: (context, snapshot) {
        return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (_, index) {
              UserModel? user = snapshot.data?[index];
              return Text(user?.userName ?? '');
            });
      }),
    );
  }
}
