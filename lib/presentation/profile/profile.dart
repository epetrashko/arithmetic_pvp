import 'dart:developer';

import 'package:arithmetic_pvp/presentation/profile/achievements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "Loading...";
  String email = "Loading...";
  final ProfileBloc _profileBloc = ProfileBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileBloc.add(ProfileUserEventLoad());
  }

  void showUserInfo(BuildContext context, ProfileState state) {
    if (state is ProfileStateLoaded){
      log(state.user.toString());
      setState(() {
        username = state.user?.username ?? "Loading...";
        email = state.user?.email ?? "Loading...";
      });
    }else if (state is ProfileStateError){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.error),
      ));
    }
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Settings'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Setting 1'),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Set",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Setting 2'),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Set",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Setting 3'),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Set",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Setting 4'),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Set",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: const Text('Close')),
              TextButton(
                onPressed: () {
                  //print('HelloWorld!');
                  _dismissDialog();
                },
                child: const Text('Apply'),
              )
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: _showMaterialDialog,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 10, bottom: 20),
                child: const Text(
                  "My Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset('assets/logo.png', width: 100),
                ),
              ),
              BlocProvider(
                create: (BuildContext context) => _profileBloc,
                child: BlocListener<ProfileBloc, ProfileState>(
                  listener: (context, state) => showUserInfo(context, state),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      username,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.monetization_on, color: Colors.amber),
                    Text(
                      "2281337",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.stars, color: Colors.blue),
                    Text(
                      "9999999",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Edit profile",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10, bottom: 30),
                child: const Text(
                  'Achievements',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(minHeight: 80, minWidth: 50),
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Wrap(
                        children: const [
                          Icon(
                            Icons.favorite,
                            size: 40,
                            color: Colors.red,
                          ),
                          Icon(
                            Icons.audiotrack,
                            size: 40,
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.beach_access,
                            size: 40,
                            color: Colors.pink,
                          ),
                          Icon(
                            Icons.savings,
                            size: 40,
                            color: Colors.amberAccent,
                          ),
                          Icon(
                            Icons.explore,
                            size: 40,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AchievementsPage(),
                    ),
                  );
                },
                child: const Text(
                  "See more",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}