import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';
import 'widgets/profile_header_card.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            backgroundColor: Color(0xFF1B1B1B),
            title: Text("Profile"),
            actions: [
              /*IconButton(
                  onPressed: () {},
                  icon: Badge(
                      textColor: Colors.white,
                      label: Text("5"),
                      child: Icon(Icons.notifications))),*/
              PopupMenuButton(
                  child: Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => LoginView())));
                        },
                      ))
                    ];
                  })
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  ProfileHeaderCard(
                    userId: userId,
                  )
                ];
              },
              body: Column(
                children: [
                  TabBar(tabs: [
                    Tab(
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ]),
                  Expanded(
                    child: TabBarView(children: [
                      //ProfilePostCards(),
                    ]),
                  )
                ],
              ))),
    );
  }
}
