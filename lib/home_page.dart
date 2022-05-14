import 'package:auth_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Home"),
            Text(
              user.email!,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: Icon(Icons.logout),
                  label: Text(
                    "Sign out",
                    style: TextStyle(fontSize: 24),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            // ElevatedButton.icon(
            //     onPressed: () {},
            //     icon: Icon(Icons.create),
            //     label: Text(
            //       "Sign up",
            //       style: TextStyle(fontSize: 24),
            //     ))
          ],
        ),
      ),
    );
  }
}
