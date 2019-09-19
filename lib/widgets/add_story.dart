import 'package:flutter/material.dart';

class AddStory extends StatefulWidget {
  @override
  _AddStoryState createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Icon(Icons.add),
          Icon(Icons.edit),
          Text('شروع پایش جدید'),
        ],
      ),
    );
  }
}
