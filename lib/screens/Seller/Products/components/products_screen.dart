import 'package:flutter/material.dart';

class productsScreenPage extends StatefulWidget {
  const productsScreenPage({ Key? key }) : super(key: key);

  @override
  _productsScreenPageState createState() => _productsScreenPageState();
}

class _productsScreenPageState extends State<productsScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Products Screen'),
      ),
    );
  }
}