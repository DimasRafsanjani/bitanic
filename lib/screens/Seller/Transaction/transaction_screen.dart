import 'package:flutter/material.dart';

class transactionScreenPage extends StatefulWidget {
  const transactionScreenPage({ Key? key }) : super(key: key);

  @override
  _transactionScreenPageState createState() => _transactionScreenPageState();
}

class _transactionScreenPageState extends State<transactionScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Transaction Screen'),
      ),
    );
  }
}