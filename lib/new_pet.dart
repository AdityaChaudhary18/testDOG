import 'package:flutter/material.dart';

class NewPet extends StatelessWidget {
  const NewPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Pet"),
      ),
      body: Center(
          child: Text(
        "New Pet Setup",
        style: TextStyle(fontSize: 40),
      )),
    );
  }
}
