import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_candraprasetya/NavBar/navigation_bar.dart';
import 'package:firebase_candraprasetya/NavBar/navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Homepage'),
        ),
        bottomNavigationBar: TitledBottomNavigationBar(
            onTap: (index) {
              print("Selected Index: $index");
            },
            items: [
              TitledNavigationBarItem(title: 'Home', icon: Icons.home),
              TitledNavigationBarItem(title: 'Search', icon: Icons.search),
              TitledNavigationBarItem(title: 'Bag', icon: Icons.card_travel),
              TitledNavigationBarItem(
                  title: 'Orders', icon: Icons.shopping_cart),
              TitledNavigationBarItem(
                  title: 'Profile', icon: Icons.person_outline),
            ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('users')
                  .document(user.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Text('Loading...');
                  default:
                    return checkRole(snapshot.data);
                  // return Text(snapshot.data['name']);
                }
              },
            ),
          ],
        ));
  }

  Center checkRole(DocumentSnapshot snapshot) {
    if (snapshot.data['role'] == 'admin') {
      return adminPage(snapshot);
    } else {
      return userPage(snapshot);
    }
  }

  Center adminPage(DocumentSnapshot snapshot) {
    return Center(
        child: Text('${snapshot.data['role']} ${snapshot.data['name']}'));
  }

  Center userPage(DocumentSnapshot snapshot) {
    return Center(child: Text(snapshot.data['role']));
  }
}
