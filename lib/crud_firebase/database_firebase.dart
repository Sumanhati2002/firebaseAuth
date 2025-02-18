import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_firebase/crud_firebase/database_func.dart';
import 'package:sample_firebase/crud_firebase/pets.dart';

class DatabaseOption extends StatefulWidget {
  const DatabaseOption({super.key});

  @override
  State<DatabaseOption> createState() => _DatabaseOptionState();
}

class _DatabaseOptionState extends State<DatabaseOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataBase'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.leave_bags_at_home))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  //create('pets', 'kitty', 'jerry', "cat", 7);
                  create('pets', 'tom', 'jacki', "dog", 10);
                },
                child: const Text('Create')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PetsList()));
                },
                child: const Text('Read')),
            ElevatedButton(
                onPressed: () {
                  updateData('pets', 'kitty', 'age', 9);
                },
                child: const Text('Update')),
            ElevatedButton(
                onPressed: () {
                  deleteData('pets', 'tom');
                },
                child: const Text('Delete'))
          ],
        ),
      ),
    );
  }
}
