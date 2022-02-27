import 'package:flutter/material.dart';

class profileScreenPage extends StatefulWidget {
  const profileScreenPage({ Key? key }) : super(key: key);

  @override
  _profileScreenPageState createState() => _profileScreenPageState();
}

class _profileScreenPageState extends State<profileScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}