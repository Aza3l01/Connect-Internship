// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final List<Map<String, dynamic>> searchUsers = [
    {
      'profileImageUrl': 'https://i.imgur.com/NEJGfRn.jpg',
      'username': 'vyshnav',
      'fullName': 'Vyshnav',
    },
    {
      'profileImageUrl': 'https://i.imgur.com/NEJGfRn.jpg',
      'username': 'minaan',
      'fullName': 'Minan',
    },
    {
      'profileImageUrl': 'https://i.imgur.com/NEJGfRn.jpg',
      'username': 'jeff',
      'fullName': 'Jeff',
    },
    {
      'profileImageUrl': 'https://i.imgur.com/NEJGfRn.jpg',
      'username': 'jeff1',
      'fullName': 'Jeff',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                filled: true,
                fillColor: Color.fromARGB(255, 39, 39, 39),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: searchUsers.length,
          itemBuilder: (context, index) {
            var data = searchUsers[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(data['profileImageUrl']),
              ),
              title: Text(data['username']),
              subtitle: Text(data['fullName']),
            );
          }),
    );
  }
}
